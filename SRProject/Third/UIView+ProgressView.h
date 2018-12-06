//
//  UIView+ProgressView.h
//  UICollectionViewAndHttp
//
//  Created by smith on 15/11/3.
//  Copyright © 2015年 smith. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ProgressView)

- (void)showJUHUAWithBool:(BOOL)isShow andTitle:(NSString*)titleStr andBackColor:(UIColor*)color andAlpha:(CGFloat)alpha;

//height的值

//顶部有nav 下面没有 tab  height = nav
//顶部有nav 下面有 tab   height = nav
//顶部没有nav 下面没有tab  height = -tab.height
//顶部没有nav 下面有tab   height = -tab.height

-(void)showJUHUAWithBool:(BOOL)isShow WithRalativeLocation:(CGFloat )height;

-(void)showJUHUAWithBool:(BOOL)isShow;
@end
