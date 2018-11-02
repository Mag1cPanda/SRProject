//
//  SRChartListVC.m
//  SRProject
//
//  Created by longrise on 2018/10/17.
//  Copyright © 2018 longrise. All rights reserved.
//

#import "SRChartListVC.h"
#import "SRChartSampleVC.h"

NSString * const cellID = @"UITableViewCell";

@interface SRChartListVC ()
<UITableViewDelegate,
UITableViewDataSource>
@property (nonatomic, strong) UITableView *table;
@property (nonatomic, strong) NSArray *dataArr;
@end

@implementation SRChartListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Chart List";
    
    _dataArr = @[@"Line Chart",
                 @"Bar Chart",
                 @"Circle Chart",
                 @"Pie Chart",
                 @"Scatter Chart",
                 @"Radar Chart"];
    
    self.table = [[UITableView alloc] initWithFrame:CGRectMake(0, NavHeight, ScreenWidth, ScreenHeight-NavHeight) style:UITableViewStylePlain];
    self.table.delegate = self;
    self.table.dataSource = self;
    [self.view addSubview:self.table];
    
    [self.table registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
}


-(NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    cell.textLabel.text = _dataArr[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SRChartSampleVC *vc = SRChartSampleVC.new;
    vc.titleStr = _dataArr[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
