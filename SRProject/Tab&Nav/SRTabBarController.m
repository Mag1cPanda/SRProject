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

//#import "GKNavigationController.h"
#import "JPNavigationController.h"

@interface SRTabBarController ()

@end

@implementation SRTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    //解决Pop时tabBar跳动
    [[UITabBar appearance] setTranslucent:NO];
    
    [self setupControllers];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupControllers
{
    OneViewController *oneVC = [OneViewController new];
    SRNavigationController *nav1 = [[SRNavigationController alloc] initWithRootViewController:oneVC];
//    JPNavigationController *nav1 = [[JPNavigationController alloc] initWithRootViewController:oneVC];
    [nav1.tabBarItem setupWithTitle:@"One" imageName:@"bar1_inactive" selectedImageName:@"bar1_active"];
    
    TwoViewController *twoVC = [TwoViewController new];
    SRNavigationController *nav2 = [[SRNavigationController alloc] initWithRootViewController:twoVC];
    [nav2.tabBarItem setupWithTitle:@"Two" imageName:@"bar2_inactive" selectedImageName:@"bar2_active"];
    
    ThreeViewController *threeVC = [ThreeViewController new];
    SRNavigationController *nav3 = [[SRNavigationController alloc] initWithRootViewController:threeVC];
    [nav3.tabBarItem setupWithTitle:@"Three" imageName:@"bar3_inactive" selectedImageName:@"bar3_active"];
    
    FourViewController *fourVC = [FourViewController new];
    SRNavigationController *nav4 = [[SRNavigationController alloc] initWithRootViewController:fourVC];
    [nav4.tabBarItem setupWithTitle:@"Four" imageName:@"bar4_inactive" selectedImageName:@"bar4_active"];
    
    FiveViewController *fiveVC = [FiveViewController new];
    SRNavigationController *nav5 = [[SRNavigationController alloc] initWithRootViewController:fiveVC];
    [nav5.tabBarItem setupWithTitle:@"Five" imageName:@"bar5_inactive" selectedImageName:@"bar5_active"];
    
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
