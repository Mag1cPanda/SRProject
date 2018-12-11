//
//  SRNavigationController.m
//  SRProject
//
//  Created by longrise on 2018/8/29.
//  Copyright © 2018年 longrise. All rights reserved.
//

#import "SRNavigationController.h"
#import "SRMacro.h"

@interface SRNavigationController ()
<UIGestureRecognizerDelegate>
@end

@implementation SRNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - rewrite
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    //initWithRootViewController会push根VC进栈，此时self.viewControllers.count为1
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:animated];
    
    NSLog(@"%zi",self.viewControllers.count);
}

//-(UIBarButtonItem *)rt_customBackItemWithTarget:(id)target action:(SEL)action
//{
//    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"ic_back_main"] style:UIBarButtonItemStylePlain target:target action:action];
//    return item;
//}


@end
