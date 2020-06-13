//
//  PuzzleCropper.swift
//  PuzzleCropper
//
//  Created by Ruben Nahatakyan on 6/13/20.
//  Copyright © 2020 WitPlex. All rights reserved.
//

import UIKit

open class PuzzleCropper: NSObject {

    // MARK: - Properties
    open var numberOfLines: Int = 5
    open var puzzleLineWidth: CGFloat = 2

    // MARK: - Init
    public override init() { }

}

// MARK: - Public methods
extension PuzzleCropper {


    // MARK: Crop image
    public func cropImage(_ image: UIImage, thread: DispatchQueue, puzzles: @escaping(([UIImage]) -> Void)) {
        var images: [UIImage] = []
        let range = 0..<self.numberOfLines

        thread.async {
            for x in range { for y in range {
                if let puzzleItem = image.cropImage(x: x, y: y, linesCount: self.numberOfLines, puzzleLineWidth: self.puzzleLineWidth) {
                    images.append(puzzleItem)
                }
                if x == range.last && y == range.last {
                    puzzles(images)
                }
            } }
        }
    }
}
