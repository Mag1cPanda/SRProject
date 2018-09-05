//
//  BBCourseChildVC.m
//  baobaotong
//
//  Created by longrise on 2018/8/20.
//  Copyright © 2018年 zzy. All rights reserved.
//

#import "BBCourseChildVC.h"
#import "UIScrollView+EmptyDataSet.h"
#import "SRConstant.h"

@interface BBCourseChildVC ()
<DZNEmptyDataSetSource,DZNEmptyDataSetDelegate>
@property (nonatomic, strong) NSMutableArray *dataArr;

@end

@implementation BBCourseChildVC

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
//    NSString *action = @"";
//    if (_type == 23) {
//        action = @"click-保险医学";
//    } else {
//        action = @"click-保宝云课堂";
//    }
//
//    [IPDetector creatTargetCategory:@"精品课程" withAction:action withLable:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _dataArr = [NSMutableArray array];
    
    self.tableView.tableFooterView = [UIView new];
    self.tableView.showsVerticalScrollIndicator = NO;
    
    self.tableView.emptyDataSetSource = self;
    self.tableView.emptyDataSetDelegate = self;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    
//    [self requestCourseWithType:_type];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)requestCourseWithType:(int)type
{
    
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.textLabel.text = [NSString stringWithFormat:@"%zi",indexPath.row];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}

#pragma mark - DZNEmptyDataSetSource
- (nullable NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView
{
    NSDictionary *attributes = @{NSFontAttributeName : SystemFont(13),
                                 NSForegroundColorAttributeName : ColorWithHex(0xB2B2B2)
                                 };
    
    NSAttributedString *aStr = [[NSAttributedString alloc] initWithString:@"暂时没有课程" attributes:attributes];
    return aStr;
}

- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView
{
    return [UIImage imageNamed:@"im_im_course_blank"];
}

- (CGFloat)verticalOffsetForEmptyDataSet:(UIScrollView *)scrollView
{
    return -50;
}

//- (CGFloat)spaceHeightForEmptyDataSet:(UIScrollView *)scrollView
//{
//    return 100;
//}


#pragma mark - DZNEmptyDataSetDelegate

@end
