//
//  SRPDFListVC.h
//  SRProject
//
//  Created by longrise on 2018/10/10.
//  Copyright © 2018年 longrise. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SRPDFListVC : UIViewController

/**
 标题数组
 */
@property (nonatomic, strong) NSArray *titleArray;

/**
 图片封面数组
 */
@property (nonatomic, strong) NSArray *imageArray;

/**
 pdf文件数组
 */
@property (nonatomic, strong) NSArray *fileArray;
@end
