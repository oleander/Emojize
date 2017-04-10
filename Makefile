APP=Emojize
CONSTRUCT=xcodebuild -workspace $(APP).xcworkspace -scheme $(APP)

install_deps:
	# swift package generate-xcodeproj
	# pod install --repo-update --verbose
	pod install --verbose
wipe:
	# swift package reset
	# swift package clean
	# rm -rf .build $(APP).xcodeproj $(APP).xcworkspace Package.pins Pods Podfile.lock Packages
	rm -rf /Users/oleander/Library/Developer/Xcode/DerivedData
	rm -rf .build Package.pins Pods Podfile.lock Packages
test: wipe install_deps plain_test
	# xcodebuild -workspace Emojize.xcworkspace -scheme EmojizeTests test | xcpretty
ci: install_deps
	$(CONSTRUCT) test
build: wipe install_deps
	$(CONSTRUCT) build | xcpretty
plain_test:
	/usr/bin/xcodebuild -workspace Emojize.xcworkspace -scheme Emojize test
