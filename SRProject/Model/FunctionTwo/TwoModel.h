//
//  TwoModel.h
//  SRProject
//
//  Created by longrise on 2018/8/30.
//  Copyright © 2018年 longrise. All rights reserved.
//

#import "BaseModel.h"

@interface TwoModel : BaseModel
@property (nonatomic, copy) NSString *fid;
@property (nonatomic, copy) NSString *author;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *postdate;
@property (nonatomic, assign) NSInteger platform;
@end
