//
//  CGFloat extension.swift
//  PuzzleCropper
//
//  Created by Ruben Nahatakyan on 6/13/20.
//  Copyright © 2020 WitPlex. All rights reserved.
//

import UIKit

extension CGFloat {
    func toRadians() -> CGFloat {
        return self * CGFloat.pi / 180.0
    }

    func percent(_ percent: CGFloat) -> CGFloat {
        return self * percent / 100
    }
}
