//
//  BaseTableViewCell.h
//  SRProject
//
//  Created by longrise on 2018/8/29.
//  Copyright © 2018年 longrise. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry.h>
#import "SRConstant.h"

@interface BaseTableViewCell : UITableViewCell

+ (CGFloat)cellHeight;
+ (NSString *)reuseIdentifier;

@end
