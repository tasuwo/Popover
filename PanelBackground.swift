//
//  PanelBackGround.swift
//  MenubarApplication
//
//  Created by tasuku tozawa on 2016/10/28.
//  Copyright © 2016年 tasuwo. All rights reserved.
//

import Cocoa
import Foundation

class PanelBackground: NSView {
    let LINE_THICKNESS: CGFloat = 1.0
    let CORNER_RADIUS:  CGFloat = 6.0
    let ARROW_WIDTH:    CGFloat = 10.0
    let ARROW_HEIGHT:   CGFloat = 10.0
    let FILL_OPACITY:   CGFloat = 0.9
    let STROKE_OPACITY: CGFloat = 0.0

    var arrowX_: CGFloat = 10.0

    func setArrowX(value: CGFloat) {
        arrowX_ = value
        self.needsDisplay = true
    }

    /*
      ⑧  ⑨  ①  ②
       ┏━━^-━┓
     ⑦┃        ┃③
       ┗━━━━┛
      ⑥    ⑤    ④
     */
    override func draw(_ dirtyRect: NSRect) {
        let contentRect = NSInsetRect(self.bounds, LINE_THICKNESS, LINE_THICKNESS)

        let path = NSBezierPath()

        // ①
        path.move(to: NSMakePoint(arrowX_, contentRect.maxY))
        path.line(to: NSMakePoint(arrowX_ + ARROW_WIDTH / 2,
                                  contentRect.maxY - ARROW_HEIGHT))
        path.line(to: NSMakePoint(contentRect.maxX - CORNER_RADIUS,
                                  contentRect.maxY - ARROW_HEIGHT))

        // ②
        let topRightCorner = NSMakePoint(contentRect.maxX,
                                         contentRect.maxY - ARROW_HEIGHT)
        path.curve(to: NSMakePoint(contentRect.maxX,
                                   contentRect.maxY - ARROW_HEIGHT - CORNER_RADIUS),
                   controlPoint1: topRightCorner,
                   controlPoint2: topRightCorner)

        // ③
        path.line(to: NSMakePoint(contentRect.maxX,
                                  contentRect.minY + CORNER_RADIUS))

        // ④
        let bottomRightCorner = NSMakePoint(contentRect.maxX,
                                            contentRect.minY)
        path.curve(to: NSMakePoint(contentRect.maxX - CORNER_RADIUS,
                                   contentRect.minY),
                   controlPoint1: bottomRightCorner,
                   controlPoint2: bottomRightCorner)

        // ⑤
        path.line(to: NSMakePoint(contentRect.minX + CORNER_RADIUS,
                                  contentRect.minY))

        // ⑥
        path.curve(to: NSMakePoint(contentRect.minX,
                                   contentRect.minY + CORNER_RADIUS),
                   controlPoint1: contentRect.origin,
                   controlPoint2: contentRect.origin)

        // ⑦
        path.line(to: NSMakePoint(contentRect.minX,
                                  contentRect.maxY - ARROW_HEIGHT - CORNER_RADIUS))

        // ⑧
        let topLeftCorner = NSMakePoint(contentRect.minX,
                                        contentRect.maxY - ARROW_HEIGHT)
        path.curve(to: NSMakePoint(contentRect.minX + CORNER_RADIUS,
                                   contentRect.maxY - ARROW_HEIGHT),
                   controlPoint1: topLeftCorner,
                   controlPoint2: topLeftCorner)

        // ⑨
        path.line(to: NSMakePoint(arrowX_ - ARROW_WIDTH / 2,
                                  contentRect.maxY - ARROW_HEIGHT))

        path.close()
        
        NSColor(deviceWhite: 1, alpha: FILL_OPACITY).setFill()
        path.fill()

        NSGraphicsContext.saveGraphicsState()

        let clip = NSBezierPath(rect: self.bounds)
        clip.append(path)
        clip.addClip()

        path.lineWidth = LINE_THICKNESS * 2
        NSColor.black.setStroke()
        path.stroke()

        NSGraphicsContext.restoreGraphicsState()
    }
}
