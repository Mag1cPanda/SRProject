//
//  OneViewController.m
//  SRProject
//
//  Created by longrise on 2018/8/29.
//  Copyright © 2018年 longrise. All rights reserved.
//

#import "OneViewController.h"
#import "SRTableView.h"
#import "CBTableViewDataSource.h"
#import "PXBMTopClassCell.h"
#import "OneViewModel.h"
#import "PXBMViewController.h"
#import "GCDTestViewController.h"
#import "SRProject-Swift.h"
#import "HorizontalListVC.h"
#import "SRTreeTableViewController.h"
#import "SRCalendarDemoVC.h"
#import "PDFReaderDemoVC.h"
#import "UINavigationController+FDFullscreenPopGesture.h"
#import "CYLTabBarControllerConfig.h"
#import "SRChartListVC.h"

#define RANDOM_COLOR [UIColor colorWithHue: (arc4random() % 256 / 256.0) saturation:((arc4random()% 128 / 256.0 ) + 0.5) brightness:(( arc4random() % 128 / 256.0 ) + 0.5) alpha:1]

@interface OneViewController ()
<MYTreeTableViewControllerDelegate,
CYLTabBarControllerDelegate,
UITabBarControllerDelegate>
@property (nonatomic, strong) SRTableView *tableView;

@property (nonatomic, strong) OneViewModel *viewModel;
@property (nonatomic, strong) NSMutableArray *data;

@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"One";
    [self.view addSubview:self.tableView];
    self.fd_interactivePopDisabled = YES;
//    self.fd_prefersNavigationBarHidden = YES;
    
    
    __weak typeof(self) weakSelf = self;
    [self.tableView cb_makeDataSource:^(CBTableViewDataSourceMaker *make) {
        [make makeSection:^(CBTableViewSectionMaker *section) {
           section.cell([PXBMTopClassCell class])
            .data(weakSelf.data)
            .adapter(^(PXBMTopClassCell *cell, NSString *text, NSUInteger index){
                if (index % 2 == 0) {
                    cell.leftView.hidden = YES;
                } else {
                    cell.leftView.hidden = NO;
                }
                cell.centerLabel.text = [NSString stringWithFormat:@"Demo%zi-%@", index+1, text];
            });
            
            section.event(^(NSUInteger index,NSDictionary *data) {
                
                if (index == 0) {
                    PXBMViewController *vc = [PXBMViewController new];
                    [self.navigationController pushViewController:vc animated:YES];
                }
                
                if (index == 1) {
                    GCDTestViewController *vc = [GCDTestViewController new];
                    [self.navigationController pushViewController:vc animated:YES];
                }
                
                if (index == 2) {
                    TestSwiftViewController *vc = [TestSwiftViewController new];
                    [self.navigationController pushViewController:vc animated:YES];
                }
                
                if (index == 3) {
                    HorizontalListVC *vc = [HorizontalListVC new];
                    [self.navigationController pushViewController:vc animated:YES];
                }
                
                if (index == 4) {
                    SRTreeTableViewController *tblVC = [[SRTreeTableViewController alloc] initWithStyle:UITableViewStylePlain];
                    tblVC.delegate = self;
                    
                    tblVC.isShowExpandedAnimation = NO;
//                    tblVC.isShowArrowIfNoChildNode = NO;
//                    tblVC.isShowArrow = YES;
//                    tblVC.isShowCheck = YES;
//                    tblVC.isSingleCheck = NO;
//                    tblVC.isCancelSingleCheck = YES;
//                    tblVC.isExpandCheckedNode = YES;
//                    tblVC.isShowLevelColor = YES;
//                    tblVC.isShowSearchBar = YES;
//                    tblVC.isSearchRealTime = YES;
//                    tblVC.checkItemIds = [NSArray array];
                    
                    [self.navigationController pushViewController:tblVC animated:YES];
                }
                
                if (index == 5) {
                    SRCalendarDemoVC *vc = [SRCalendarDemoVC new];
                    [self.navigationController pushViewController:vc animated:YES];
                }
                
                if (index == 6) {
                    PDFReaderDemoVC *vc = [PDFReaderDemoVC new];
                    [self.navigationController pushViewController:vc animated:YES];
                }
                
                if (index == 7) {
                    CYLTabBarController *tabBarController = CYLTabBarControllerConfig.new.tabBarController;
                    tabBarController.delegate = self;
                    [self customizeInterfaceWithTabBarController:tabBarController];
                    [self.navigationController pushViewController:tabBarController animated:YES];
                }
                
                if (index == 8) {
                    SRChartListVC *vc = SRChartListVC.new;
                    [self.navigationController pushViewController:vc animated:YES];
                }
                
            });
            
//            section.headerTitle(@"11111");
//            section.footerView(^(){
//                UIView *footer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 40)];
//                footer.backgroundColor = OrangeTextColor;
//                return footer;
//            });
        }];
        
//        make.headerView(^(){
//            UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 40)];
//            header.backgroundColor = OrangeTextColor;
//            return header;
//        });
        
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - MYTreeTableViewControllerDelegate
- (void)tableViewController:(MYTreeTableViewController *)tableViewController checkItems:(NSArray<MYTreeItem *> *)items
{
    NSLog(@"%@", [NSString stringWithFormat:@"已选择了 %lu 个 items", (unsigned long)items.count]);
}

#pragma mark - UITabBarControllerDelegate
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    return YES;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectControl:(UIControl *)control {
    UIView *animationView;
    
    if ([control cyl_isTabButton]) {
        //更改红标状态
        if ([[self cyl_tabBarController].selectedViewController cyl_isShowTabBadgePoint]) {
            [[self cyl_tabBarController].selectedViewController cyl_removeTabBadgePoint];
        } else {
            [[self cyl_tabBarController].selectedViewController cyl_showTabBadgePoint];
        }
        
        animationView = [control cyl_tabImageView];
    }
    
    // 即使 PlusButton 也添加了点击事件，点击 PlusButton 后也会触发该代理方法。
    if ([control cyl_isPlusButton]) {
        UIButton *button = CYLExternPlusButton;
        animationView = button.imageView;
    }
    
    NSUInteger selectedIndex = [self cyl_tabBarController].selectedIndex;
    NSLog(@"selectedIndex ~ %zi",selectedIndex);
    if (selectedIndex % 2 == 0) {
        [self addScaleAnimationOnView:animationView repeatCount:1];
    } else {
        [self addRotateAnimationOnView:animationView];
    }
}

//缩放动画
- (void)addScaleAnimationOnView:(UIView *)animationView repeatCount:(float)repeatCount {
    //需要实现的帧动画，这里根据需求自定义
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"transform.scale";
    animation.values = @[@1.0,@1.3,@0.9,@1.15,@0.95,@1.02,@1.0];
    animation.duration = 1;
    animation.repeatCount = repeatCount;
    animation.calculationMode = kCAAnimationCubic;
    [animationView.layer addAnimation:animation forKey:nil];
}

//旋转动画
- (void)addRotateAnimationOnView:(UIView *)animationView {
    // 针对旋转动画，需要将旋转轴向屏幕外侧平移，最大图片宽度的一半
    // 否则背景与按钮图片处于同一层次，当按钮图片旋转时，转轴就在背景图上，动画时会有一部分在背景图之下。
    // 动画结束后复位
    animationView.layer.zPosition = 65.f / 2;
    [UIView animateWithDuration:0.32 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        animationView.layer.transform = CATransform3DMakeRotation(M_PI, 0, 1, 0);
    } completion:nil];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:0.70 delay:0 usingSpringWithDamping:1 initialSpringVelocity:0.2 options:UIViewAnimationOptionCurveEaseOut animations:^{
            animationView.layer.transform = CATransform3DMakeRotation(2 * M_PI, 0, 1, 0);
        } completion:nil];
    });
}

#pragma mark - Private
- (void)customizeInterfaceWithTabBarController:(CYLTabBarController *)tabBarController {

    [tabBarController hideTabBadgeBackgroundSeparator];
    //添加小红点
    UIViewController *viewController = tabBarController.viewControllers[0];
    UIView *tabBadgePointView0 = [UIView cyl_tabBadgePointViewWithClolor:RANDOM_COLOR radius:4.5];
    [viewController.tabBarItem.cyl_tabButton cyl_setTabBadgePointView:tabBadgePointView0];
    [viewController cyl_showTabBadgePoint];
    
    UIView *tabBadgePointView1 = [UIView cyl_tabBadgePointViewWithClolor:RANDOM_COLOR radius:4.5];
    @try {
        [tabBarController.viewControllers[1] cyl_setTabBadgePointView:tabBadgePointView1];
        [tabBarController.viewControllers[1] cyl_showTabBadgePoint];
        
        UIView *tabBadgePointView2 = [UIView cyl_tabBadgePointViewWithClolor:RANDOM_COLOR radius:4.5];
        [tabBarController.viewControllers[2] cyl_setTabBadgePointView:tabBadgePointView2];
        [tabBarController.viewControllers[2] cyl_showTabBadgePoint];
        
        [tabBarController.viewControllers[3] cyl_showTabBadgePoint];
        
        //添加提示动画，引导用户点击
        [self addScaleAnimationOnView:tabBarController.viewControllers[3].cyl_tabButton.cyl_tabImageView repeatCount:20];
    } @catch (NSException *exception) {}
}


#pragma mark - Lazy
-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[SRTableView alloc] initWithFrame:CGRectMake(0, NavHeight, ScreenWidth, ScreenHeight-NavHeight-TabBarHeight) style:UITableViewStylePlain];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

-(OneViewModel *)viewModel
{
    if (!_viewModel) {
        _viewModel = [OneViewModel new];
    }
    return _viewModel;
}

-(NSMutableArray *)data
{
    if (!_data) {
        _data = [NSMutableArray array];
        NSArray *data = @[@"商品分类",
                          @"GCD封装",
                          @"SwiftTest",
                          @"横向Table",
                          @"树状列表",
                          @"日历",
                          @"PDF阅读",
                          @"异形TabBar",
                          @"图表"];
        [_data addObjectsFromArray:data];
        for (NSInteger i=0; i<100; i++) {
            [_data addObject:@"开发中"];
        }
    }
    return _data;
}

@end
