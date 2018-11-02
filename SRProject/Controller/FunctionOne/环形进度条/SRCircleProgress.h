//
//  SRCircleProgress.h
//  SRProject
//
//  Created by longrise on 2018/11/2.
//  Copyright © 2018 longrise. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SRCircleProgress : UIView
//环形进度条中间的Label
@property (nonatomic, strong) UILabel *centerLbl;

//当中间label为 当前值/总数 时使用
//总数
@property (nonatomic, assign) CGFloat totalValue;
//当前值
@property (nonatomic, assign) CGFloat currentValue;

//当中间label为 X% 时使用
//进度
@property (nonatomic, assign) CGFloat progress;

//曲线宽度
@property (nonatomic, assign) CGFloat curveWidth;
//进度条背景颜色
@property (nonatomic, strong) UIColor *backColor;
//进度条颜色
@property (nonatomic, strong) UIColor *trackColor;

@end
