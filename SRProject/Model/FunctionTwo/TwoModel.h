//
//  TwoModel.h
//  SRProject
//
//  Created by longrise on 2018/8/30.
//  Copyright © 2018年 longrise. All rights reserved.
//

#import "BaseModel.h"

@interface TwoModel : BaseModel
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *hashId;
@property (nonatomic, copy) NSString *unixtime;
@property (nonatomic, copy) NSString *updatetime;
@end
