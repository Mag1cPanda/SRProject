//
//  SRCircleProgress.m
//  SRProject
//
//  Created by longrise on 2018/11/2.
//  Copyright © 2018 longrise. All rights reserved.
//

#import "SRCircleProgress.h"

@interface SRCircleProgress ()
@property (nonatomic) CAShapeLayer *backLayer;
@property (nonatomic) CAShapeLayer *circleLayer;
@property (nonatomic) CAShapeLayer *gradientMask;
@end

@implementation SRCircleProgress

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self buildLayout];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self buildLayout];
}

-(void)buildLayout
{
    CGFloat centerX = self.bounds.size.width/2.0;
    CGFloat centerY = self.bounds.size.height/2.0;
    
    CGFloat radius = (self.bounds.size.width - _curveWidth)/2.0;
    
    CGFloat lineWidth = 0.1*self.bounds.size.width;
    
    //创建贝塞尔路径
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(centerX, centerY) radius:radius startAngle:(-0.5f*M_PI) endAngle:1.5f*M_PI clockwise:YES];
    
    //添加背景圆环
    CAShapeLayer *backLayer = [CAShapeLayer layer];
    backLayer.frame = self.bounds;
    backLayer.fillColor =  UIColor.clearColor.CGColor;
    backLayer.strokeColor  = UIColor.clearColor.CGColor;
    backLayer.lineWidth = lineWidth;
    backLayer.path = [path CGPath];
    backLayer.strokeEnd = 1;
    [self.layer addSublayer:backLayer];
    self.backLayer = backLayer;
    
    //创建进度layer
    CAShapeLayer *circleLayer = [CAShapeLayer layer];
    circleLayer.frame = self.bounds;
    circleLayer.fillColor =  [[UIColor clearColor] CGColor];
    //指定path的渲染颜色（默认橙色）
    circleLayer.strokeColor  = [UIColor colorWithRed:255.0f/255.0f green:151.0f/255.0f blue:0/255.0f alpha:1].CGColor;
    circleLayer.lineCap = kCALineCapRound;
    circleLayer.lineWidth = lineWidth;
    circleLayer.path = [path CGPath];
    circleLayer.strokeEnd = 0;
    [self.layer addSublayer:circleLayer];
    self.circleLayer = circleLayer;
    
    CGFloat lblWidth = self.bounds.size.width - lineWidth*2 - 10;
    UILabel *centerLbl = [[UILabel alloc] initWithFrame:CGRectMake((self.bounds.size.width-lblWidth)/2, (self.bounds.size.height-20)/2, lblWidth, 20)];
    centerLbl.textAlignment = NSTextAlignmentCenter;
    [self addSubview:centerLbl];
    self.centerLbl = centerLbl;
}

#pragma mark - setter
-(void)setProgress:(CGFloat)progress
{
    _progress = progress;
    _circleLayer.strokeEnd = progress;
    //保留两位小数
//    _centerLbl.text = [NSString stringWithFormat:@"%.2f%%",progress*100];
    //整数
    _centerLbl.text = [NSString stringWithFormat:@"%.0f%%",progress*100];
}

-(void)setTotalValue:(CGFloat)totalValue
{
    _totalValue = totalValue;
    _centerLbl.text = [NSString stringWithFormat:@"%.0f/%.0f", _currentValue, totalValue];
}

-(void)setCurrentValue:(CGFloat)currentValue
{
    _currentValue = currentValue;
    _centerLbl.text = [NSString stringWithFormat:@"%.0f/%.0f", currentValue, _totalValue];
    _circleLayer.strokeEnd = currentValue/_totalValue;
}

-(void)setCurveWidth:(CGFloat)curveWidth
{
    _curveWidth = curveWidth;
    _circleLayer.lineWidth = curveWidth;
    _backLayer.lineWidth = curveWidth;
}

-(void)setBackColor:(UIColor *)backColor
{
    _backColor = backColor;
    _backLayer.strokeColor = backColor.CGColor;
}

-(void)setTrackColor:(UIColor *)trackColor
{
    _trackColor = trackColor;
    _circleLayer.strokeColor = trackColor.CGColor;
}

#pragma mark - getter

@end
