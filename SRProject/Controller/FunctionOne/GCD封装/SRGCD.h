//
//  SRGCDTool.h
//  SRProject
//
//  Created by longrise on 2018/9/27.
//  Copyright © 2018年 longrise. All rights reserved.
//

#import <Foundation/Foundation.h>

#define SRShareQueue [SRGCD shareQueue]
#define SRSerialQueue(label) [SRGCD srSerialQueueWithLabel:label]
#define SRConCurrentQueue(label) [SRGCD srConCurrentQueueWithLabel:label]

typedef BOOL(^IS_Excute_Next_ActionBlock)(void);

@interface SRGCD : NSObject

@property (strong, nonatomic) dispatch_queue_t queue;

+ (instancetype)shareQueue;

/**
 返回串行队列

 @param label 队列标签
 @return 串行队列
 */
+ (dispatch_queue_t)srSerialQueueWithLabel:(const char *)label;


/**
 返回并行队列

 @param label 队列标签
 @return 并发队列
 */
+ (dispatch_queue_t)srConCurrentQueueWithLabel:(const char *)label;

/**
 同步添加到主线程中

 @param action 操作
 */
+ (void)srSync_mainQueueWithAction:(dispatch_block_t)action;

/**
 同步添加到线程中

 @param queue 队列
 @param action 操作
 */
+ (void)srSyncWithQueue:(dispatch_queue_t)queue actionBlock:(dispatch_block_t)action;

/**
 异步添加到主线程中

 @param action 操作
 */
+ (void)srAsync_mainQueueWithAction:(dispatch_block_t)action;

/**
 异步添加到线程中

 @param queue 队列
 @param action 操作
 */
+ (void)srAsyncWithQueue:(dispatch_queue_t)queue actionBlock:(dispatch_block_t)action;

/**
 延迟提交任务到queue中

 @param queue 队列
 @param action 操作
 @param delayTime 延迟
 */
+ (void)queue:(dispatch_queue_t)queue action:(dispatch_block_t)action delay:(NSTimeInterval)delayTime;


/**
 主线程操作

 @param action 操作
 @param delayTime 延迟
 */
+ (void)mainQueueWithAction:(dispatch_block_t)action delay:(NSTimeInterval)delayTime;

/**
 有条件的同步串行

 @param action 操作
 @param isExcuteBlock 信号
 */
- (void)addAction:(dispatch_block_t)action executeSignal:(IS_Excute_Next_ActionBlock)isExcuteBlock;


/**
 添加操作

 @param action 操作
 */
-(void)addAction:(dispatch_block_t)action;


/**
 线程中添加的操作串行
 */
- (void)start;


/**
 线程中添加的操作并发
 */
-(void)async_start;


/**
 清空数据
 */
- (void) clearData;

@end
