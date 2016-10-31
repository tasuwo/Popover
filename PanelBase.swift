//
//  PanelBase.swift
//  MenubarApplication
//
//  Created by tasuku tozawa on 2016/10/28.
//  Copyright © 2016年 tasuwo. All rights reserved.
//

import Cocoa
import Foundation

class PanelBase: NSView {
    @IBOutlet var backgroundView: PanelBackground!
    @IBOutlet var baseView: NSView!

    convenience init() {
        self.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
       
        Bundle.main.loadNibNamed("PanelBase", owner: self, topLevelObjects: nil)
        self.frame = self.backgroundView.frame
        addSubview(self.backgroundView)
        addSubview(self.baseView)
    }
}
