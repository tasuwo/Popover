//
//  AppDelegate.swift
//  todolist
//
//  Created by tasuku tozawa on 2016/10/28.
//  Copyright © 2016年 tasuwo. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate, PanelControllerDelegate {

    @IBOutlet weak var window: NSWindow!
    var menubarController: MenubarController!
    var panelController: PanelController!

    func applicationDidFinishLaunching(_ Notification: Notification) {
        self.menubarController = MenubarController()
        self.panelController = PanelController(delegate: self)
    }

    func togglePopover() {
        if self.panelController.window!.isVisible {
            self.menubarController.view.setHighlight(isHighlighted: false)
            self.panelController.closePanel()
        } else {
            self.menubarController.view.setHighlight(isHighlighted: true)
            self.panelController.openPanel()
        }
    }

    func statusItemViewRectForPanelController() -> NSRect {
        return self.menubarController.view.getRect()
    }
}

