//
//  UIImage extension.swift
//  PuzzleCropper
//
//  Created by Ruben Nahatakyan on 6/13/20.
//  Copyright © 2020 WitPlex. All rights reserved.
//

import UIKit

extension UIImage {

    // MARK: Crop image
    public func cropImage(x: Int, y: Int, linesCount: Int, puzzleLineWidth: CGFloat) -> UIImage? {
        let layerWidth = self.size.width / CGFloat(linesCount)
        let path = UIBezierPath()

        path.drawPuzzlePath(x, y, linesCount, layerWidth)

        let imageSize = path.bounds.size
        let pathOrigin = path.bounds.origin

        path.apply(CGAffineTransform(translationX: -(pathOrigin.x), y: -(pathOrigin.y)))

        let originX = (CGFloat(x) * layerWidth + pathOrigin.x) * -1
        let originY = (CGFloat(y) * layerWidth + pathOrigin.y) * -1

        UIGraphicsBeginImageContextWithOptions(imageSize, false, 0)

        path.lineWidth = puzzleLineWidth
        path.addClip()

        self.draw(in: CGRect(origin: CGPoint(x: originX, y: originY), size: self.size))

        path.stroke()
        UIColor.black.setStroke()

        let croppedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return croppedImage
    }
}
