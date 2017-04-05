run_test:
	swift test --color always --parallel
test: package run_test
	mv Package.swift.back Package.swift
	mv Package.swift .Package.test.swift
build:
	swift build --color always
tag:
	git tag $(version)
	git push --tags
	git push origin master
release: tag
package:
	mv Package.swift Package.swift.back
	mv .Package.test.swift Package.swift
ci: package run_test

