//
//  SRGCDTool.m
//  SRProject
//
//  Created by longrise on 2018/9/27.
//  Copyright © 2018年 longrise. All rights reserved.
//

#import "SRGCD.h"

#define SafeAction(action) if(action != nil) { action(); }

@interface SRGCD ()

@property (strong, nonatomic) NSMutableArray <dispatch_block_t> *actionArray;

@property (strong, nonatomic) NSMutableArray <IS_Excute_Next_ActionBlock> *isExcuteBlockArray;

@end

@implementation SRGCD

static SRGCD *sr_GCD;
+ (instancetype)shareQueue
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sr_GCD = [SRGCD new];
        sr_GCD.queue = SRSerialQueue("com.SRGCD.shareQueue");
        
        sr_GCD.actionArray = [NSMutableArray array];
        sr_GCD.isExcuteBlockArray = [NSMutableArray array];
    });
    return sr_GCD;
}

+ (dispatch_queue_t)srSerialQueueWithLabel:(const char *)label
{
    dispatch_queue_t queue = dispatch_queue_create(label, DISPATCH_QUEUE_SERIAL);
    return queue;
}

+ (dispatch_queue_t)srConCurrentQueueWithLabel:(const char *)label
{
    dispatch_queue_t queue = dispatch_queue_create(label, DISPATCH_QUEUE_CONCURRENT);
    return queue;
}

#pragma mark - 同步执行+主队列。 没有开启新线程，串行执行任务，
+ (void)srSync_mainQueueWithAction:(dispatch_block_t)action
{
    dispatch_sync(dispatch_get_main_queue(), ^{
        action();
    });
}

#pragma mark - 同步执行+其他队列(并发|串行)
+ (void)srSyncWithQueue:(dispatch_queue_t)queue actionBlock:(dispatch_block_t)action
{
    dispatch_sync(queue, ^{
        SafeAction(action);
    });
}

#pragma mark - 异步执行 + 主队列 没有开启新线程，串行执行任务
+ (void)srAsync_mainQueueWithAction:(dispatch_block_t)action
{
    dispatch_async(dispatch_get_main_queue(), ^{
        SafeAction(action);
    });
}

#pragma mark - 异步执行 + 其他队列（并发|串行）
//(1):加并发的话 有开启新线程，并发执行任务
//(2):加串行的话 有开启新线程(1条)，串行执行任务
+ (void)srAsyncWithQueue:(dispatch_queue_t)queue actionBlock:(dispatch_block_t)action
{
    dispatch_async(queue, ^{
        SafeAction(action);
    });
}

#pragma mark - 主线程延后执行
+ (void)mainQueueWithAction:(dispatch_block_t)action delay:(NSTimeInterval)delayTime
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        SafeAction(action);
    });
}

#pragma mark - 线程延后执行
+ (void)queue:(dispatch_queue_t)queue action:(dispatch_block_t)action delay:(NSTimeInterval)delayTime
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayTime * NSEC_PER_SEC)), queue, ^{
        SafeAction(action);
    });
}

#pragma mark - 添加操作
- (void)addAction:(dispatch_block_t)action
{
    [SRShareQueue.actionArray addObject:action];
}

#pragma mark - 添加条件执行操作
- (void)addAction:(dispatch_block_t)action executeSignal:(IS_Excute_Next_ActionBlock)isExcuteBlock
{
    [SRShareQueue.actionArray addObject:action];
    [SRShareQueue.isExcuteBlockArray addObject:isExcuteBlock];
}

- (void)start
{
    for (NSUInteger i=0; i<SRShareQueue.actionArray.count; i++) {
        //代码块执行判断条件获取
        IS_Excute_Next_ActionBlock isExcuteBlock = [self.isExcuteBlockArray objectAtIndex:i];
        //代码块获取
        dispatch_block_t action = [self.actionArray objectAtIndex:i];
        
        //如果是true的话执行，采用的是同步+串并执行的方法
        if (isExcuteBlock() == true) {
            [SRGCD srSyncWithQueue:self.queue actionBlock:^{
                action();
                NSLog(@"the %lu 'th action excuted",(unsigned long)i);
            }];
        } else {
            //end action
            NSLog(@"the %lu 'th action not excute",(unsigned long)i);
            break;
        }
    }
}

- (void)async_start
{
    for (NSUInteger i=0; i<SRShareQueue.actionArray.count; i++) {
        //代码块获取
        dispatch_block_t action = [self.actionArray objectAtIndex:i];
        
        //不需要判断,执行方法采用异步并发
        
        [SRGCD srAsyncWithQueue:SRConCurrentQueue("") actionBlock:^{
            //执行上边的action
            action();
        }];
    }
}

- (void)clearData
{
    if (SRShareQueue.actionArray.count > 0) {
        [SRShareQueue.actionArray removeAllObjects];
    }
    
    if (SRShareQueue.isExcuteBlockArray.count > 0) {
        [SRShareQueue.isExcuteBlockArray removeAllObjects];
    }
}


@end
