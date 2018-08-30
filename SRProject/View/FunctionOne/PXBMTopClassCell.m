//
//  PXBMTopClassCell.m
//  SRProject
//
//  Created by longrise on 2018/8/30.
//  Copyright © 2018年 longrise. All rights reserved.
//

#import "PXBMTopClassCell.h"

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
        self.leftView = [UIView new];
        self.leftView.backgroundColor = ColorWithHex(0xFF9600);
        [self.contentView addSubview:self.leftView];
        [self.leftView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.bottom.mas_equalTo(0);
            make.width.mas_equalTo(3);
        }];
        
        self.centerLabel = [UILabel new];
//        self.centerLabel.text = @"哈哈哈哈哈哈";
        self.centerLabel.textColor = OrangeTextColor;
        self.centerLabel.font = SystemFont(14);
        [self.contentView addSubview:self.centerLabel];
        [self.centerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.contentView.mas_centerY);
            make.left.mas_equalTo(8);
            make.right.mas_equalTo(-8);
        }];
    }
    return self;
}


-(void)setDataDic:(NSDictionary *)dataDic
{
    self.centerLabel.text = dataDic[@"text"];
}



@end
