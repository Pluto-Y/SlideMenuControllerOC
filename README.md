SlideMenuControllerOC
========================

[![Platform](http://img.shields.io/badge/platform-ios-blue.svg?style=flat
)](https://developer.apple.com/iphone/index.action)
[![Language](http://img.shields.io/badge/language-ObjectiveC-brightgreen.svg?style=flat
)](https://developer.apple.com/swift)
[![License](http://img.shields.io/badge/license-MIT-lightgrey.svg?style=flat
)](http://mit-license.org)
[![Issues](https://img.shields.io/github/issues/Pluto-Y/SlideMenuControllerOC.svg?style=flat
)](https://github.com/dekatotoro/SlideMenuControllerSwift/issues?state=open)

___

This project is inspired by the popular [SlideMenuControllerSwift](https://github.com/dekatotoro/SlideMenuControllerSwift).It provides someone who just developed and someone who needs to support iOS7 even iOS6. And this poroject will be synchronizes with `SlideMenuControllerSwift`.

iOS Slide View based on iQON, Feedly, Google+, Ameba iPhone app.

![sample](Screenshots/SlideMenuControllerSwift3.gif)
___
##Installation

####CocoaPods
```
pod 'SlideMenuControllerOC'
```

####Manually
Add the `SlideMenuController.h` and `SlideMenuController.m` file to your project. 
___
##Usage

###Setup

Add `#import "SlideMenuController.h"` in your file

In your app delegate:

```objective-c

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    // create viewController code...
        
    SlideMenuController *slideMenuController = [[SlideMenuController alloc] initWithMainViewController:nvc leftMenuViewController:leftViewController rightMenuViewController:rightViewController];
    self.window.rootViewController = slideMenuController;
    [self.window makeKeyWindow];

    return YES;
}
```

####Storyboard Support

1. Inherit `SlideMenuController` and put UIViewController in a storyboard.
2. Override `awakeFromNib`, then instantiate any view controllers

```objective-c
@implementation ContainerViewController: SlideMenuController

-(void)awakeFromNib {
    UIViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"Main"];
    if (controller != nil) {
        self.mainViewController = controller;
    }
    UIViewController *leftMenu = [self.storyboard instantiateViewControllerWithIdentifier:@"Left"];
    if (leftMenu != nil) {
        self.leftViewController = controller;
    }
    [super awakeFromNib];
}

@end
```

If you want to use the custom option, please set them by the instance properties, like so:
> Note: This is difference from `SlideMenuControllerSwift`.

```objective-c
self.slideMenuController.option.leftViewWitdth = 50;
self.slideMenuController.option.contentViewScale = 0.5;
...
    
```

###You can access from UIViewController

```objective-c
self.slideMenuController
```
or
```objective-c
SlideMenuController *slideMenuController = self.slideMenuController;
if (slideMenuController != nil) {
    // some code
}
```
### add navigationBarButton 
```objective-c
[viewController addLeftBarButtonWithImage:[UIImage imageNamed:@"hoge"]];
[viewController addRightBarButtonWithImage:[UIImage imageNamed:@"hoge"]];
```

### open and close
```objective-c
// Open
[self.slideMenuController openLeft];
[self.slideMenuController openRight];

// close
[self.slideMenuController closeLeft];
[self.slideMenuController closeRight];
```

### You can monitor the menu state by `SlideMenuControllerDelegate`, something like this

```objective-c
-(void)leftWillOpen;
-(void)leftDidOpen;
-(void)leftWillClose;
-(void)leftDidClose;
-(void)rightWillOpen;
-(void)rightDidOpen;
-(void)rightWillClose;
-(void)rightDidClose;
```
___
## Requirements
Requires iOS 7.0 and ARC.  
If you are developing in the swift and iOS 8.0 and upper, you can use [SlideMenuControllerSwift](https://github.com/dekatotoro/SlideMenuControllerSwift).
___
## Features
- Highly customizable
- Complete example

___
## Contributing

Forks, patches and other feedback are welcome.
___
## Creator
### SlideMenuControllerOC
[Pluto Y - Blog](http://www.pluto-y.com)

[Sina Weibo](http://weibo.com/plutoy0504)

### SlideMenuControllerSwift
[Yuji Hato](https://github.com/dekatotoro) 

[Blog](http://buzzmemo.blogspot.jp/)

## License

SlideMenuControllerOC is available under the MIT license. See the LICENSE file for more info.

