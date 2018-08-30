//
//  OneViewModel.m
//  SRProject
//
//  Created by longrise on 2018/8/30.
//  Copyright © 2018年 longrise. All rights reserved.
//

#import "OneViewModel.h"
#import "PXBMTopClassModel.h"

@implementation OneViewModel

-(NSMutableArray *)data
{
    if (!_data) {
        _data = [NSMutableArray array];
        for (NSInteger i=0; i<10; i++) {
            [_data addObject:[NSString stringWithFormat:@"哈哈哈哈哈%zi",i]];
        }
    }
    return _data;
}

@end
