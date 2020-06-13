# PuzzleCropper
Puzzle cropper framework for iOS


<p align="center"><img src="https://i.imgur.com/7NNNfPe.jpg" width="460" height="361"/></p>

# Usage

```
let cropper = PuzzleCropper()
cropper.numberOfLines = 5
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
