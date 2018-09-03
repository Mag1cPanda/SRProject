//
//  PXBMBannerCell.m
//  SRProject
//
//  Created by longrise on 2018/9/3.
//  Copyright © 2018年 longrise. All rights reserved.
//

#import "PXBMBannerCell.h"

@implementation PXBMBannerCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.bannerImage = [UIImageView new];
        self.bannerImage.backgroundColor = [UIColor orangeColor];
        [self.contentView addSubview:self.bannerImage];
        [self.bannerImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.bottom.mas_equalTo(0);
            make.height.mas_equalTo(80);
        }];
    }
    return self;
}

@end
