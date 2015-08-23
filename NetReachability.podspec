Pod::Spec.new do |s|
  s.name         = "NetReachability"
  s.version      = "0.0.1"
  s.summary      = "Check Internet Reachability in Swift"
  s.homepage     = "https://github.com/liufan321/NetReachability"
  s.license      = "MIT"
  s.author       = { "Fan Liu" => "liufan321@gmail.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/liufan321/NetReachability.git", :tag => s.version }
  s.source_files  = "Source/*.swift"
  s.requires_arc = true
end
