//
//  PXBMRecommendOneCell.h
//  SRProject
//
//  Created by longrise on 2018/9/3.
//  Copyright © 2018年 longrise. All rights reserved.
//

#import "BaseCollectionViewCell.h"

@interface PXBMRecommendOneCell : BaseCollectionViewCell

@property (nonatomic, strong) UIView *dotView;
@property (nonatomic, strong) UILabel *rightLabel;
@property (nonatomic, strong) UIImageView *arrow;

@property (nonatomic, assign) NSUInteger index;

@end
