//
//  CGPoint extension.swift
//  PuzzleCropper
//
//  Created by Ruben Nahatakyan on 6/13/20.
//  Copyright © 2020 WitPlex. All rights reserved.
//

import UIKit

extension CGPoint {
    
    func plus(with: CGPoint) -> CGPoint {
        return CGPoint(x: self.x + with.x, y: self.y + with.y)
    }

    func minus(with: CGPoint) -> CGPoint {
        return CGPoint(x: self.x - with.x, y: self.y - with.y)
    }
}
