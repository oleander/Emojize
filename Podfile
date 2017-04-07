project "Emojize.xcodeproj"
target 'Emojize' do
  podspec path: '/Users/oleander/Documents/Projekt/emojize/Emojize.podspec'
  platform :osx, '10.10'
  # project "Emojize.xcodeproj"
  use_frameworks!
  # pod "Emojize", path: Dir.pwd
  # target "Emojize2", path: Dir.pwd

  target 'EmojizeTests' do
    inherit! :search_paths
    pod 'Quick'
    pod 'Nimble'
  end
  pod 'SwiftyTimer', :git => 'https://github.com/oleander/SwiftyTimer.git'
  pod 'SwiftyTimer', :git => 'https://github.com/oleander/SwiftyTimer.git'
  pod 'SwiftyTimer', :git => 'https://github.com/oleander/SwiftyTimer.git'
  pod 'FootlessParser', :git => 'https://github.com/oleander/FootlessParser.git'
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