APP=Emojize
CONSTRUCT=xcodebuild -workspace $(APP).xcworkspace -scheme $(APP)

install_deps:
	pod install --verbose
test: wipe install_deps plain_test
	ci: install_deps
	$(CONSTRUCT) test
build: install_deps
	$(CONSTRUCT) build | xcpretty
plain_test:
	/usr/bin/xcodebuild -workspace Emojize.xcworkspace -scheme Emojize test
