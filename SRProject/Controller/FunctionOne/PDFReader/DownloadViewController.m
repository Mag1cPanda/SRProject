//
//  DownloadViewController.m
//  PDFViewAndDownload
//
//  Created by Dustin on 17/4/6.
//  Copyright © 2017年 PicVision. All rights reserved.
//

#import "DownloadViewController.h"
#import "Masonry.h"

@interface DownloadViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation DownloadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UITableView *myTV = [[UITableView alloc] initWithFrame:CGRectMake(0, 60, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 60) style:UITableViewStylePlain];
    myTV.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    myTV.delegate = self;
    myTV.dataSource = self;
    [self.view addSubview:myTV];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"scanCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"scanCell"];
    }
    cell.textLabel.textColor = [UIColor colorWithRed:64/255.0 green:136.0/255.0 blue:164/255.0 alpha:1.0];
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"NSData 下载";
            break;
        case 1:
            cell.textLabel.text = @"AFN 下载";
            break;
            
        default:
            break;
    }
    
    
    
    return cell;
}

@end
