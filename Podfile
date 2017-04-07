xcodeproj "Emojize.xcodeproj"
target 'Emojize' do
  # pod "Emojize", path: Dir.pwd
  pod 'Emojize', path: '/Users/oleander/Documents/Projekt/emojize'
  platform :osx, '10.10'
  use_frameworks!

  target 'EmojizeTests' do
    inherit! :search_paths
    pod 'Quick'
    pod 'Nimble'
  end
end

# pre_install do |installer|
#   Executable.execute_command 'swift', ['package', 'fetch']
#   Executable.execute_command 'swift', ['package', 'generate-xcodeproj']
# end