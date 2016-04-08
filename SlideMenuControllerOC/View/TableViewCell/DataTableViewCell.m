//
//  DataTableViewCell.m
//  SlideMenuControllerOC
//
//  Created by ChipSea on 16/3/29.
//  Copyright © 2016年 pluto-y. All rights reserved.
//

#import "DataTableViewCell.h"

@implementation DataTableViewCellData

@end

@implementation DataTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.dataText.font = [UIFont italicSystemFontOfSize:16];
    self.dataText.textColor = [UIColor colorFromHexString:@"#9E9E9E"];
}

+(CGFloat)height {
    return 80;
}

-(void)setData:(id)data {
    if ([data isKindOfClass:[DataTableViewCellData class]]) {
        [self.dataImage setRandomDownloadImage:80 height:80];
        self.dataText.text = ((DataTableViewCellData *)data).text;
    }
}

@end
