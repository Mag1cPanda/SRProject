//
//  SRNetworkManager.m
//  SRProject
//
//  Created by longrise on 2018/10/16.
//  Copyright © 2018 longrise. All rights reserved.
//

#import "SRNetworkManager.h"
#import "XMNetworking.h"

typedef NS_ENUM(NSInteger, XMNetworkErrorCode) {
    kXMSuccessCode = 0,      //!< 接口请求成功
    kXMErrorCode = 1,        //!< 接口请求失败
    kXMUnknownCode = -1,     //!< 未知错误
};

NSString * const API_HOST = @"https://app.kangzubin.com/iostips/api/feed/";


@implementation SRNetworkManager
+ (void)load
{
    // 网络请求全局配置
    [XMCenter setupConfig:^(XMConfig *config) {
        config.generalServer = API_HOST;
        config.callbackQueue = dispatch_get_main_queue();
#ifdef DEBUG
        config.consoleLog = YES;
#endif
    }];
    
    
    // 错误统一过滤处理
    [XMCenter setErrorProcessBlock:^(XMRequest *request, NSError *__autoreleasing * error) {
        // 比如对不同的错误码统一错误提示等
        
    }];
}

+(void)requestByPOSTWithServiceName:(NSString *)serviceName parameters:(NSDictionary *)parameters onSuccess:(SuccessBlock)success onFailure:(FailureBlock)failure
{
    [XMCenter sendRequest:^(XMRequest *request) {
//        request.api = @"listAll";
        request.api = serviceName;
        request.parameters = parameters;
        request.httpMethod = kXMHTTPMethodPOST;
    } onSuccess:^(id responseObject) {
        NSLog(@"onSuccess: %@", responseObject);
        success(responseObject);
        if ([responseObject isKindOfClass:NSDictionary.class]) {
        
        }
        
    } onFailure:^(NSError *error) {
        NSLog(@"onFailure: %@", error);
        failure(error);
    } onFinished:^(id responseObject, NSError *error) {
        NSLog(@"onFinished");
    }];
}

+(void)requestByGETWithServiceName:(NSString *)serviceName parameters:(NSDictionary *)parameters onSuccess:(SuccessBlock)success onFailure:(FailureBlock)failure
{
    [XMCenter sendRequest:^(XMRequest *request) {
//        request.api = @"searchAll";
        request.api = serviceName;
        request.parameters = parameters;
        request.httpMethod = kXMHTTPMethodGET;
    } onSuccess:^(id responseObject) {
        NSLog(@"onSuccess: %@", responseObject);
        
        if ([responseObject isKindOfClass:NSDictionary.class]) {
            
        }
        
    } onFailure:^(NSError *error) {
        NSLog(@"onFailure: %@", error);
    } onFinished:^(id responseObject, NSError *error) {
        NSLog(@"onFinished");
    }];
}

@end
