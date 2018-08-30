//
//  BaseModel.m
//  SRProject
//
//  Created by longrise on 2018/8/29.
//  Copyright © 2018年 longrise. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    NSLog(@"forUndefinedKey ~ %@",key);
}

-(instancetype)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

+(instancetype)modelWithDic:(NSDictionary *)dic
{
    BaseModel *model = [BaseModel new];
//    [model setValuesForKeysWithDictionary:dic];
    
    return model;
}

@end
