project.name = "Emojize"
project.class_prefix = "APP"

application_for :osx, "10.10" do |target|
  target.name = "Emojize"
  target.all_configurations.each do |c|
    c.product_bundle_identifier = "com.yourcompany.yourapp"
    c.settings["INFOPLIST_FILE"] = "Resources/Info.plist"
    c.settings["SWIFT_VERSION"] = 3.1
    c.settings["MACOSX_DEPLOYMENT_TARGET"] = "10.10"
  end

  target.include_files << "Resources/emoji.json"
  target.include_files << "Source/*.*"

  unit_tests_for target do |cc|
    cc.name = "EmojizeTests"
    cc.all_configurations.each do |c|
      c.settings["INFOPLIST_FILE"] = "Resources/Info.plist"
      c.settings["SWIFT_VERSION"] = 3.1
      c.settings["MACOSX_DEPLOYMENT_TARGET"] = "10.10"
    end
    cc.include_files = ["Tests/*.*"]
  end
end
