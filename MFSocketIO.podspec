Pod::Spec.new do |spec|

  spec.name         = "MFSocketIO"
  spec.version      = "1.0.2"
  spec.summary      = "MFSocketIO is socket module that handle some coneection with socket."
  spec.description  = "MFSocketIO is socket module that handle Chat & Location Driver. with maree and will need it to support another framework."
  spec.homepage     = "https://github.com/afathe7090/MFSocketIO"
  spec.license      = "MIT"
  spec.author       = { "Ahmed Fathy" => "afathe7090" }
  spec.platform     = :ios, "13.0"
  spec.source       = { :git => "https://github.com/afathe7090/MFSocketIO.git", :tag => spec.version.to_s }
  spec.source_files   = "Sources/MFSocketIO"
  spec.swift_versions = "5.9"

end
