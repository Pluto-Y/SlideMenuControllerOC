//
//  BaseTableViewCell.h
//  SlideMenuControllerOC
//
//  Created by ChipSea on 16/3/29.
//  Copyright © 2016年 pluto-y. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTableViewCell : UITableViewCell

+(NSString *)identifier;

-(void)setup;

+(CGFloat) height;

-(void)setData:(id) data;

@end
