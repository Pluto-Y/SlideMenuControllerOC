Pod::Spec.new do |s|
  s.name         	  = "SlideMenuControllerOC"
  s.version      	  = "1.0.1"
  s.summary      	  = "iOS Slide View based on iQON, Feedly, Google+, Ameba iPhone app."
  s.homepage     	  = "https://github.com/Pluto-Y/SlideMenuControllerOC"
  s.license     	  = { :type => "MIT", :file => "LICENSE" }
  s.author             	  = { "Pluto Y" => "kuaileainits@163.com" }
  s.social_media_url   	  = "http://weibo.com/plutoy0504"
  s.platform     	  = :ios
  s.ios.deployment_target = "7.0"
  s.source       	  = { :git => "https://github.com/Pluto-Y/SlideMenuControllerOC.git", :tag => "2.1.0" }
  s.source_files  	  = "Source/*"
  s.requires_arc 	  = true
end

