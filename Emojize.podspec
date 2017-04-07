Pod::Spec.new do |s|
  s.name         = 'Emojize'
  # s.version      = `git describe --abbrev=0 --tags`.strip
  s.version      = "10.1.1"
  s.summary      = "Extension for Swift's String to convert Emoji Cheat Sheet codes into their Unicode equivalent"
  s.description = "Extension for Swift's String to convert Emoji Cheat Sheet codes into their Unicode equivalent."
  s.homepage     = 'https://github.com/oleander/Emoijze'
  s.license      = 'MIT'
  s.author = { 'Linus Oleander' => 'linus@oleander.io' }
  s.platform = :osx, '10.10'
  s.source = { git: 'https://github.com/oleander/Emoijze.git', tag: s.version.to_s }
  s.resource = 'Resources/emoji.json'
  # s.preserve_path = "Resources/emoji.json"
  # s.resource_bundles = {
  #   "Emojize" => "Resources/emoji.json" ,
  #   "EmojizeTests" => "Resources/emoji.json"
  # }
  # s.resources = ["Resources/emoji.json"]
  # s.osx.resources = ["Resources/emoji.json"]

  # s.resource_bundle = { 'Hello' => 'MapView/Map/Resources/*.png' }
  # s.resource_bundle = {
  #   'Hello' => ['Resources/emoji.json']
  # }

  # s.source_files = ['Source']
end
