//
//  StatusItemView.swift
//  MenubarApplication
//
//  Created by tasuku tozawa on 2016/10/28.
//  Copyright © 2016年 tasuwo. All rights reserved.
//

import Cocoa
import Foundation

class StatusItemView: NSObject {
    let WIDTH: CGFloat = 24.4
    let statusItem: NSStatusItem

    override init() {
        self.statusItem = NSStatusBar.system().statusItem(withLength: WIDTH)

        if let button = statusItem.button {
            button.action = #selector(AppDelegate.togglePopover)
            button.image = NSImage(named: "StatusBarButtonImage")
        }
    }

    func getRect() -> NSRect {
        return statusItem.button!.window!.frame
    }
}
