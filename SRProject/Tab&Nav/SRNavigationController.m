//
//  SRNavigationController.m
//  SRProject
//
//  Created by longrise on 2018/8/29.
//  Copyright © 2018年 longrise. All rights reserved.
//

#import "SRNavigationController.h"
#import "SRMacro.h"
#import "UINavigationController+FDFullscreenPopGesture.h"

@interface SRNavigationController ()
<UIGestureRecognizerDelegate>
@end

@implementation SRNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.interactivePopGestureRecognizer.delegate = self;
//    self.fd_fullscreenPopGestureRecognizer.enabled = YES;
    
    //To disable this pop gesture of a view controller:
//    viewController.fd_interactivePopDisabled = YES;
    
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : ColorWithHex(0x4D4D4D), NSFontAttributeName : SystemFont(18)}];
//    [self.navigationBar lt_setBackgroundColor: ColorWithHex(0xF2F2F2)];
    [self.navigationBar setShadowImage:[UIImage new]];
    
//    UIImage *backButtonImage = [UIImage imageNamed:@"ic_back_main"];
//    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] init];
//    backItem.title = @"反馈";
//    //主要是以下两个图片设置
//    self.navigationBar.backIndicatorImage = backButtonImage;
//    self.navigationBar.backIndicatorTransitionMaskImage = backButtonImage;
//    self.navigationItem.backBarButtonItem = backItem;

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    // 排除根控制器，其他所有子控制器都要触发手势
    return self.viewControllers.count > 1;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {
        
        // 创建按钮
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0, 0, 44, 44);
        [button setImage:[UIImage imageNamed:@"ic_back_main"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"ic_back_main"] forState:UIControlStateHighlighted];
        
        // 让Image往左边偏移20
//        button.contentEdgeInsets = UIEdgeInsetsMake(0, -8, 0, 0);
        button.imageEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);

        // 添加监听方法
        [button addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
        
        // 修改导航栏左边的item
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
        
        // 隐藏tabbar
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:YES];
}

- (void)backClick
{
    // 导航控制器返回
    [self popViewControllerAnimated:YES];
}

@end
