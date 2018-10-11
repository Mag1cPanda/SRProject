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

@interface OneViewController ()
<MYTreeTableViewControllerDelegate>
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
//                    SRTabBarController *vc = [SRTabBarController new];
//                    [self.navigationController pushViewController:vc animated:YES];
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


#pragma mark - Private

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
        NSArray *data = @[@"Demo1-商品分类",
                          @"GCD封装",
                          @"SwiftTest",
                          @"横向Table",
                          @"树状列表",
                          @"日历",
                          @"PDF阅读",
                          @"异形TabBar"];
        [_data addObjectsFromArray:data];
        for (NSInteger i=0; i<100; i++) {
            [_data addObject:@"开发中"];
        }
    }
    return _data;
}

@end
