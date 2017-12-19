Pod::Spec.new do |s|
  
  s.name                  = "LBaseClass"
  s.version               = "1.0.19"
  s.summary               = "summary of LBaseClass"
  s.description           = "description of LBaseClass"
  s.homepage              = "https://github.com/leeqiang250/iOS_LBaseClass"
  s.license               = "MIT"
  s.author                = { "leeqiang250" => "leeqiang250@163.com" }  
  s.platform              = :ios
  s.ios.deployment_target = '9.0'
  s.source                = { :git => "https://github.com/leeqiang250/iOS_LBaseClass.git", :tag => s.version }
  s.source_files          = "LBaseClass/LBaseClass/**/*.{h,m}"
  s.requires_arc          = true

end
