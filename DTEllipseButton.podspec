Pod::Spec.new do |s|
  s.name         = "DTEllipseButton"
  s.version      = "0.0.6"
  s.summary      = "A button in ellipse shape with border and icon."

  s.description  = <<-DESC
  
  A button in ellipse shape with border and icon.
  It is similar to youtube capsule button that display category in trending tab. You can easily customize icon and color as UIButton do.
  
                   DESC

  s.homepage     = "https://github.com/keepsecretly/DTEllipseButton"

  s.license      = "MIT"
  s.author       = { "NiM Sopana" => "sopana.thiti@gmail.com" }

  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/keepsecretly/DTEllipseButton.git", :tag => "#{s.version}" }

  s.source_files  = "DTEllipseButton/DTEllipseButton/DTEllipseButton.h", "DTEllipseButton/DTEllipseButton/DTEllipseButton.m"
  s.framework  	  = "UIKit"
  s.requires_arc  = true

end
