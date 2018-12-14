//
//  LifeCycleVC.m
//  SRProject
//
//  Created by longrise on 2018/12/12.
//  Copyright © 2018 longrise. All rights reserved.
//

#import "LifeCycleVC.h"

@interface LifeCycleVC ()

@end

@implementation LifeCycleVC

- (void)loadView
{
    [super loadView];
    NSLog(@"method: %@",NSStringFromSelector(_cmd));
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"method: %@",NSStringFromSelector(_cmd));
}

-(void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    NSLog(@"method: %@",NSStringFromSelector(_cmd));
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    NSLog(@"method: %@",NSStringFromSelector(_cmd));
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"method: %@",NSStringFromSelector(_cmd));
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"method: %@",NSStringFromSelector(_cmd));
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    NSLog(@"method: %@",NSStringFromSelector(_cmd));
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    NSLog(@"method: %@",NSStringFromSelector(_cmd));
}

-(void)dealloc
{
    NSLog(@"dealloc");
}

@end
