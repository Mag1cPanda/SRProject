//
//  SRConstant.m
//  SRProject
//
//  Created by longrise on 2018/8/29.
//  Copyright © 2018年 longrise. All rights reserved.
//

#import "SRConstant.h"

NSString * const nameKey = @"nameKey";

//static与const联合使用
//static与const作用:声明一个只读的静态变量
//开发使用场景:在一个文件中经常使用的字符串常量，可以使用static与const组合
static const NSString *someName = @"name";


@implementation SRConstant

@end
