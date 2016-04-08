//
//  UITableView+SlideMenuControllerOC.m
//  SlideMenuControllerOC
//
//  Created by ChipSea on 16/2/28.
//  Copyright © 2016年 pluto-y. All rights reserved.
//

#import "UITableView+SlideMenuControllerOC.h"

@implementation UITableView (SlideMenuControllerOC)

-(void)registerCellClass:(Class) cellClass {
    NSString *identifier = NSStringFromClass(cellClass);
    [self registerClass:cellClass forCellReuseIdentifier:identifier];
}

-(void)registerCellNib:(Class) cellClass {
    NSString *identifier = NSStringFromClass(cellClass);
    UINib *nib = [UINib nibWithNibName:identifier bundle:nil];
    [self registerNib:nib forCellReuseIdentifier:identifier];
}

-(void)registerHeaderFooterViewClass:(Class) viewClass {
    NSString *identifier = NSStringFromClass(viewClass);
    [self registerClass:viewClass forCellReuseIdentifier:identifier];
}

-(void)registerHeaderFootViewNib:(Class) viewClass {
    NSString *identifier = NSStringFromClass(viewClass);
    UINib *nib = [UINib nibWithNibName:identifier bundle:nil];
    [self registerNib:nib forCellReuseIdentifier:identifier];
}

@end
