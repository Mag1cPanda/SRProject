//
//  PXBMSecondClassCell.m
//  SRProject
//
//  Created by longrise on 2018/8/30.
//  Copyright © 2018年 longrise. All rights reserved.
//

#import "PXBMSecondClassCell.h"

#define SelectedBackColor ColorWithHex(0xF2F2F2)
#define UnSelectedBackColor ColorWithHex(0xFFFFFF)

#define SelectedTextColor ColorWithHex(0xFE9806)
#define UnSelectedTextColor ColorWithHex(0x4D4D4D)


@implementation PXBMSecondClassCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //        self.contentView.backgroundColor = RandomColor;
        self.contentView.backgroundColor = ColorWithHex(0xF9F9F9);
        
        self.centerLabel = [UILabel new];
        self.centerLabel.backgroundColor = [UIColor whiteColor];
        self.centerLabel.text = @"哈哈哈哈哈";
        self.centerLabel.textColor = UnSelectedTextColor;
        self.centerLabel.font = SystemFont(14);
        self.centerLabel.textAlignment = NSTextAlignmentCenter;
        self.centerLabel.layer.cornerRadius = 15;
        self.centerLabel.layer.borderWidth = 0.5;
        self.centerLabel.layer.borderColor = ColorWithHex(0xEEEEEE).CGColor;
        self.centerLabel.clipsToBounds = YES;
        [self.contentView addSubview:self.centerLabel];
        [self.centerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.contentView.mas_centerY);
            make.left.mas_equalTo(0);
            make.right.mas_equalTo(0);
            make.height.mas_equalTo(30);
        }];
    }
    return self;
}

-(void)setCellSelected:(BOOL)cellSelected
{
    _cellSelected = cellSelected;
    
    if (cellSelected) {
        self.centerLabel.backgroundColor = SelectedBackColor;
        self.centerLabel.textColor = SelectedTextColor;
    } else {
        self.centerLabel.backgroundColor = UnSelectedBackColor;
        self.centerLabel.textColor = UnSelectedTextColor;
    }
}



@end
