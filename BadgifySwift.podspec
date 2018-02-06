Pod::Spec.new do |s|

  s.name         = "BadgifySwift"
  s.version      = "1.0.1"
  s.summary      = "A Swift UI framework for badge view that supports image as badge"
  s.homepage     = "https://github.com/maios/BadgifySwift"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.authors            = { "maios" => "mmai.iossg@gmail.com", "maimai" => "gigi10991@gmail.com" }
  s.platform     = :ios, "11.0"
  s.source       = { :git => "https://github.com/maios/BadgifySwift.git", :tag => "1.0.1" }
  s.source_files  = "Source/**/*.swift"
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4.0' }

end
