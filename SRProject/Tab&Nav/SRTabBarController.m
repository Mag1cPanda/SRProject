//
//  SRTabBarController.m
//  SRProject
//
//  Created by longrise on 2018/8/29.
//  Copyright © 2018年 longrise. All rights reserved.
//

#import "SRTabBarController.h"
#import "OneViewController.h"
#import "TwoViewController.h"
#import "ThreeViewController.h"
#import "FourViewController.h"
#import "FiveViewController.h"
#import "SRNavigationController.h"

@interface SRTabBarController ()

@end

@implementation SRTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupControllers];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupControllers
{
    OneViewController *oneVC = [OneViewController new];
    [oneVC.tabBarItem setupWithTitle:@"首页" imageName:@"bar1_inactive" selectedImageName:@"bar1_active"];
    
    TwoViewController *twoVC = [TwoViewController new];
    [twoVC.tabBarItem setupWithTitle:@"圈子" imageName:@"bar2_inactive" selectedImageName:@"bar2_active"];
    
    ThreeViewController *threeVC = [ThreeViewController new];
    [threeVC.tabBarItem setupWithTitle:@"学习" imageName:@"bar3_inactive" selectedImageName:@"bar3_active"];
    
    FourViewController *fourVC = [FourViewController new];
    [fourVC.tabBarItem setupWithTitle:@"题库" imageName:@"bar4_inactive" selectedImageName:@"bar4_active"];
    
    FiveViewController *fiveVC = [FiveViewController new];
    [fiveVC.tabBarItem setupWithTitle:@"我的" imageName:@"bar5_inactive" selectedImageName:@"bar5_active"];
    
    SRNavigationController *nav1 = [[SRNavigationController alloc] initWithRootViewController:oneVC];
    SRNavigationController *nav2 = [[SRNavigationController alloc] initWithRootViewController:twoVC];
    SRNavigationController *nav3 = [[SRNavigationController alloc] initWithRootViewController:threeVC];
    SRNavigationController *nav4 = [[SRNavigationController alloc] initWithRootViewController:fourVC];
    SRNavigationController *nav5 = [[SRNavigationController alloc] initWithRootViewController:fiveVC];
    
    self.viewControllers = @[nav1, nav2, nav3, nav4, nav5];
    
    //设置选中的颜色
    [[UITabBar appearance] setTintColor:[UIColor blackColor]];
}



@end

@implementation UITabBarItem (Configuration)

-(void)setupWithTitle:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    self.title = title;
    self.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.selectedImage = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

@end