Pod::Spec.new do |s|
  s.name         = 'Emojize'
  s.version      = '6.0.9'
  s.summary      = "Swift 3 emoji parser for String, NSAttributedString and NSMutableAttributedString."
  s.description = "Swift 3 emoji parser for String, NSAttributedString and NSMutableAttributedString. It replaces sub strings on the form :emoji: with its corresponding emoji character. The emoji lookup table is taken from github/gemoji."
  s.homepage     = 'https://github.com/oleander/Emojize'
  s.license      = 'MIT'
  s.author = { 'Linus Oleander' => 'linus@oleander.io' }
  s.platform = :osx, '10.10'
  s.source = { git: 'https://github.com/oleander/Emojize.git', tag: s.version.to_s }
  s.resources = ['Resources/emoji.json']
  s.source_files = 'Emojize/**/*.swift'
  s.dependency 'JASON'
  s.dependency 'FootlessParser'
end
