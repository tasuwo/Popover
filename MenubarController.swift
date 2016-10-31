//
//  MenubarController.swift
//  MenubarApplication
//
//  Created by tasuku tozawa on 2016/10/28.
//  Copyright © 2016年 tasuwo. All rights reserved.
//

import Foundation
import Cocoa

class MenubarController: NSObject {
    let view: StatusItemView
    
    override init() {
        self.view = StatusItemView()
    }
}
