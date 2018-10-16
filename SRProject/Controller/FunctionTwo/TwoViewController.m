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

@interface TwoViewController ()
<UITableViewDelegate,
UITableViewDataSource>
@property (nonatomic, strong) SRTableView *tableView;
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
    if (self.isLoadingData) {
        return;
    }
    
    self.loadingData = YES;
    if (self.pageNum <= 0) {
        self.pageNum = 1;
    }
    
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
            NSLog(@"%zi",tmpArr.count);
        }
        
        
    } onFailure:^(NSError *error) {
        NSLog(@"onFailure: %@", error);
    } onFinished:^(id responseObject, NSError *error) {
        NSLog(@"onFinished");
    }];
}

#pragma mark - Private

- (void)pullDownToRefresh {
    if (self.isLoadingData) {
      
        return;
    }
    self.pageNum = 1;
    [self loadData];
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
    static NSString *cellId = @"cellId";
    
    TwoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[TwoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        TwoModel *mdoel = _dataArr[indexPath.row];
        cell.model = mdoel;
    }
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
        _tableView = [[SRTableView alloc] initWithFrame:CGRectMake(0, StatusBarHeight, ScreenWidth, ScreenHeight-StatusBarHeight) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(pullDownToRefresh)];
    }
    return _tableView;
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
