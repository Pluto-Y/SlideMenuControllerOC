//
//  UITableView+SlideMenuControllerOC.h
//  SlideMenuControllerOC
//
//  Created by ChipSea on 16/2/28.
//  Copyright © 2016年 pluto-y. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (SlideMenuControllerOC)

-(void)registerCellClass:(Class) cellClass;

-(void)registerCellNib:(Class) cellClass;

-(void)registerHeaderFooterViewClass:(Class) viewClass;

-(void)registerHeaderFootViewNib:(Class) viewClass;

@end
