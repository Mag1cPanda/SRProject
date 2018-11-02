//
//  SRModalTestVC.m
//  SRProject
//
//  Created by longrise on 2018/10/19.
//  Copyright © 2018 longrise. All rights reserved.
//

#import "SRModalTestVC.h"

@interface SRModalTestVC ()

@end

@implementation SRModalTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end
