//
//  UIButton+Extension.h
//  SRProject
//
//  Created by longrise on 2018/10/15.
//  Copyright © 2018 longrise. All rights reserved.
//

#import <UIKit/UIKit.h>
#define defaultInterval 0.5//默认时间间隔

@interface UIButton (Extension)

@property(nonatomic,assign)NSTimeInterval timeInterval;//用这个给重复点击加间隔

@property(nonatomic,assign)BOOL isIgnoreEvent;//YES不允许点击NO允许点击

@end
