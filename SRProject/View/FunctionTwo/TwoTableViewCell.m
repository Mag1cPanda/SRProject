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

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier];
    if (self) {
        self.textLabel.numberOfLines = 2;
        self.textLabel.textColor = [UIColor darkGrayColor];
        self.detailTextLabel.textColor = [UIColor lightGrayColor];
    }
    return self;
}

-(void)setModel:(TwoModel *)model
{
    _model = model;
    
    self.textLabel.text = model.title;
    
    NSString *platformStr = [self platformMap:model.platform];
    self.detailTextLabel.text = [NSString stringWithFormat:@"%@ @%@ · %@", model.postdate, model.author, platformStr];
}

- (NSString *)platformMap:(NSInteger)platform{
    switch (platform) {
        case 0:
            return @"微博";
        case 1:
            return @"公众号";
        case 2:
            return @"GitHub";
        case 3:
            return @"Meidum";
        default:
            return @"未知";
    }
}

@end
