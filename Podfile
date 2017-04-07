project "Emojize.xcodeproj"
target 'Emojize' do
  use_frameworks!
  pod 'SwiftyTimer', git: 'https://github.com/oleander/SwiftyTimer.git'
  pod 'Files', git: 'https://github.com/JohnSundell/Files.git'
  pod 'SwiftyJSON', git: 'https://github.com/SwiftyJSON/SwiftyJSON.git'
  pod 'Files', git: 'https://github.com/JohnSundell/Files.git'
  pod 'FootlessParser', git: 'https://github.com/oleander/FootlessParser.git'
  podspec path: File.join(Dir.pwd, 'Emojize.podspec')

  platform :osx, '10.10'

  target 'EmojizeTests' do
    inherit! :search_paths
    pod 'Quick'
    pod 'Nimble'
  end
end

# post_install do |installer|
#   installer.pods_project.targets.each do |target|
#     target.build_configurations.each do |config|
#       config.build_settings['SWIFT_VERSION'] = '3.1'
#     end
#   end
# end
# pre_install do |installer|
#   Executable.execute_command 'swift', ['package', 'fetch']
#   Executable.execute_command 'swift', ['package', 'generate-xcodeproj']
# end
