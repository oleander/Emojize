target 'Emojize-macOS' do
  platform :osx, '10.10'
  use_frameworks!

  pod 'Files'
  pod 'SwiftyJSON'
  pod 'SwiftyTimer'
  pod 'FootlessParser', git: 'https://github.com/kareman/FootlessParser.git'

  target 'Emojize-macOS Tests' do
    inherit! :search_paths
    pod 'Quick'
    pod 'Nimble'
  end
end
