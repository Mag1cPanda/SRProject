//
//  BBAllCourseViewController.m
//  SRProject
//
//  Created by longrise on 2018/9/5.
//  Copyright © 2018年 longrise. All rights reserved.
//

#import "BBAllCourseViewController.h"
#import "SRConstant.h"
#import "UIView+BBLayout.h"
#import "BBCourseChildVC.h"

@interface BBAllCourseViewController ()

@end

@implementation BBAllCourseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 添加所有子控制器
    [self setUpAllViewController];
    
    // 设置标题字体
    [self setUpTitleEffect:^(UIColor *__autoreleasing *titleScrollViewColor, UIColor *__autoreleasing *norColor, UIColor *__autoreleasing *selColor, UIFont *__autoreleasing *titleFont, CGFloat *titleHeight,CGFloat *titleWidth) {
        
        // 设置标题字体
        *titleFont = [UIFont systemFontOfSize:14];
        *norColor = ColorWithHex(0x999999);
        *selColor = ColorWithHex(0xff9803);
        *titleHeight = 40;
        *titleWidth = self.view.bb_width / 4.0;
    }];
    
    
    [self setUpTitleEffect:^(UIColor *__autoreleasing *titleScrollViewColor, UIColor *__autoreleasing *norColor, UIColor *__autoreleasing *selColor, UIFont *__autoreleasing *titleFont, CGFloat *titleHeight, CGFloat *titleWidth) {
        
        // 设置标题字体
        *titleFont = [UIFont systemFontOfSize:14];
        *norColor = ColorWithHex(0x999999);
        *selColor = ColorWithHex(0xff9803);
        *titleHeight = 40;
        *titleWidth = self.view.bb_width / 4.0;
        
    }];
    
    
    // 推荐方式（设置下标）
    [self setUpUnderLineEffect:^(BOOL *isUnderLineDelayScroll, CGFloat *underLineH, UIColor *__autoreleasing *underLineColor,BOOL *isUnderLineEqualTitleWidth) {
        // 标题填充模式
        *isUnderLineEqualTitleWidth = YES;
        *underLineH = 2;
        *underLineColor = ColorWithHex(0xff9803);
    }];
    
}


// 添加所有子控制器
- (void)setUpAllViewController
{
    // 段子
    BBCourseChildVC *wordVc1 = [[BBCourseChildVC alloc] init];
    wordVc1.title = @"小码哥";
    [self addChildViewController:wordVc1];
    
    // 段子
    BBCourseChildVC *wordVc2 = [[BBCourseChildVC alloc] init];
    wordVc2.title = @"M了个J";
    [self addChildViewController:wordVc2];
    
    // 段子
    BBCourseChildVC *wordVc3 = [[BBCourseChildVC alloc] init];
    wordVc3.title = @"啊峥";
    [self addChildViewController:wordVc3];
    
    BBCourseChildVC *wordVc4 = [[BBCourseChildVC alloc] init];
    wordVc4.title = @"吖了个峥";
    [self addChildViewController:wordVc4];
    
    // 全部
    BBCourseChildVC *allVc = [[BBCourseChildVC alloc] init];
    allVc.title = @"全部";
    [self addChildViewController:allVc];
    
    // 视频
    BBCourseChildVC *videoVc = [[BBCourseChildVC alloc] init];
    videoVc.title = @"视频";
    [self addChildViewController:videoVc];
    
    // 声音
    BBCourseChildVC *voiceVc = [[BBCourseChildVC alloc] init];
    voiceVc.title = @"声音";
    [self addChildViewController:voiceVc];
    
    // 图片
    BBCourseChildVC *pictureVc = [[BBCourseChildVC alloc] init];
    pictureVc.title = @"图片";
    [self addChildViewController:pictureVc];
    
    // 段子
    BBCourseChildVC *wordVc = [[BBCourseChildVC alloc] init];
    wordVc.title = @"段子";
    [self addChildViewController:wordVc];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
