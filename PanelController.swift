//
//  PanelController.swift
//  MenubarApplication
//
//  Created by tasuku tozawa on 2016/10/28.
//  Copyright © 2016年 tasuwo. All rights reserved.
//

import Cocoa
import Foundation

protocol PanelControllerDelegate {
    func statusItemViewRectForPanelController() -> NSRect
}

class PanelController: NSWindowController, NSWindowDelegate {
    let POPUP_HIEGHT = 122
    let RIGHT_MARGIN: CGFloat = 8
    let ARROW_X: CGFloat = 12

    var delegate: PanelControllerDelegate?
    var baseView: PanelBase?

    convenience init(delegate: PanelControllerDelegate?) {
        let panel = NSWindow(contentViewController: PanelBaseController())
        self.init(window: panel)

        panel.hasShadow = false
        panel.styleMask = [.borderless]
        panel.acceptsMouseMovedEvents = true
        panel.isOpaque = false
        panel.backgroundColor = .clear

        self.delegate = delegate
        self.baseView = panel.contentView as? PanelBase
    }

    func openPanel() {
        let panel = self.window!

        let screenRect = NSScreen.screens()!.first!.frame
        let statusRect = self.delegate!.statusItemViewRectForPanelController()
        var panelRect = self.window!.frame
        panelRect.origin.x = statusRect.minX
        panelRect.origin.y = statusRect.midY - panelRect.height

        if panelRect.maxX > screenRect.maxX {
            self.baseView?.backgroundView.setArrowX(value: ARROW_X + (panelRect.maxX - screenRect.maxX + RIGHT_MARGIN))
            panelRect.origin.x = screenRect.maxX - panelRect.width - RIGHT_MARGIN
        } else {
            self.baseView?.backgroundView.setArrowX(value: ARROW_X)
        }

        panel.setFrame(panelRect, display: true, animate: true)

        self.window?.alphaValue = 0
        self.window?.makeKeyAndOrderFront(nil)
        NSAnimationContext.runAnimationGroup({ (context) -> Void in
            context.duration = 0.3
            self.window?.animator().alphaValue = 1
            }, completionHandler: nil
        )
        NSApp.activate(ignoringOtherApps: true)
    }

    func closePanel() {
        NSAnimationContext.runAnimationGroup({ (context) -> Void in
            context.duration = 0.3
            self.window?.animator().alphaValue = 0
            }, completionHandler: { self.window?.orderOut(self) }
        )
    }
}
