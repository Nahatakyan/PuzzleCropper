Pod::Spec.new do |spec|
 
  spec.name         = "PuzzleCropper"
  spec.version      = "1.0.1"
  spec.summary      = "Puzzle cropper framework writted in Swift"

  spec.homepage     = "https://github.com/Nahatakyan/PuzzleCropper"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "Ruben Nahatakyan" => "rubennah@gmail.com" }

  spec.ios.deployment_target = "9"
  spec.swift_version = "5"

  spec.source        = { :git => "https://github.com/Nahatakyan/PuzzleCropper.git", :tag => "#{spec.version}" }
  spec.source_files  = "PuzzleCropper", "PuzzleCropper/**/*.{h,m,swift}"

end
