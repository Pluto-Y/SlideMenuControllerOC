//
//  ImageHeaderView.m
//  SlideMenuControllerOC
//
//  Created by ChipSea on 16/3/29.
//  Copyright © 2016年 pluto-y. All rights reserved.
//

#import "ImageHeaderView.h"

@implementation ImageHeaderView

-(void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = [UIColor colorFromHexString:@"#E0E0E0"];
    self.profileImage.layer.cornerRadius = self.profileImage.frame.size.height / 2;
    self.profileImage.clipsToBounds = YES;
    self.profileImage.layer.borderWidth = 1;
    self.profileImage.layer.borderColor = [UIColor whiteColor].CGColor;
    [self.profileImage setRandomDownloadImage:80 height:80];
    [self.backgroundImage setRandomDownloadImage:self.frame.size.width height:160];
}

@end
