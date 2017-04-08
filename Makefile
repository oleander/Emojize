APP="Emojize"
CONSTRUCT=xcodebuild -workspace $(APP).xcworkspace -scheme $(APP)
CONSTRUCT2=xcodebuild -workspace $(APP).xcworkspace -scheme $(APP)

install_deps:
	swift package generate-xcodeproj
	pod install --repo-update
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