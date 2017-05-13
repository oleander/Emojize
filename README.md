# Emojize [![Status](https://travis-ci.org/oleander/Emojize.svg?branch=master)](https://travis-ci.org/oleander/Emojize)

Swift 3 emoji parser for `String`, `NSAttributedString` and `NSMutableAttributedString`. It replaces sub strings on the form `":emoji:"` with its corresponding emoji character. The emoji lookup table is taken from [github/gemoji](https://github.com/github/gemoji).

## Usage

```swift
import Emojize

let string = "This is a :car:"
string.emojified // => "This is a 🚗"
NSMutableAttributedString(string: string).emojified.string // => "This is a 🚗"
NSAttributedString(string: string).emojified.string // => "This is a 🚗"
```

## Install

Add `pod 'Emojize'` to your `Podfile` and run `pod install`.
