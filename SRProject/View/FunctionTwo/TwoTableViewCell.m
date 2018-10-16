//
//  TwoTableViewCell.m
//  SRProject
//
//  Created by longrise on 2018/8/30.
//  Copyright © 2018年 longrise. All rights reserved.
//

#import "TwoTableViewCell.h"

@implementation TwoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setModel:(TwoModel *)model
{
    _model = model;
    self.textLabel.text = model.content;
    self.detailTextLabel.text = model.updatetime;
}

@end
