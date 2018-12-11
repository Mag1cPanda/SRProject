//
//  BaseViewController.m
//  SRProject
//
//  Created by longrise on 2018/8/29.
//  Copyright © 2018年 longrise. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()


@end

@implementation BaseViewController

#pragma mark - LifeCycle
- (instancetype)init
{
    self = [super init];
    if (self) {
      
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : ColorWithHex(0x4D4D4D), NSFontAttributeName : SystemFont(18)}];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    
    if (self.navigationController.viewControllers.count > 1) {
//                UIImage *backButtonImage = [[UIImage imageNamed:@"ic_back_main"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 25, 0, 0)];
                self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"ic_back_main"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(backBtnClicked)];
        
//        self.navigationItem.backBarButtonItem = leftItem;
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

}

-(void)backBtnClicked
{
    [self.navigationController popViewControllerAnimated:YES];
}

//重写setTitle方法，避免setTitle时改变TarBarItem
-(void)setTitle:(NSString *)title
{
    self.navigationItem.title = title;
}




@end
