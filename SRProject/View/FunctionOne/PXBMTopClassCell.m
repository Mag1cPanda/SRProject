//
//  PXBMTopClassCell.m
//  SRProject
//
//  Created by longrise on 2018/8/30.
//  Copyright © 2018年 longrise. All rights reserved.
//

#import "PXBMTopClassCell.h"

#define SelectedBackColor ColorWithHex(0xF9F9F9)
#define UnSelectedBackColor ColorWithHex(0xEEEEEE)
#define SelectedTextColor ColorWithHex(0xFE9806)
#define UnSelectedTextColor ColorWithHex(0x999999)


@implementation PXBMTopClassCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = ColorWithHex(0xEEEEEE);
        
        self.leftView = [UIView new];
        self.leftView.hidden = YES;
        self.leftView.backgroundColor = ColorWithHex(0xFF9600);
        [self.contentView addSubview:self.leftView];
        [self.leftView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.bottom.mas_equalTo(0);
            make.width.mas_equalTo(3);
        }];
        
        self.centerLabel = [UILabel new];
        self.centerLabel.textAlignment = NSTextAlignmentCenter;
        self.centerLabel.textColor = UnSelectedTextColor;
        self.centerLabel.font = SystemFont(14);
        [self.contentView addSubview:self.centerLabel];
        [self.centerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.contentView.mas_centerY);
            make.left.mas_equalTo(8);
            make.right.mas_equalTo(-8);
        }];
        
        UIView *lineView = [UIView new];
        lineView.backgroundColor = ColorWithHex(0xDDDDDD);
        [self.contentView addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.mas_equalTo(0);
            make.height.mas_equalTo(0.5);
        }];
    }
    return self;
}


-(void)setDataDic:(NSDictionary *)dataDic
{
    self.centerLabel.text = dataDic[@"text"];
}

-(void)setCellSelected:(BOOL)cellSelected
{
    _cellSelected = cellSelected;
    
    if (cellSelected) {
        self.contentView.backgroundColor = SelectedBackColor;
        self.centerLabel.textColor = SelectedTextColor;
        self.leftView.hidden = NO;
    } else {
        self.contentView.backgroundColor = UnSelectedBackColor;
        self.centerLabel.textColor = UnSelectedTextColor;
        self.leftView.hidden = YES;
    }
}





@end
