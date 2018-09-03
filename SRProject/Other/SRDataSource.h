//
//  SRDataSource.h
//  QQSectionCopy
//
//  Created by Siren on 16/1/30.
//  Copyright © 2016年 Siren. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^SRCellConfigureBlock)(id cell, id item);
@interface SRDataSource : NSObject<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) NSArray *items;
@property (nonatomic, strong) NSString *cellIdentifier;
@property (nonatomic, copy) SRCellConfigureBlock configureCellBlock;


-(id)initWithItems:(NSArray *)items
    cellIdentifier:(NSString *)cellIdentifier
configureCellBlock:(SRCellConfigureBlock)configureBlock;

-(id)itemAtIndexPath:(NSIndexPath *)indexPath;

@end
