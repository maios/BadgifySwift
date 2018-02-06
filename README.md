# BadgifySwift
Badge this. Badge that.

A Swift version of [GIBadgeView](https://github.com/gemr/Sheriff) that also supports UIImage as badge.

## Requirements
* Xcode 9
* Swift 4.0

## Installations
BadgifySwift can be installed via CocoaPods or manual

### CocoaPods
Before you start, make sure you have installed CocoaPods, you can follow the instructions [here](http://guides.cocoapods.org/using/getting-started.html#installation).

To integrate BadgifySwift into your Xcode project using CocoaPods, specify it in your Podfile:
```
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'BadgifySwift'
end
```
## Usage
```
import BadgifySwift

let badgeView = BadgeView()
myView.addSubview(badgeView)

// Set badge value
badgeView.badgeValue = 10

// Set badge image
badgeView.badgeImage = myImage

// Increment / Decrement
badgeView.increment()
badgeView.decrement()
```
