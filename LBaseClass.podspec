Pod::Spec.new do |s|
  
  s.name                  = "LBaseClass"
  s.version               = "0.0.1"
  s.summary               = ""
  s.description           = ""
  s.homepage              = "https://github.com/leeqiang250/iOS_LBaseClass"
  s.license               = "MIT"
  s.author                = { "leeqiang250" => "leeqiang250@163.com" }  
  s.source                = { :git => "https://github.com/leeqiang250/LBaseClass.git", :tag => "#{s.version}" }
  s.source_files          = LBaseClass/**/*.{h,m}"
  s.ios.deployment_target = "9.0"

end
