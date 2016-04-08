//
//  UIImageView+SlideMenuControllerOC.h
//  SlideMenuControllerOC
//
//  Created by ChipSea on 16/2/29.
//  Copyright © 2016年 pluto-y. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (SlideMenuControllerOC)

-(void)setRandomDownloadImage:(int)width height:(int)height;

-(void)clipParallaxEffec:(UIImage *)baseImage screenSize:(CGSize)screenSize displayHeight:(CGFloat)displayHeight;

@end
