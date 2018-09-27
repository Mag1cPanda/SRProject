//
//  GCDTestViewController.m
//  SRProject
//
//  Created by longrise on 2018/9/27.
//  Copyright © 2018年 longrise. All rights reserved.
//

#import "GCDTestViewController.h"
#import "SRGCD.h"

@interface GCDTestViewController ()
@property (assign, nonatomic) float x1;
@property (assign, nonatomic) float x2;
@property (assign, nonatomic) float x3;
@end

@implementation GCDTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"GCDTest";
    
//    [self testSRGCD1];
    
//    [self testSRGCD2];
    
    //同步派发串行队列
//    [self testSRGCD3];
    //异步派发串行队列
//    [self testSRGCD4];
    //同步派发并行队列
//    [self testSRGCD5];
    //异步派发并行队列
//    [self testSRGCD6];
    //全局并发队列(global_queue)
    [self testSRGCD7];
}

-(void)testSRGCD1
{
    _x1 = _x2 = _x3 = 0.0;
    __weak typeof(self) weakSelf = self;
    
    //采用了同步串行的方法
    //得到x1 = 1;
    [SRShareQueue addAction:^{
        weakSelf.x1 += 1.0;
        NSLog(@"x1 = %.1f",weakSelf.x1);
    } executeSignal:^BOOL{
        return true;
    }];
    
    //判断x1 = 1；得到x2 = 2；
    [SRShareQueue addAction:^{
        weakSelf.x2 += 2.0;
        NSLog(@"x2 = %.1f",weakSelf.x2);
    } executeSignal:^BOOL{
        return weakSelf.x1 == 1.0;
    }];
    
    //判断x2 = 1，最终没有添加，执行到这一步截止
    [SRShareQueue addAction:^{
        weakSelf.x3 += 1.0;
        NSLog(@"x3 = %.1f",weakSelf.x2);
    } executeSignal:^BOOL{
        return weakSelf.x2 == 1.0;
    }];
    
    [SRShareQueue start];
}

-(void)testSRGCD2
{
    //测试异步并行
    
    [SRShareQueue clearData];
    
    [SRShareQueue addAction:^{
        NSLog(@"Things1");
        NSLog(@"======线程:%@",[NSThread currentThread]);
    }];
    
    [SRShareQueue addAction:^{
        NSLog(@"Things2");
        NSLog(@"$$$$$$线程:%@",[NSThread currentThread]);
    }];
    
    [SRShareQueue addAction:^{
        NSLog(@"Things3");
        NSLog(@"||||||线程:%@",[NSThread currentThread]);
    }];
    
    [SRShareQueue async_start];
}

-(void)testSRGCD3
{
    //此时currentThread == mainThread
    //    NSLog(@"mainThread ~ %@",[NSThread mainThread]);
    NSLog(@"currentThread ~ %@",[NSThread currentThread]);
    
    //因为同步派发，没有开启新线程，只有一个线程 Thread1 在执行打印操作；
    //串行队列，同一时刻只有一个线程在执行任务，同步派发保证一个操作进行完，再进行下一个操作
    dispatch_queue_t seriQueue = dispatch_queue_create("com.seriQueue", DISPATCH_QUEUE_SERIAL);
    for (int i=0; i<5; i++) {
        dispatch_sync(seriQueue, ^{
            NSLog(@"在线程%@进行第%d个操作",[NSThread currentThread], i);
            sleep(1);
        });
    }
}

-(void)testSRGCD4
{
    NSLog(@"currentThread ~ %@",[NSThread currentThread]);
    
    dispatch_queue_t seriQueue = dispatch_queue_create("com.seriQueue", DISPATCH_QUEUE_SERIAL);
    
    //因为是异步派发，有一个新开启的Thread在执行打印操作 串行操作也按序进行
    for (int i=0; i<5; i++) {
        dispatch_async(seriQueue, ^{
            NSLog(@"在线程%@进行第%d个操作",[NSThread currentThread], i);
            sleep(1);
        });
    }
}

-(void)testSRGCD5
{
    NSLog(@"currentThread ~ %@",[NSThread currentThread]);
    
    dispatch_queue_t conQueue = dispatch_queue_create("com.conQueue", DISPATCH_QUEUE_CONCURRENT);
    
    //因为是同步派发，并没有开启新线程
    //虽然是并行队列，但是因为没有多余的线程来执行操作，所以任务也按序进行。
    for (int i=0; i<5; i++) {
        dispatch_sync(conQueue, ^{
            NSLog(@"在线程%@进行第%d个操作",[NSThread currentThread], i);
            sleep(1);
        });
    }
}

-(void)testSRGCD6
{
    NSLog(@"currentThread ~ %@",[NSThread currentThread]);
    
    dispatch_queue_t conQueue = dispatch_queue_create("com.conQueue", DISPATCH_QUEUE_CONCURRENT);
    
    //因为同步派发，系统开启了5条线程来执行操作
    //并行队列也保证了打印操作的同时进行，所以任务同时进行，并没有按添加的顺序。
    for (int i=0; i<5; i++) {
        dispatch_async(conQueue, ^{
            NSLog(@"在线程%@进行第%d个操作",[NSThread currentThread], i);
            sleep(1);
        });
    }
}

-(void)testSRGCD7
{
    dispatch_queue_t aGlobalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(aGlobalQueue, ^{
        for (int i=0; i<10; i++) {
            NSLog(@"11111111111 %@",[NSThread currentThread]);
        }
    });
    
    dispatch_async(aGlobalQueue, ^{
        for (int i=0; i<10; i++) {
            NSLog(@"22222222222 %@",[NSThread currentThread]);
        }
    });
}



@end
