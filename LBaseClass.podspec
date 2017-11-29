Pod::Spec.new do |s|
  
  s.name                  = "LBaseClass"
  s.version               = "1.0.0"
  s.summary               = "summary of LBaseClass"
  s.description           = "description of LBaseClass"
  s.homepage              = "https://github.com/leeqiang250/iOS_LBaseClass"
  s.license               = "MIT"
  s.author                = { "leeqiang250" => "leeqiang250@163.com" }  
  s.source                = { :git => "https://github.com/leeqiang250/LBaseClass.git", :tag => s.version }
  s.source_files          = "LBaseClass/LBaseClass/LBaseClass/**/*.{h,m}"
  s.ios.deployment_target = "9.0"

end
