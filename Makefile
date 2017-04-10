APP=Emojize
CONSTRUCT=xcodebuild -workspace $(APP).xcworkspace -scheme $(APP)

install_deps:
	pod install --verbose
wipe:
	# rm -rf /Users/oleander/Library/Developer/Xcode/DerivedData
	# rm -rf .build Package.pins Pods Podfile.lock Packages
test: wipe install_deps plain_test
	ci: install_deps
	$(CONSTRUCT) test
build: wipe install_deps
	$(CONSTRUCT) build | xcpretty
plain_test:
	/usr/bin/xcodebuild -workspace Emojize.xcworkspace -scheme Emojize test
