//
//  PXBMSecondClassCell.m
//  SRProject
//
//  Created by longrise on 2018/8/30.
//  Copyright © 2018年 longrise. All rights reserved.
//

#import "PXBMSecondClassCell.h"

#define SelectedColor ColorWithHex(0xF2F2F2)
#define UnSelectedColor ColorWithHex(0xEEEEEE)

@implementation PXBMSecondClassCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.cornerRadius = 15;
        
        self.centerLabel = [UILabel new];
        self.centerLabel.text = @"哈哈哈哈哈";
        self.centerLabel.textColor = ColorWithHex(0x4D4D4D);
        self.centerLabel.font = SystemFont(14);
        [self.contentView addSubview:self.centerLabel];
        [self.centerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.contentView.mas_centerY);
            make.left.mas_equalTo(8);
            make.right.mas_equalTo(-8);
        }];
    }
    return self;
}

-(void)setCellSelected:(BOOL)cellSelected
{
    _cellSelected = cellSelected;
    
    if (cellSelected) {
        self.contentView.backgroundColor = SelectedColor;;
        
        self.layer.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1].CGColor;
    } else {
        self.contentView.backgroundColor = UnSelectedColor;
        
        self.layer.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1].CGColor;
    }
}



@end
