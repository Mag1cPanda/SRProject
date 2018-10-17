//
//  SRNetworkManager.h
//  SRProject
//
//  Created by longrise on 2018/10/16.
//  Copyright © 2018 longrise. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^SuccessBlock)(id responseObject);
typedef void (^FailureBlock)(NSError *error);

@interface SRNetworkManager : NSObject

+(void)requestByPOSTWithServiceName:(NSString *)serviceName parameters:(NSDictionary *)parameters onSuccess:(SuccessBlock)success onFailure:(FailureBlock)failure;

+(void)requestByGETWithServiceName:(NSString *)serviceName parameters:(NSDictionary *)parameters onSuccess:(SuccessBlock)success onFailure:(FailureBlock)failure;

@end
