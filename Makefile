test:
	swift test --color always --parallel
build:
	swift build --color always
tag:
	git tag $(version)
	git push --tags
	git push origin master
release: tag
