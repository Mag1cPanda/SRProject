//
//  SRPDFListVC.m
//  SRProject
//
//  Created by longrise on 2018/10/10.
//  Copyright © 2018年 longrise. All rights reserved.
//

#import "SRPDFListVC.h"
#import "Masonry.h"

@interface SRPDFListVC ()
<UITableViewDataSource, UITableViewDelegate>
{
    float view_width, view_height;
}
@property (nonatomic, strong) UITableView *pdfTableView;
@end

@implementation SRPDFListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"PDF List";
    
    [self creatUI];
}

- (void)creatUI
{
    view_width = self.view.frame.size.width;
    view_height = self.view.frame.size.height;
    NSLog(@"self.view.frame = %@",NSStringFromCGRect(self.view.frame));
    _titleArray = @[@"iOS 开发笔记——PDF的显示和浏览",@"Objective-C和CoreFoundation对象相互转换的内存管理总结",@"HTML5从入门到精通"];
    _fileArray = @[@"001.pdf", @"002.pdf",  @"003.pdf"];
    CGRect frame = CGRectMake(10, 64, view_width-20, view_height-150);
    _pdfTableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
    _pdfTableView.dataSource = self;
    _pdfTableView.delegate = self;
    _pdfTableView.tableHeaderView = [[UIView alloc] init];
    _pdfTableView.tableFooterView = [[UIView alloc] init];
    [self.view addSubview:_pdfTableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _titleArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"pdfTableView_cell";
    UITableViewCell *cell =  [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    }
    NSString *titleText = [_titleArray objectAtIndex:indexPath.row];
    cell.textLabel.text = titleText;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSLog(@"didSelectRowAtIndexPath >>>> ");
    
  
}



@end
