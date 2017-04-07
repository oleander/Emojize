Pod::Spec.new do |s|
  s.name         = 'Emojize'
  s.version      = '3.0.7'
  s.summary      = "Extension for Swift's String to convert Emoji Cheat Sheet codes into their Unicode equivalent"
  s.description = "Extension for Swift's String to convert Emoji Cheat Sheet codes into their Unicode equivalent."
  s.homepage     = 'https://github.com/oleander/Emoijze'
  s.license      = 'MIT'
  s.author = { 'Linus Oleander' => 'linus@oleander.io' }
  s.platform = :osx, '10.10'
  # s.osx.deployment_target = '10.10'
  s.source = { git: 'https://github.com/oleander/Emoijze.git', tag: s.version.to_s }
  # s.source_files = 'Source'
  s.resource = 'Resources/emoji.json'
  # s.prepare_command = "swift package clean && swift package fetch && swift package generate-xcodeproj"
end
