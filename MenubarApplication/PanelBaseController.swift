//
//  PanelBaseController.swift
//  MenubarApplication
//
//  Created by tasuku tozawa on 2016/10/29.
//  Copyright © 2016年 tasuwo. All rights reserved.
//

import Cocoa
import Foundation

class PanelBaseController: NSViewController {
    override func loadView() {
        self.view = PanelBase()
    }
}
