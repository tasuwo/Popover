//
//  AppDelegate.swift
//  MenubarApplication
//
//  Created by tasuku tozawa on 2016/10/29.
//  Copyright © 2016年 tasuwo. All rights reserved.
//

import Cocoa
import Foundation

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
            self.panelController.closePanel()
        } else {
            self.panelController.openPanel()
        }
    }

    func applicationDidResignActive(_ notification: Notification) {
        self.panelController.closePanel()
    }

    func statusItemViewRectForPanelController() -> NSRect {
        return self.menubarController.view.getRect()
    }
}

