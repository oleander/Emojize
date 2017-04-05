test:
	swift test --color always --parallel
build:
	swift build --color always
tag:
	git tag $(version)
	git push --tags
	git push origin master
release: tag
package:
	rm Package.swift
	mv Package.test.swift Package.swift
ci: package test

