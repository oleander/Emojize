test:
	pod install --verbose --repo-update
	xcodebuild -workspace Emojize.xcworkspace -scheme Emojize clean test | xcpretty
lint:
	pod lib lint
