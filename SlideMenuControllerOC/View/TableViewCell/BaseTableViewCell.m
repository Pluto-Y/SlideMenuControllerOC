//
//  BaseTableViewCell.m
//  SlideMenuControllerOC
//
//  Created by ChipSea on 16/3/29.
//  Copyright © 2016年 pluto-y. All rights reserved.
//

#import "BaseTableViewCell.h"

@implementation BaseTableViewCell

+(NSString *)identifier {
    return  NSStringFromClass([self class]);
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setup];
    }
    return self;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle: style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

-(void)setup {
    
}

+(CGFloat) height {
    return 48;
}

-(void)setData:(id) data {
    self.backgroundColor = [UIColor colorFromHexString:@"#F1F8E9"];
    self.textLabel.font = [UIFont italicSystemFontOfSize:18];
    self.textLabel.textColor = [UIColor colorFromHexString:@"#9E9E9E"];
    if([data isKindOfClass:[NSString class]]) {
        self.textLabel.text = (NSString *)data;
    }
}

-(void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
    if (highlighted) {
        self.alpha = .4;
    } else {
        self.alpha = 1;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {

}

@end
