target 'Emojize' do
  use_frameworks!
  pod 'SwiftyTimer', git: 'https://github.com/oleander/SwiftyTimer.git'
  pod 'Files', git: 'https://github.com/JohnSundell/Files.git'
  pod 'SwiftyJSON', git: 'https://github.com/SwiftyJSON/SwiftyJSON.git'
  pod 'Files', git: 'https://github.com/JohnSundell/Files.git'
  pod 'FootlessParser', git: 'https://github.com/oleander/FootlessParser.git'
  pod 'Emojize', path: Dir.pwd

  platform :osx, '10.10'

  target 'EmojizeTests' do
    inherit! :search_paths
    pod 'Quick'
    pod 'Nimble'
  end
end
