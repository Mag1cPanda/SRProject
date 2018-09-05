//
//  PXBMRecommendTwoCell.m
//  SRProject
//
//  Created by longrise on 2018/9/3.
//  Copyright © 2018年 longrise. All rights reserved.
//

#import "PXBMRecommendTwoCell.h"

@implementation PXBMRecommendTwoCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.contentView.backgroundColor = ColorWithHex(0xF9F9F9);
        
        self.leftImage = [UIImageView new];
        self.leftImage.backgroundColor = [UIColor orangeColor];
        [self.contentView addSubview:self.leftImage];
        [self.leftImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(10);
            make.width.mas_equalTo(75);
            make.height.mas_equalTo(44);
        }];
        
        
        self.rightLabel = [UILabel new];
        self.rightLabel.text = @"123123123123123123131313123";
        self.rightLabel.font = SystemFont(14);
        self.rightLabel.textColor = ColorWithHex(0x333333);
        self.rightLabel.numberOfLines = 2;
        [self.contentView addSubview:self.rightLabel];
        [self.rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.mas_equalTo(self.leftImage);
            make.left.mas_equalTo(95);
            make.right.mas_equalTo(-39);
//            make.height.mas_equalTo(37);
        }];
        
        
        self.arrow = [UIImageView new];
        self.arrow.image = [UIImage imageNamed:@"Icons_My_ic_my_getmember_gary"];
        [self.contentView addSubview:self.arrow];
        [self.arrow mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-17);
            make.centerY.mas_equalTo(self.contentView.mas_centerY);
            make.width.height.mas_equalTo(12);
        }];
        
    }
    return self;
}

@end
