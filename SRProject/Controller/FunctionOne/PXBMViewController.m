//
//  PXBMViewController.m
//  SRProject
//
//  Created by longrise on 2018/8/30.
//  Copyright © 2018年 longrise. All rights reserved.
//

#import "PXBMViewController.h"
#import "SRTableView.h"
#import "CBTableViewDataSource.h"
#import "PXBMTopClassCell.h"
#import "PXBMBannerCell.h"
#import "PXBMRecommendOneCell.h"
#import "PXBMRecommendTwoCell.h"
#import "PXBMSecondClassCell.h"
#import "BBAllCourseViewController.h"
//#import <ReactiveObjC.h>

@interface PXBMViewController ()
<UITableViewDelegate,
UITableViewDataSource,
UICollectionViewDelegate,
UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) SRTableView *tableView;
@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) NSMutableArray *topData;

@property (nonatomic, strong) NSMutableArray *secondData;

@end

@implementation PXBMViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"培训报名";
    self.view.backgroundColor = ColorWithHex(0xF9F9F9);
    
    [self.view addSubview:self.tableView];
    
    [self.view addSubview:self.collectionView];
    
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
    
    _topData = [NSMutableArray arrayWithArray:data];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(CGFloat)getViewHeight
{
    return ScreenHeight-NavHeight;
}

#pragma mark - UITableViewDelegate & UITableViewDataSource
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _topData.count;
}

- (UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    static NSString *cellId = @"cellId";
    
    PXBMTopClassCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[PXBMTopClassCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        
        NSDictionary *dic = self.topData[indexPath.row];
        
        cell.centerLabel.text = dic[@"text"];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    PXBMTopClassCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.cellSelected = YES;
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    PXBMTopClassCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.cellSelected = NO;
}


#pragma mark - UICollectionView
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 4;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section == 0) {
        return 2;
    }

    if (section == 1) {
        return 10;
    }

    if (section == 2) {
        return 10;
    }

    if (section == 3) {
        return 5;
    }
    
    return 0;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        PXBMBannerCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PXBMBannerCell" forIndexPath:indexPath];
        return cell;
    }
    
    if (indexPath.section == 1) {
        PXBMRecommendOneCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PXBMRecommendOneCell" forIndexPath:indexPath];
        cell.index = indexPath.item;
        return cell;
    }
    
    if (indexPath.section == 2) {
        PXBMRecommendTwoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PXBMRecommendTwoCell" forIndexPath:indexPath];
        return cell;
    }
    
    if (indexPath.section == 3) {
        NSString *cellId=[NSString stringWithFormat:@"PXBMSecondClassCell%zi%zi", indexPath.section,indexPath.row];
        [collectionView registerClass:[PXBMSecondClassCell class] forCellWithReuseIdentifier:cellId];
        
        PXBMSecondClassCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
        
        
        return cell;
    }
    
    return [UICollectionViewCell new];
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return CGSizeMake(ScreenWidth-90, 90);
    }
    
    if (indexPath.section == 1) {
        return CGSizeMake(ScreenWidth-90, 38);
    }
    
    if (indexPath.section == 2) {
        return CGSizeMake(ScreenWidth-90, 64);
    }
    
    if (indexPath.section == 3) {
        return CGSizeMake((ScreenWidth-90-40)/3, 30);
    }
    
    return CGSizeZero;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        
    }
    
    if (indexPath.section == 1) {
        
    }
    
    if (indexPath.section == 2) {
        
    }
    
    if (indexPath.section == 3) {
        PXBMSecondClassCell *cell = (PXBMSecondClassCell *)[collectionView cellForItemAtIndexPath:indexPath];
        cell.cellSelected = YES;
        
        BBAllCourseViewController *vc = [BBAllCourseViewController new];
        vc.title = @"继续教育";
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    if (section == 3) {
        return UIEdgeInsetsMake(10, 10, 10, 10);
    } else {
        return UIEdgeInsetsZero;
    }
}

//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
//{
//    return 10;
//}

//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
//{
//    return 10;
//}


-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        
    }
    
    if (indexPath.section == 1) {
        
    }
    
    if (indexPath.section == 2) {
        
    }
    
    if (indexPath.section == 3) {
        PXBMSecondClassCell *cell = (PXBMSecondClassCell *)[collectionView cellForItemAtIndexPath:indexPath];
        cell.cellSelected = NO;
    }
}

#pragma mark - Lazy
-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[SRTableView alloc] initWithFrame:CGRectMake(0, NavHeight, 90, [self getViewHeight]) style:UITableViewStylePlain];
        _tableView.backgroundColor = ColorWithHex(0xF9F9F9);
//        _tableView.backgroundView =
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

-(UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
//        layout.itemSize = CGSizeMake(100, 100);
//        layout.minimumInteritemSpacing = 10;
//        layout.minimumLineSpacing = 0;
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(90, NavHeight, ScreenWidth-90, [self getViewHeight]) collectionViewLayout:layout];
        _collectionView.backgroundColor = ColorWithHex(0xF9F9F9);
//        _collectionView.backgroundView =
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        

        [_collectionView registerClass:[PXBMBannerCell class] forCellWithReuseIdentifier:@"PXBMBannerCell"];
        [_collectionView registerClass:[PXBMRecommendOneCell class] forCellWithReuseIdentifier:@"PXBMRecommendOneCell"];
        [_collectionView registerClass:[PXBMRecommendTwoCell class] forCellWithReuseIdentifier:@"PXBMRecommendTwoCell"];
//        [_collectionView registerClass:[PXBMSecondClassCell class] forCellWithReuseIdentifier:@"PXBMSecondClassCell"];
        
        if (@available(iOS 11.0, *)) {
            _collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
    }
    return _collectionView;
}








@end
