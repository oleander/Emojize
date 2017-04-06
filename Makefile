APP="Emojize"
CONSTRUCT=xcodebuild -workspace $(APP).xcworkspace -scheme Emojize-Release clean
CONSTRUCT2=xcodebuild -workspace $(APP).xcworkspace -scheme Emojize-Release clean

install_deps:
	xcake make
	swift package fetch
	pod install
create_config:
	# swift test
wipe:
	rm -rf .build $(APP).xcodeproj $(APP).xcworkspace Package.pins Pods Podfile.lock
test: wipe create_config install_deps
	# xcake make
	# swift test
	$(CONSTRUCT2) test | xcpretty
build:
	$(CONSTRUCT) build | xcpretty