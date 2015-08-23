# NetReachability

Just use one simple func to check the reachability to specified host.

## Requirements

* iOS 8.0+
* Xcode 7.0 beta
* Swift 2.0

### CocoaPods

CocoaPods 0.38 adds supports for Swift and embedded frameworks. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate NetReachability into your Xcode project using CocoaPods, specify it in your `Podfile`:

```
platform :ios, '8.0'
use_frameworks!

pod 'NetReachability'
```

Then, run the following command:

```bash
$ pod install
```

You should open the {Project}.xcworkspace instead of the {Project}.xcodeproj after you installed anything from CocoaPods.

For more information about how to use CocoaPods, I suggest [this tutorial](http://www.raywenderlich.com/64546/introduction-to-cocoapods-2).

## Usage

* define reachability variable

```swift
private lazy var reachability: NetReachability = NetReachability(hostname: "www.baidu.com")
```

* add notification

```swift
NSNotificationCenter.defaultCenter().addObserver(self, selector: "statusChanged", name: FFReachabilityChangedNotification, object: nil)
reachability.startNotifier()
```

* remove notification

```swift
reachability.stopNotifier()
NSNotificationCenter.defaultCenter().removeObserver(self, name: FFReachabilityChangedNotification, object: nil)
```

* observer func 

```swift
func statusChanged() {
    print(reachability.currentReachabilityStatus)
}
```

## Refrence

https://developer.apple.com/library/ios/samplecode/Reachability/Reachability.zip
