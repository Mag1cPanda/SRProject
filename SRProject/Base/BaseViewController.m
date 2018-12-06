//
//  BaseViewController.m
//  SRProject
//
//  Created by longrise on 2018/8/29.
//  Copyright © 2018年 longrise. All rights reserved.
//

#import "BaseViewController.h"
#import "JPNavigationControllerKit.h"

@interface BaseViewController ()


@end

@implementation BaseViewController
- (instancetype)init
{
    self = [super init];
    if (self) {
        [NSBundle mainBundle] pathForResource:<#(nullable NSString *)#> ofType:<#(nullable NSString *)#>
         self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
//    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : ColorWithHex(0x4D4D4D), NSFontAttributeName : SystemFont(18)}];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}

//重写setTitle方法，避免setTitle时改变TarBarItem
-(void)setTitle:(NSString *)title
{
    self.navigationItem.title = title;
}




@end
