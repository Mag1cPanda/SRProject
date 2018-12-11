//
//  SRTableView.m
//  SRProject
//
//  Created by longrise on 2018/8/30.
//  Copyright © 2018年 longrise. All rights reserved.
//

#import "SRTableView.h"

@implementation SRTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self) {
//        self.tableFooterView = [UIView new];
        
        if (@available(iOS 11.0, *)) {
//            self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
//            self.contentInset =UIEdgeInsetsMake(64,0,49,0);//64和49自己看效果，是否应该改成0
//            self.scrollIndicatorInsets =self.contentInset;
        }
        
//        self.estimatedRowHeight = 0;
//
//        self.estimatedSectionHeaderHeight = 0;
//
//        self.estimatedSectionFooterHeight = 0;
        
    }
    return self;
}

@end
