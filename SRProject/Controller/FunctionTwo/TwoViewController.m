//
//  TwoViewController.m
//  SRProject
//
//  Created by longrise on 2018/8/29.
//  Copyright © 2018年 longrise. All rights reserved.
//

#import "TwoViewController.h"
#import "TwoViewModel.h"
#import "TwoModel.h"
#import "SRTableView.h"
#import "TwoTableViewCell.h"
#import "NetworkManager.h"
#import <MJRefresh.h>
#import <MJExtension.h>
#import "MBProgressHUD+Extension.h"
#import <SafariServices/SafariServices.h>
#import "SearchViewController.h"
#import "SRNetworkManager.h"
#import "UIView+ProgressView.h"

@interface TwoViewController ()
<UITableViewDelegate,
UITableViewDataSource>
@property (nonatomic, strong) SRTableView *tableView;
@property (nonatomic, strong) UISearchController *searchController;
@property (nonatomic, strong) NSMutableArray *dataArr;
@property (nonatomic, strong) TwoViewModel *viewModel;

@property (nonatomic, assign) NSUInteger pageNum;
@property (nonatomic, assign, getter=isHasMoreData) BOOL hasMoreData;
@property (nonatomic, assign, getter=isLoadingData) BOOL loadingData;

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [NetworkManager setup];
    self.title = @"Two";
    [self.view addSubview:self.tableView];
    
    [self loadData];
}

#pragma mark - 加载数据
-(void)loadData
{
//    if (self.isLoadingData) {
//        return;
//    }
    
    if (self.pageNum <= 0) {
        self.pageNum = 1;
    }
    
//    [MBProgressHUD showActivityMessageInView:@"loading..."];
    [self.view showJUHUAWithBool:YES andTitle:@"正在加载..." andBackColor:[UIColor colorWithWhite:1 alpha:1] andAlpha:0.00001f];
    
    NSDictionary *parameters = @{@"page": @(self.pageNum)};
    [SRNetworkManager requestByPOSTWithServiceName:@"listAll" parameters:parameters onSuccess:^(id responseObject) {
        NSLog(@"SRNetworkManageronSuccess: %@", responseObject);
    } onFailure:^(NSError *error) {
        NSLog(@"SRNetworkManageronSuccessonFailure: %@", error);
    }];
    
    __weak typeof(self) weakSelf = self;
    [XMCenter sendRequest:^(XMRequest *request) {
        request.url = @"https://app.kangzubin.com/iostips/api/feed/listAll";
//        request.server = @"";
//        request.api = @"";
        request.parameters = @{@"page": @(self.pageNum)};
        request.httpMethod = kXMHTTPMethodGET;
    } onSuccess:^(id responseObject) {
        NSLog(@"onSuccess: %@", responseObject);
        
        if ([responseObject isKindOfClass:NSDictionary.class]) {
            NSArray *tmpArr = responseObject[@"data"][@"feeds"];
            for (NSDictionary *dic in tmpArr) {
//                TwoModel *model = [TwoModel mj_setKeyValues:dic];
                TwoModel *model = [TwoModel modelWithDic:dic];
                [self.dataArr addObject:model];
            }
            [weakSelf.tableView reloadData];
        }
        
        
    } onFailure:^(NSError *error) {
        NSLog(@"onFailure: %@", error);
    } onFinished:^(id responseObject, NSError *error) {
        NSLog(@"onFinished");
        dispatch_async(dispatch_get_main_queue(), ^{
//            [MBProgressHUD hideHUD];
            [self.view showJUHUAWithBool:NO];
            [weakSelf.tableView.mj_header endRefreshing];
        });
    }];
}

#pragma mark - Private

- (void)pullDownToRefresh {
//    if (self.isLoadingData) {
//        return;
//    }
    self.pageNum = 1;
    [self loadData];
}

- (SFSafariViewController *)xm_getDetailViewControllerAtIndexPath:(NSIndexPath *)indexPath  API_AVAILABLE(ios(9.0)){
    if (indexPath.row < self.dataArr.count) {
        TwoModel *model = self.dataArr[indexPath.row];
        if (model.url) {
            NSURL *url = [NSURL URLWithString:model.url];
            SFSafariViewController *sfViewController = [[SFSafariViewController alloc] initWithURL:url];
            if (@available(iOS 11.0, *)) {
                sfViewController.navigationItem.largeTitleDisplayMode = UINavigationItemLargeTitleDisplayModeNever;
                sfViewController.dismissButtonStyle = SFSafariViewControllerDismissButtonStyleClose;
            }
            return sfViewController;
        }
    }
    return nil;
}


//获取当前时间戳
//13位
- (NSString *)currentTimeStr13{
    NSDate* date = [NSDate dateWithTimeIntervalSinceNow:0];//获取当前时间0秒后的时间
    NSTimeInterval time=[date timeIntervalSince1970]*1000;// *1000 是精确到毫秒，不乘就是精确到秒
    NSString *timeString = [NSString stringWithFormat:@"%.0f", time];
    return timeString;
}

//10位
- (NSString *)currentTimeStr10{
    NSDate* date = [NSDate dateWithTimeIntervalSinceNow:0];//获取当前时间0秒后的时间
    NSTimeInterval time=[date timeIntervalSince1970];// *1000 是精确到毫秒，不乘就是精确到秒
    NSString *timeString = [NSString stringWithFormat:@"%.0f", time];
    return timeString;
}

- (NSString *)getTimeToTimeStr:(NSInteger)nowTime{
    CGFloat time = nowTime/1000.0;
    NSDate * detailDate = [NSDate dateWithTimeIntervalSince1970:time];
    //实例化一个NSDateFormatter对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *timeStr = [dateFormatter stringFromDate:detailDate];
    return timeStr;
}


#pragma mark - UITableViewDelegate & UITableViewDataSource
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArr.count;
}

- (UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    TwoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[TwoTableViewCell reuseIdentifier]];
    TwoModel *mdoel = _dataArr[indexPath.row];
    cell.model = mdoel;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
 
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
   
}

#pragma mark - Lazy
-(SRTableView *)tableView
{
    if (!_tableView) {
        _tableView = [[SRTableView alloc] initWithFrame:CGRectMake(0, NavHeight, ScreenWidth, ScreenHeight-NavHeight-TabBarHeight) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(pullDownToRefresh)];
        _tableView.estimatedRowHeight = UITableViewAutomaticDimension;
        
//        self.tableView.tableHeaderView = self.searchController.searchBar;
        
        [_tableView registerClass:[TwoTableViewCell class] forCellReuseIdentifier:[TwoTableViewCell reuseIdentifier]];
    }
    return _tableView;
}

- (UISearchController *)searchController {
    if (!_searchController) {
        SearchViewController *searchViewController = [[SearchViewController alloc] init];
        _searchController = [[UISearchController alloc] initWithSearchResultsController:searchViewController];
        _searchController.searchBar.placeholder = @"搜索";
        _searchController.searchResultsUpdater = searchViewController;
    }
    return _searchController;
}

-(NSMutableArray *)dataArr
{
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}

-(TwoViewModel *)viewModel
{
    if (!_viewModel) {
        _viewModel = [[TwoViewModel alloc] init];
    }
    return _viewModel;
}

@end
