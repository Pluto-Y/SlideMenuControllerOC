//
//  DataTableViewCell.h
//  SlideMenuControllerOC
//
//  Created by ChipSea on 16/3/29.
//  Copyright © 2016年 pluto-y. All rights reserved.
//

#import "BaseTableViewCell.h"

@interface DataTableViewCellData : NSObject

@property (retain, nonatomic) NSString *imageUrl;
@property (retain, nonatomic) NSString *text;

@end


@interface DataTableViewCell : BaseTableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *dataImage;
@property (weak, nonatomic) IBOutlet UILabel *dataText;

@end
