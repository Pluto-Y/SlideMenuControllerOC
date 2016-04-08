//
//  UIImage+SlideMenuController.m
//  SlideMenuControllerOC
//
//  Created by ChipSea on 16/2/29.
//  Copyright © 2016年 pluto-y. All rights reserved.
//

#import "UIImage+SlideMenuController.h"

@implementation UIImage (SlideMenuController)

-(UIImage *)trimRect:(CGRect) trimRect {
    if (CGRectContainsRect((CGRect){CGPointZero, self.size}, trimRect)) {
        CGImageRef imageRef = CGImageCreateWithImageInRect(self.CGImage, trimRect);
        if (imageRef != nil) {
            return [UIImage imageWithCGImage:imageRef];
        }
    }
    
    UIGraphicsBeginImageContextWithOptions(trimRect.size, YES, self.scale);
    [self drawInRect:CGRectMake(-CGRectGetMinX(trimRect), -CGRectGetMinY(trimRect), self.size.width, self.size.height)];
    UIImage *trimmedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    if (trimmedImage != nil) {
        return trimmedImage;
    }
    
    return self;
    
}

@end
