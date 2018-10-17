//
//  SRChartSampleVC.m
//  SRProject
//
//  Created by longrise on 2018/10/17.
//  Copyright © 2018 longrise. All rights reserved.
//

#import "SRChartSampleVC.h"
#import "PNChart.h"

@interface SRChartSampleVC ()
<PNChartDelegate>
@property (nonatomic) PNLineChart * lineChart;
@property (nonatomic) PNBarChart * barChart;
@property (nonatomic) PNCircleChart * circleChart;
@property (nonatomic) PNPieChart *pieChart;
@property (nonatomic) PNScatterChart *scatterChart;
@property (nonatomic) PNRadarChart *radarChart;
@end

@implementation SRChartSampleVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
     if ([self.title isEqualToString:@"Line Chart"]) {
         
     }
}

#pragma mark - Lazy
-(PNLineChart *)lineChart
{
    if (!_lineChart) {
        _lineChart = [[PNLineChart alloc] initWithFrame:CGRectMake(0, 135.0, SCREEN_WIDTH, 200.0)];
        _lineChart.backgroundColor = [UIColor whiteColor];
        _lineChart.yGridLinesColor = [UIColor grayColor];
        _lineChart.yLabelColor = [UIColor blackColor];
        _lineChart.xLabelColor = [UIColor blackColor];
        _lineChart.showCoordinateAxis = YES;
        _lineChart.yLabelFormat = @"%1.1f";
        _lineChart.xLabelFont = [UIFont fontWithName:@"Helvetica-Light" size:8.0];
        _lineChart.showGenYLabels = NO;
        _lineChart.showYGridLines = YES;
        _lineChart.yFixedValueMax = 200;
        _lineChart.yFixedValueMin = 0.0;
        
        [_lineChart setYLabels:@[@"0",
                                 @"50",
                                 @"100",
                                 @"150",
                                 @"200",
                                 @"250",
                                 @"300"]];
        
        NSArray *data01Array = @[@124, @134, @128, @127, @144, @139, @134, @134, @132, @130, @116, @95];
        PNLineChartData *data01 = [PNLineChartData new];
        
        data01.rangeColors = @[
                               [[PNLineChartColorRange alloc] initWithRange:NSMakeRange(1, 54) color:[UIColor redColor]],
                               [[PNLineChartColorRange alloc] initWithRange:NSMakeRange(55, 6) color:[UIColor yellowColor]],
                               [[PNLineChartColorRange alloc] initWithRange:NSMakeRange(61, 49) color:[UIColor greenColor]],
                               [[PNLineChartColorRange alloc] initWithRange:NSMakeRange(110, 20) color:[UIColor yellowColor]],
                               [[PNLineChartColorRange alloc] initWithRange:NSMakeRange(130, 470) color:[UIColor redColor]]
                               ];
        data01.dataTitle = @"Alpha";
        data01.color = PNFreshGreen;
        data01.pointLabelColor = [UIColor blackColor];
        data01.alpha = 0.3f;
        data01.showPointLabel = YES;
        data01.pointLabelFont = [UIFont fontWithName:@"Helvetica-Light" size:9.0];
        data01.itemCount = data01Array.count;
        data01.inflexionPointColor = PNRed;
        data01.inflexionPointStyle = PNLineChartPointStyleTriangle;
        data01.getData = ^(NSUInteger index) {
            CGFloat yValue = [data01Array[index] floatValue];
            return [PNLineChartDataItem dataItemWithY:yValue];
        };
        
        [_lineChart.chartData enumerateObjectsUsingBlock:^(PNLineChartData *obj, NSUInteger idx, BOOL *stop) {
            obj.pointLabelColor = [UIColor blackColor];
        }];
    }
    return _lineChart;
}



@end
