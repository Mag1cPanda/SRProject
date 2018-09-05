//
//  SRGloble.m
//  SRProject
//
//  Created by longrise on 2018/8/29.
//  Copyright © 2018年 longrise. All rights reserved.
//

#import "SRGloble.h"

@implementation SRGloble

// 创建静态对象 防止外部访问
static SRGloble *_instance;
+(instancetype)shareInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (_instance == nil) {
            _instance = [[super alloc] init];
        }
    });
    return _instance;
}


@end
