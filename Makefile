APP="Emojize"
# CONSTRUCT=xcodebuild -workspace $(APP).xcworkspace -scheme Emojize clean
# CONSTRUCT2=xcodebuild -workspace $(APP).xcworkspace -scheme Emojize clean
#
# install_deps:
# 	swift package fetch
# 	swift package generate-xcodeproj
# 	pod install
# create_config:
# 	# swift test
# wipe:
# 	rm -rf .build $(APP).xcodeproj $(APP).xcworkspace Package.pins Pods Podfile.lock
# test: wipe create_config install_deps
# 	# xcake make
# 	# swift test
# 	$(CONSTRUCT2) test | xcpretty
# build:
# 	$(CONSTRUCT) build | xcpretty
#
# APP="MyApp"
CONSTRUCT=xcodebuild -workspace $(APP).xcworkspace -scheme $(APP) clean
CONSTRUCT2=xcodebuild -workspace $(APP).xcworkspace -scheme $(APP)Tests clean

install_deps:
	swift package generate-xcodeproj
	pod install
create_config:
	# swift package fetch
wipe:
	rm -rf .build $(APP).xcodeproj $(APP).xcworkspace Package.pins Pods Podfile.lock Packages
	rm -r /Users/oleander/Library/Developer/Xcode/DerivedData
test: wipe install_deps
	$(CONSTRUCT2) test | xcpretty
build: wipe create_config install_deps
	$(CONSTRUCT) build | xcpretty