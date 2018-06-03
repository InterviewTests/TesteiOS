# TextFieldFloatingPlaceholder

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Version](https://img.shields.io/cocoapods/v/TextFieldFloatingPlaceholder.svg?style=flat)](http://cocoapods.org/pods/TextFieldFloatingPlaceholder)
[![License](https://img.shields.io/cocoapods/l/TextFieldFloatingPlaceholder.svg?style=flat)](http://cocoapods.org/pods/TextFieldFloatingPlaceholder)
[![Platform](http://img.shields.io/badge/platform-iOS-blue.svg?style=flat
)](https://developer.apple.com/iphone/index.action)
![Swift](https://img.shields.io/badge/Swift-4.0-orange.svg)
## Demo
<img src="https://github.com/taiking/TextFieldFloatingPlaceholder/blob/master/Assets/demo.gif" align="center" width="400">

## How to
1. Add uitextfield to storyboard.
2. Inherit from TextFieldFloatingPlaceholder.
3. Optionally set the following properties.

| property | effect |
| ---- | ---- |
| `floatingPlaceholderMinFontSize` | Font size when raised |
| `floatintPlaceholderDuration` | Animation Duration |
| `floatingPlaceholderColor` | Font Color |
| `validationFalseLineEditingColor` | Underline color under editing and validation NG |
| `validationTrueLineEditingColor` | Underline color under editing and validation OK |
| `validationFalseLineColor` | Underline color under not editing and validation NG |
| `validationTrueLineColor` | Underline color under not editing and validation OK |
| `validation` | Varidation closure |
## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements
- iOS 9.0 or later
- Xcode 9.x
- Swift 4.x

## Installation

TextFieldFloatingPlaceholder supports installation via the package managers Carthage and CocoaPods.

### Carthage

- Add `github "taiking/TextFieldFloatingPlaceholder"` to your Cartfile.
- Run `carthage update`.

### CocoaPods

Add the followings to your Podfile:

```ruby
use_frameworks!
pod "TextFieldFloatingPlaceholder"
```

Run `pod install`.

## License

TextFieldFloatingPlaceholder is available under the MIT license. See the LICENSE file for more info.
