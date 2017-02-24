Pod::Spec.new do |s|
  s.name         = 'Emojize'
  s.version      = '2.0'
  s.summary      = "Extension for Swift's String to convert Emoji Cheat Sheet codes into their Unicode equivalent."
  s.description  = "Extension for Swift's String to convert Emoji Cheat Sheet codes into their Unicode equivalent"
  s.homepage     = 'https://github.com/oleander/Emoijze'
  s.license      = { type: 'MIT', file: 'LICENSE' }
  s.author             = { 'Linus Oleander' => 'linus@oleander.io' }
  s.social_media_url   = ''
  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.9'
  s.watchos.deployment_target = '2.0'
  s.tvos.deployment_target = '9.0'
  s.source = { git: 'https://github.com/oleander/Emoijze.git', tag: s.version.to_s }
  s.source_files = 'Sources/**/*'
  s.frameworks = 'Foundation'

  s.dependency 'Files'
  s.dependency 'SwiftyJSON'
  s.dependency 'SwiftyTimer'
  s.dependency 'Quick'
  s.dependency 'Nimble'
  s.dependency 'FootlessParser', git: 'https://github.com/kareman/FootlessParser.git'
end
