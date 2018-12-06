//
//  UIView+ProgressView.m
//  UICollectionViewAndHttp
//
//  Created by smith on 15/11/3.
//  Copyright © 2015年 smith. All rights reserved.
//

#import "UIView+ProgressView.h"

#define VIEW_TAG  9909

@implementation UIView (ProgressView)

- (void)showJUHUAWithBool:(BOOL)isShow andTitle:(NSString*)titleStr andBackColor:(UIColor*)color andAlpha:(CGFloat)alpha
{
    if (isShow)
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            UIView * backView = [self viewWithTag:VIEW_TAG] ;
            if (backView)
            {
                return ;
            }
            //第一个层级
            backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)] ;
            backView.autoresizingMask = UIViewAutoresizingFlexibleWidth |UIViewAutoresizingFlexibleHeight;
            backView.tag = VIEW_TAG ;
            [self addSubview:backView] ;
            [self bringSubviewToFront:backView];
            
            //第二个层级 是用来做透明度用的
            UIView * subBackView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)] ;
            subBackView.autoresizingMask = UIViewAutoresizingFlexibleWidth |UIViewAutoresizingFlexibleHeight;
            subBackView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:alpha];
            [backView addSubview:subBackView] ;
            
            //第三层级 菊花
            CGRect bounds = [titleStr boundingRectWithSize:CGSizeMake(MAXFLOAT, 15) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13]} context:nil];
            CGFloat width = bounds.size.width + 10 + 22 + 10 + 10 + 15;
            
            UIView * blackView = [[UIView alloc] init] ;
            blackView.frame = CGRectMake((self.frame.size.width - width)/2.0, (self.frame.size.height - 30.0 - 100.0)/2.0, width, 40.0);
            blackView.layer.cornerRadius = 3 ;
            blackView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin;
            
            blackView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.8];
            UIActivityIndicatorView * activity = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite] ;
            activity.frame = CGRectMake(15, 9, 22, 22);
            [activity startAnimating] ;
            [blackView addSubview:activity] ;
            UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(47, 10, bounds.size.width, 20)];
            lab.text = titleStr;
            lab.font = [UIFont systemFontOfSize:13];
            lab.textAlignment = NSTextAlignmentLeft;
            lab.textColor = color;
            [blackView addSubview:lab];
            
            [backView addSubview:blackView] ;
        });
    }
    else
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            UIView * backView = [self viewWithTag:VIEW_TAG] ;
            
            [backView removeFromSuperview] ;
        });
    }
}


-(void)showJUHUAWithBool:(BOOL)isShow WithRalativeLocation:(CGFloat )height
{
    if (isShow)
    {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            UIView * backView = [self viewWithTag:VIEW_TAG] ;
            if (backView)
            {
                return ;
            }
            //第一个层级
            backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)] ;
            backView.autoresizingMask = UIViewAutoresizingFlexibleWidth |UIViewAutoresizingFlexibleHeight;
            backView.tag = VIEW_TAG ;
            [self addSubview:backView] ;
            backView.userInteractionEnabled = YES;
            [self bringSubviewToFront:backView];
            
            //第二个层级 是用来做透明度用的
            UIView * subBackView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)] ;
            subBackView.autoresizingMask = UIViewAutoresizingFlexibleWidth |UIViewAutoresizingFlexibleHeight;
            
            subBackView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.000001f];
            
            [backView addSubview:subBackView] ;
            
            //第三层级 菊花
            CGRect bounds = [@"正在加载..." boundingRectWithSize:CGSizeMake(MAXFLOAT, 15) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13]} context:nil];
            CGFloat width = bounds.size.width + 10 + 22 + 10 + 10 + 15;
            
            UIView * blackView = [[UIView alloc] init] ;
            blackView.frame = CGRectMake((self.frame.size.width - width)/2.0, (self.frame.size.height - height  - 100.0 - 20.0)/2.0, width, 40.0);
            blackView.layer.cornerRadius = 5.0f ;
            blackView.layer.masksToBounds = YES;
            blackView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin;
            
            blackView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.8];
            UIActivityIndicatorView * activity = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite] ;
            activity.frame = CGRectMake(15.0, 9.0, 22.0, 22.0);
            [activity startAnimating] ;
            [blackView addSubview:activity] ;
            UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(47, 10, bounds.size.width, 20)];
            lab.text = @"正在加载...";
            lab.font = [UIFont systemFontOfSize:13];
            lab.textAlignment = NSTextAlignmentLeft;
            lab.textColor = [UIColor whiteColor];
            [blackView addSubview:lab];
            
            [backView addSubview:blackView] ;
        });
        
    }
    else
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            UIView * backView = [self viewWithTag:VIEW_TAG] ;
            [backView removeFromSuperview] ;
        });
    }
}


-(void)showJUHUAWithBool:(BOOL)isShow
{
    if (isShow)
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            UIView * backView = [self viewWithTag:VIEW_TAG] ;
            if (backView)
            {
                return ;
            }
            //第一个层级
            backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)] ;
            backView.autoresizingMask = UIViewAutoresizingFlexibleWidth |UIViewAutoresizingFlexibleHeight;
            backView.tag = VIEW_TAG ;
            [self addSubview:backView] ;
            backView.userInteractionEnabled = YES;
            [self bringSubviewToFront:backView];
            
            //第二个层级 是用来做透明度用的
            UIView * subBackView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)] ;
            subBackView.autoresizingMask = UIViewAutoresizingFlexibleWidth |UIViewAutoresizingFlexibleHeight;
            
            subBackView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.00001f];
            
            [backView addSubview:subBackView] ;
            UIActivityIndicatorView * activity = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray] ;
            activity.frame = CGRectMake(0, 0, 80, 80);
            activity.center = backView.center;
            [activity startAnimating] ;
            [backView addSubview:activity];
        });
        
    }
    else
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            UIView * backView = [self viewWithTag:VIEW_TAG] ;
            [backView removeFromSuperview] ;
        });
    }
}


@end
