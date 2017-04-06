APP="Emojize"
CONSTRUCT=xcodebuild -workspace $(APP).xcworkspace -scheme $(APP) clean

install_deps:
	pod install
create_config:
	swift package fetch
	swift package generate-xcodeproj
wipe:
	rm -rf .build $(APP).xcodeproj $(APP).xcworkspace Package.pins Pods Podfile.lock
test: wipe create_config install_deps
	$(CONSTRUCT) test | xcpretty
build: wipe create_config install_deps
	$(CONSTRUCT) build | xcpretty