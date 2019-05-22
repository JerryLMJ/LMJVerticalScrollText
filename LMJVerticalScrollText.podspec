Pod::Spec.new do |s|
s.name         = 'LMJVerticalScrollText'
s.version      = '3.0.0'
s.summary      = 'An easy way to use vertical-scroll-text'
s.homepage     = 'https://github.com/MajorLMJ/LMJVerticalScrollText'
s.license      = {:type => 'MIT', :file => 'LICENSE' }
s.authors      = {'limingjie' => 'limingjie_mail@163.com'}
s.platform     = :ios, '8.0'
s.source       = {:git => 'https://github.com/MajorLMJ/LMJVerticalScrollText.git', :tag => s.version}
s.source_files = 'LMJVerticalScrollText/**/*'
s.requires_arc = true
end
