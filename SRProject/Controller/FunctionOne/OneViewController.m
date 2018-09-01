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

@interface OneViewController ()
@property (nonatomic, strong) SRTableView *tableView;
//@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) OneViewModel *viewModel;
@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"One";
    [self.view addSubview:self.tableView];
    
    
    NSArray *data = @[@{@"text":@"Following"},
                      @{@"text":@"Follower"},
                      @{@"text":@"Star"},
                      @{@"text":@"Setting"},
                      @{@"text":@"Share"},
                      @{@"text":@"Following"},
                      @{@"text":@"Follower"},
                      @{@"text":@"Star"},
                      @{@"text":@"Setting"},
                      @{@"text":@"Share"}];
    

//    [self.tableView cb_makeSectionWithData:data];
    
    [self.tableView cb_makeDataSource:^(CBTableViewDataSourceMaker *make) {
        [make makeSection:^(CBTableViewSectionMaker *section) {
           section.cell([PXBMTopClassCell class])
            .data(data)
            .adapter(^(PXBMTopClassCell * cell,NSDictionary * data,NSUInteger index){
                if (index % 2 == 0) {
                    cell.leftView.hidden = YES;
                } else {
                    cell.leftView.hidden = NO;
                }
                cell.dataDic = data;
            });
            
            section.event(^(NSUInteger index,NSDictionary *data) {
                PXBMViewController *vc = [PXBMViewController new];
                [self.navigationController pushViewController:vc animated:YES];
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

#pragma mark - Private

#pragma mark - Lazy
-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[SRTableView alloc] initWithFrame:CGRectMake(0, NavHeight, ScreenWidth, ScreenHeight-NavHeight-TabBarHeight) style:UITableViewStylePlain];
//        _tableView.backgroundColor = ColorWithHex(0xEEEEEE);
//        _tableView.backgroundColor = [UIColor colorNamed:@"Blue"];
        
        
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
