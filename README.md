# PuzzleCropper
Puzzle cropper framework for iOS

# Usage

```
let cropper = PuzzleCropper()
cropper.numberOfLines = lineCount
cropper.puzzleLineWidth = 1
cropper.cropImage(image, thread: DispatchQueue.global()) { (puzzles) in
    // Here your puzzles
}
```

# Installation
Using cocoapod

```
target 'MyApp' do
  pod 'PuzzleCropper'
end
```
