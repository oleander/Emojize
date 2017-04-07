target 'Emojize' do
  use_frameworks!
  platform :osx, '10.10'
  pod 'SwiftyTimer', git: 'https://github.com/oleander/SwiftyTimer.git'
  pod 'SwiftyJSON', git: 'https://github.com/SwiftyJSON/SwiftyJSON.git'
  pod 'Files', git: 'https://github.com/JohnSundell/Files.git'
  pod 'FootlessParser', git: 'https://github.com/oleander/FootlessParser.git'
  pod 'Emojize', podspec: File.join(File.dirname(__FILE__), "Emojize.podspec")

  target 'EmojizeTests' do
    inherit! :search_paths
    pod 'Quick'
    pod 'Nimble'
  end
end
