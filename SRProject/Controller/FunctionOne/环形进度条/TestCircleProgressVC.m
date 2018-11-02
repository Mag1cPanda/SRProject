//
//  TestCircleProgressVC.m
//  SRProject
//
//  Created by longrise on 2018/11/2.
//  Copyright © 2018 longrise. All rights reserved.
//

#import "TestCircleProgressVC.h"
#import "SRCircleProgress.h"

@interface TestCircleProgressVC ()
@property (nonatomic, strong) SRCircleProgress *progressView;
@end

@implementation TestCircleProgressVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _progressView = [[SRCircleProgress alloc] initWithFrame:CGRectMake(ScreenWidth/2-100, 80, 200, 200)];
//    _progressView.totalValue = 100;
//    _progressView.currentValue = 50;
//    _progressView.backColor = [UIColor blackColor];
//    _progressView.trackColor = [UIColor redColor];
    [self.view addSubview:_progressView];
    
    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(ScreenWidth/2-100, CGRectGetMaxY(_progressView.frame) + 50, 200, 30)];
    [slider addTarget:self action:@selector(sliderMethod:) forControlEvents:UIControlEventValueChanged];
    [slider setMaximumValue:1];
    [slider setMinimumValue:0];
    [slider setMinimumTrackTintColor:[UIColor colorWithRed:255.0f/255.0f green:151.0f/255.0f blue:0/255.0f alpha:1]];
    [self.view addSubview:slider];
}

-(void)sliderMethod:(UISlider*)slider
{
    _progressView.progress = slider.value;
}



@end
