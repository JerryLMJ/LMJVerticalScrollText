Pod::Spec.new do |s|
s.name         = 'LMJVerticalScrollText'
s.version      = '3.0.1'
s.summary      = 'An easy way to use vertical-scroll-text'
s.homepage     = 'https://github.com/JerryLMJ/LMJVerticalScrollText'
s.license      = {:type => 'MIT', :file => 'LICENSE' }
s.authors      = {'JerryLMJ' => 'limingjie_mail@163.com'}
s.platform     = :ios, '8.0'
s.source       = {:git => 'https://github.com/JerryLMJ/LMJVerticalScrollText.git', :tag => s.version}
s.source_files = 'LMJVerticalScrollText/**/*'
s.requires_arc = true
end
