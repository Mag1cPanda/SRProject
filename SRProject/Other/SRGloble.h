//
//  SRGloble.h
//  SRProject
//
//  Created by longrise on 2018/8/29.
//  Copyright © 2018年 longrise. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kSRGlobleInstance [SRGloble shareInstance]

@interface SRGloble : NSObject

+(instancetype)shareInstance;

@end
