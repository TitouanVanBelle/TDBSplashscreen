Pod::Spec.new do |s|
  s.name         = "TDBSplashscreen"
  s.version      = "1.0.0"
  s.platform     = :ios
  s.summary      = "TDBSplashscreen is a pod that allow you to show your splashscreen a little longer while loading new data into your app"
  s.homepage     = "https://github.com/TitouanVanBelle/TDBSplashscreen"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "Titouan Van Belle" => "titouan.vanbelle@gmail.com" }
  s.source       = { :git => "https://github.com/TitouanVanBelle/TDBSplashscreen.git", :tag => "1.0.0" }
  s.source_files = 'Classes/*.{h,m}'
  s.requires_arc = true
end