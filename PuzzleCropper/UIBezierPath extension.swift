//
//  UIBezierPath extension.swift
//  PuzzleCropper
//
//  Created by Ruben Nahatakyan on 6/13/20.
//  Copyright © 2020 WitPlex. All rights reserved.
//

import UIKit

extension UIBezierPath {

    public func drawPuzzlePath(_ x: Int, _ y: Int, _ linesCount: Int, _ layerWidth: CGFloat) {
        let left = x == 0
        let right = x == (linesCount - 1)
        let top = y == 0
        let bottom = y == (linesCount - 1)

        let startPoint = CGPoint.zero
        move(to: startPoint)
        // top
        if !top {
            let clockwise = (x + y) % 2 == 0 ? false : true
            drawPuzzleLine(CGPoint(x: layerWidth, y: startPoint.y), clockwise, true)
        } else {
            addLine(to: CGPoint(x: layerWidth, y: startPoint.y))
        }

        // right
        if !right {
            let clockwise = (x + y) % 2 == 0 ? true : false
            drawPuzzleLine(CGPoint(x: layerWidth, y: layerWidth), clockwise, false)
        } else {
            addLine(to: CGPoint(x: layerWidth, y: layerWidth))
        }

        //bottom
        if !bottom {
            let clockwise = (x + y) % 2 == 0 ? false : true

            drawPuzzleLine(CGPoint(x: startPoint.x, y: layerWidth), clockwise, true)
        } else {
            addLine(to: CGPoint(x: startPoint.x, y: layerWidth))
        }

        // left
        if !left {
            let clockwise = (x + y) % 2 == 0 ? true : false
            drawPuzzleLine(startPoint, clockwise, false)
        }
        addLine(to: startPoint)
    }

    private func drawPuzzleLine(_ endPoint: CGPoint, _ clockwise: Bool, _ horizontal: Bool) {
        let startPoint = currentPoint
        let layerWidth = horizontal ? endPoint.x - startPoint.x: endPoint.y - startPoint.y

        let width50 = layerWidth.percent(50)
        let radius = layerWidth.percent(14.5)
        let radius90 = radius.percent(90)
        let radius45 = radius90 / 2
        let radius60 = radius.percent(60)
        let radius30 = radius60 / 2
        let radius15 = radius30 / 2

        if horizontal {
            let leftQuadCurveY = clockwise ? radius30 : -radius30
            let leftQuadCurveEnd = CGPoint(x: width50 - radius, y: leftQuadCurveY).plus(with: startPoint)
            let leftQuadCurveControl = CGPoint(x: (width50 - radius) / 2, y: leftQuadCurveY).plus(with: startPoint)
            addQuadCurve(to: leftQuadCurveEnd, controlPoint: leftQuadCurveControl)

            let leftCircleCenter = CGPoint(x: width50 - radius, y: 0).plus(with: startPoint)
            let leftCircleStartAngle = clockwise ? CGFloat(90).toRadians() : CGFloat(270).toRadians()
            let leftCircleEndAngle = CGFloat(0).toRadians()
            addArc(withCenter: leftCircleCenter, radius: radius30, startAngle: leftCircleStartAngle, endAngle: leftCircleEndAngle, clockwise: !clockwise)

            let leftCurveEnd = CGPoint(x: width50 - radius, y: clockwise ? -radius90 : radius90).plus(with: startPoint)
            let leftCurveYLine = width50 - radius + radius15
            let leftCurveControlPoint1 = CGPoint(x: leftCurveYLine + radius15, y: clockwise ? -radius15 : radius15).plus(with: startPoint)
            let leftCurveControlPoint2 = CGPoint(x: leftCurveYLine - radius15, y: clockwise ? -radius45 : radius45).plus(with: startPoint)
            addCurve(to: leftCurveEnd, controlPoint1: leftCurveControlPoint1, controlPoint2: leftCurveControlPoint2)

            let circleY = clockwise ? -radius * 2.2 : radius * 2.2
            let secondCircleControl = CGPoint(x: width50 + radius, y: circleY).plus(with: startPoint)
            let firstCircleControl = CGPoint(x: width50 - radius, y: circleY).plus(with: startPoint)
            let secondCircleEnd = CGPoint(x: width50 + radius, y: clockwise ? -radius90 : radius90).plus(with: startPoint)
            addCurve(to: secondCircleEnd, controlPoint1: firstCircleControl, controlPoint2: secondCircleControl)

            let rightCurveEnd = CGPoint(x: width50 + radius - radius30, y: 0).plus(with: startPoint)
            let rightCurveYLine = width50 + radius - radius15
            let rightCurveControlPoint1 = CGPoint(x: rightCurveYLine + radius15, y: clockwise ? -radius45 : radius45).plus(with: startPoint)
            let rightCurveControlPoint2 = CGPoint(x: rightCurveYLine - radius15, y: clockwise ? -radius15 : radius15).plus(with: startPoint)
            addCurve(to: rightCurveEnd, controlPoint1: rightCurveControlPoint1, controlPoint2: rightCurveControlPoint2)

            let rightCircleCenter = CGPoint(x: width50 + radius, y: 0).plus(with: startPoint)
            let rightCircleStartAngle = CGFloat(180).toRadians()
            let rightCircleEndAngle = clockwise ? CGFloat(90).toRadians() : CGFloat(270).toRadians()
            addArc(withCenter: rightCircleCenter, radius: radius30, startAngle: rightCircleStartAngle, endAngle: rightCircleEndAngle, clockwise: !clockwise)

            let rightQuadCurveControl = CGPoint(x: layerWidth - ((width50 - radius) / 2), y: leftQuadCurveY).plus(with: startPoint)
            addQuadCurve(to: endPoint, controlPoint: rightQuadCurveControl)
        } else {
            let leftQuadCurveY = clockwise ? -radius30 : radius30
            let topQuadCurveEnd = CGPoint(x: leftQuadCurveY, y: width50 - radius).plus(with: startPoint)
            let topQuadCurveControl = CGPoint(x: leftQuadCurveY, y: (width50 - radius) / 2).plus(with: startPoint)
            addQuadCurve(to: topQuadCurveEnd, controlPoint: topQuadCurveControl)

            let leftCircleCenter = CGPoint(x: 0, y: width50 - radius).plus(with: startPoint)
            let leftCircleStartAngle = clockwise ? CGFloat(180).toRadians() : CGFloat(0).toRadians()
            let leftCircleEndAngle = CGFloat(90).toRadians()
            addArc(withCenter: leftCircleCenter, radius: radius30, startAngle: leftCircleStartAngle, endAngle: leftCircleEndAngle, clockwise: !clockwise)

            let leftCurveEnd = CGPoint(x: clockwise ? radius90 : -radius90, y: width50 - radius).plus(with: startPoint)
            let leftCurveYLine = width50 - radius + radius15
            let leftCurveControlPoint1 = CGPoint(x: clockwise ? radius15 : -radius15, y: leftCurveYLine + radius15).plus(with: startPoint)
            let leftCurveControlPoint2 = CGPoint(x: clockwise ? radius45 : -radius45, y: leftCurveYLine - radius15).plus(with: startPoint)
            addCurve(to: leftCurveEnd, controlPoint1: leftCurveControlPoint1, controlPoint2: leftCurveControlPoint2)

            let circleY = clockwise ? radius * 2.2 : -radius * 2.2
            let secondCircleControl = CGPoint(x: circleY, y: width50 + radius).plus(with: startPoint)
            let firstCircleControl = CGPoint(x: circleY, y: width50 - radius).plus(with: startPoint)
            let secondCircleEnd = CGPoint(x: clockwise ? radius90 : -radius90, y: width50 + radius).plus(with: startPoint)
            addCurve(to: secondCircleEnd, controlPoint1: firstCircleControl, controlPoint2: secondCircleControl)

            let rightCurveEnd = CGPoint(x: 0, y: width50 + radius - radius30).plus(with: startPoint)
            let rightCurveYLine = width50 + radius - radius15
            let rightCurveControlPoint1 = CGPoint(x: clockwise ? radius45 : -radius45, y: rightCurveYLine + radius15).plus(with: startPoint)
            let rightCurveControlPoint2 = CGPoint(x: clockwise ? radius15 : -radius15, y: rightCurveYLine - radius15).plus(with: startPoint)
            addCurve(to: rightCurveEnd, controlPoint1: rightCurveControlPoint1, controlPoint2: rightCurveControlPoint2)

            let rightCircleCenter = CGPoint(x: 0, y: width50 + radius).plus(with: startPoint)
            let rightCircleStartAngle = CGFloat(270).toRadians()
            let rightCircleEndAngle = clockwise ? CGFloat(180).toRadians() : CGFloat(0).toRadians()
            addArc(withCenter: rightCircleCenter, radius: radius30, startAngle: rightCircleStartAngle, endAngle: rightCircleEndAngle, clockwise: !clockwise)

            let rightQuadCurveControl = CGPoint(x: leftQuadCurveY, y: layerWidth - ((width50 - radius) / 2)).plus(with: startPoint)
            addQuadCurve(to: endPoint, controlPoint: rightQuadCurveControl)
        }
    }
}


