//
//  PXBMTopClassCell.h
//  SRProject
//
//  Created by longrise on 2018/8/30.
//  Copyright © 2018年 longrise. All rights reserved.
//

#import "BaseTableViewCell.h"

@interface PXBMTopClassCell : BaseTableViewCell

@property (nonatomic, strong) UILabel *centerLabel;
@property (nonatomic, strong) UIView *leftView;

@property (nonatomic, strong) NSDictionary *dataDic;

@property (nonatomic, assign) BOOL cellSelected;

@end
