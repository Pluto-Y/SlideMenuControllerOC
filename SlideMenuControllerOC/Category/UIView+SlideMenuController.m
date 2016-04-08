//
//  UIView+SlideMenuController.m
//  SlideMenuControllerOC
//
//  Created by ChipSea on 16/3/29.
//  Copyright © 2016年 pluto-y. All rights reserved.
//

#import "UIView+SlideMenuController.h"

@implementation UIView (SlideMenuController)

+(UIView *)loadNib:(Class) aClass {
    NSString *className = NSStringFromClass(aClass);
    return (UIView *)[[[NSBundle bundleForClass:aClass] loadNibNamed:className owner:nil options:nil] firstObject];
}

+(UIView *)loadNib {
    return [UIView loadNib:self];
}

@end
