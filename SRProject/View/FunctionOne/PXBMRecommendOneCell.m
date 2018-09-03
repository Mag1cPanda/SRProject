//
//  PXBMRecommendOneCell.m
//  SRProject
//
//  Created by longrise on 2018/9/3.
//  Copyright © 2018年 longrise. All rights reserved.
//

#import "PXBMRecommendOneCell.h"

#define CHENGColor ColorWithHex(0xFF9600)
#define LANColor ColorWithHex(0x00B4FF)
#define QINColor ColorWithHex(0x51ECE5)
#define HONGColor ColorWithHex(0xFF2400)

@implementation PXBMRecommendOneCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.dotView = [UIView new];
        self.dotView.backgroundColor = [UIColor orangeColor];
        self.dotView.layer.cornerRadius = 2.5;
        [self.contentView addSubview:self.dotView];
        self.dotView.frame = CGRectMake(0, 0, 5, 5);
        [self.dotView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.centerY.mas_equalTo(self.contentView.mas_centerY);
            make.width.height.mas_equalTo(5);
        }];
        
        
        self.rightLabel = [UILabel new];
        self.rightLabel.text = @"保险微锦囊：商业保险pk社保";
        self.rightLabel.font = SystemFont(14);
        self.rightLabel.textColor = ColorWithHex(0x333333);
        self.rightLabel.numberOfLines = 1;
        [self.contentView addSubview:self.rightLabel];
        [self.rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(24);
            make.right.mas_equalTo(-47);
            make.centerY.mas_equalTo(self.contentView.mas_centerY);
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

-(void)setIndex:(NSUInteger)index
{
    _index = index;
    if (index % 4 == 0) {
        self.dotView.backgroundColor = CHENGColor;
    }
    
    if (index % 4 == 1) {
        self.dotView.backgroundColor = LANColor;
    }
    
    if (index % 4 == 2) {
        self.dotView.backgroundColor = QINColor;
    }
    
    if (index % 4 == 3) {
        self.dotView.backgroundColor = HONGColor;
    }
    
}


@end
