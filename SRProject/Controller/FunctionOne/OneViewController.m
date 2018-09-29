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

@interface OneViewController ()
<MYTreeTableViewControllerDelegate>
@property (nonatomic, strong) SRTableView *tableView;

@property (nonatomic, strong) OneViewModel *viewModel;
@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"One";
    [self.view addSubview:self.tableView];
    
//    NSLog(@"%@",kBBURL2);
    
    NSArray *data = @[@"Demo1-商品分类",
                      @"Demo2-GCD封装",
                      @"Demo3-SwiftTest",
                      @"Demo4-横向Table",
                      @"Demo5-树状列表"];
    

//    [self.tableView cb_makeSectionWithData:data];
    
    [self.tableView cb_makeDataSource:^(CBTableViewDataSourceMaker *make) {
        [make makeSection:^(CBTableViewSectionMaker *section) {
           section.cell([PXBMTopClassCell class])
            .data(data)
            .adapter(^(PXBMTopClassCell *cell, NSString *data, NSUInteger index){
                if (index % 2 == 0) {
                    cell.leftView.hidden = YES;
                } else {
                    cell.leftView.hidden = NO;
                }
                cell.centerLabel.text = data;
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
    if (_viewModel) {
        _viewModel = [OneViewModel new];
    }
    return _viewModel;
}

@end
