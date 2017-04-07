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
CONSTRUCT=xcodebuild -workspace $(APP).xcworkspace -scheme $(APP)
CONSTRUCT2=xcodebuild -workspace $(APP).xcworkspace -scheme $(APP)

install_deps:
	swift package generate-xcodeproj
	pod install --repo-update
create_config:
	# swift package fetch
wipe:
	swift package reset
	swift package clean
	rm -rf .build $(APP).xcodeproj $(APP).xcworkspace Package.pins Pods Podfile.lock Packages
	rm -rf /Users/oleander/Library/Developer/Xcode/DerivedData
# test: wipe install_deps
test: wipe install_deps
	$(CONSTRUCT2) test | xcpretty
ci: install_deps
	$(CONSTRUCT2) test
build: wipe install_deps
	$(CONSTRUCT) build | xcpretty