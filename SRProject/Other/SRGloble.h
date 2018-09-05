//
//  SRGloble.h
//  SRProject
//
//  Created by longrise on 2018/8/29.
//  Copyright © 2018年 longrise. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kSRGlobleInstance [SRGloble shareInstance]


//@protocol RCIMUserInfoDataSource <NSObject>
//
//- (void)testDelegate;
//
//@end

@interface SRGloble : NSObject

+(instancetype)shareInstance;

@end
