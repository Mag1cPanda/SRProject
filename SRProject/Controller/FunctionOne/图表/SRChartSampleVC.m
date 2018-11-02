//
//  SRChartSampleVC.m
//  SRProject
//
//  Created by longrise on 2018/10/17.
//  Copyright © 2018 longrise. All rights reserved.
//

#import "SRChartSampleVC.h"
#import "PNChart.h"

#define ARC4RANDOM_MAX 0x100000000

@interface SRChartSampleVC ()
<PNChartDelegate>
@property (nonatomic, strong) PNLineChart * lineChart;
@property (nonatomic, strong) PNBarChart * barChart;
@property (nonatomic, strong) PNCircleChart * circleChart;
@property (nonatomic, strong) PNPieChart *pieChart;
@property (nonatomic, strong) PNScatterChart *scatterChart;
@property (nonatomic, strong) PNRadarChart *radarChart;

@end

@implementation SRChartSampleVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = _titleStr;
    
     if ([_titleStr isEqualToString:@"Line Chart"]) {
         [self.view addSubview:self.lineChart];
         
         self.lineChart.legendStyle = PNLegendItemStyleStacked;
         self.lineChart.legendFont = [UIFont boldSystemFontOfSize:12.0f];
         self.lineChart.legendFontColor = [UIColor redColor];
         
         UIView *legend = [self.lineChart getLegendWithMaxWidth:320];
         [legend setFrame:CGRectMake(30, 340, legend.frame.size.width, legend.frame.size.width)];
         [self.view addSubview:legend];
     } else if ([_titleStr isEqualToString:@"Bar Chart"]) {
         [self.view addSubview:self.barChart];
     } else if ([_titleStr isEqualToString:@"Circle Chart"]) {
         [self.view addSubview:self.circleChart];
     } else if ([_titleStr isEqualToString:@"Pie Chart"]) {
         [self.view addSubview:self.pieChart];
         
         self.pieChart.legendStyle = PNLegendItemStyleStacked;
         self.pieChart.legendFont = [UIFont boldSystemFontOfSize:12.0f];
         
         UIView *legend = [self.pieChart getLegendWithMaxWidth:200];
         [legend setFrame:CGRectMake(130, 350, legend.frame.size.width, legend.frame.size.height)];
         [self.view addSubview:legend];
     } else if ([_titleStr isEqualToString:@"Scatter Chart"]) {
         [self.view addSubview:self.scatterChart];
     } else if ([_titleStr isEqualToString:@"Radar Chart"]) {
         [self.view addSubview:self.radarChart];
     }
}

#pragma mark - Private
- (NSArray *)randomSetOfObjects {
    NSMutableArray *array = [NSMutableArray array];
    NSString *LabelFormat = @"%1.f";
    NSMutableArray *XAr = [NSMutableArray array];
    NSMutableArray *YAr = [NSMutableArray array];
    for (int i = 0; i < 25; i++) {
        [XAr addObject:[NSString stringWithFormat:LabelFormat, (((double) arc4random() / ARC4RANDOM_MAX) * (self.scatterChart.AxisX_maxValue - self.scatterChart.AxisX_minValue) + self.scatterChart.AxisX_minValue)]];
        [YAr addObject:[NSString stringWithFormat:LabelFormat, (((double) arc4random() / ARC4RANDOM_MAX) * (self.scatterChart.AxisY_maxValue - self.scatterChart.AxisY_minValue) + self.scatterChart.AxisY_minValue)]];
    }
    [array addObject:XAr];
    [array addObject:YAr];
    return array;
}

#pragma mark - PNChartDelegate
- (void)userClickedOnLineKeyPoint:(CGPoint)point lineIndex:(NSInteger)lineIndex pointIndex:(NSInteger)pointIndex {
    NSLog(@"Click Key on line %f, %f line index is %d and point index is %d", point.x, point.y, (int) lineIndex, (int) pointIndex);
}

- (void)userClickedOnLinePoint:(CGPoint)point lineIndex:(NSInteger)lineIndex {
    NSLog(@"Click on line %f, %f, line index is %d", point.x, point.y, (int) lineIndex);
}


#pragma mark - Lazy
-(PNLineChart *)lineChart
{
    if (!_lineChart) {
        _lineChart = [[PNLineChart alloc] initWithFrame:CGRectMake(0, 135.0, SCREEN_WIDTH, 200.0)];
        _lineChart.delegate = self;
        _lineChart.backgroundColor = [UIColor whiteColor];
        _lineChart.yGridLinesColor = [UIColor grayColor];
        [_lineChart.chartData enumerateObjectsUsingBlock:^(PNLineChartData *obj, NSUInteger idx, BOOL * _Nonnull stop) {
            obj.pointLabelColor = [UIColor blackColor];
        }];
        _lineChart.yLabelColor = [UIColor blackColor];
        _lineChart.xLabelColor = [UIColor blackColor];
        _lineChart.showCoordinateAxis = YES;
        _lineChart.yLabelFormat = @"%1.1f";
        _lineChart.xLabelFont = [UIFont fontWithName:@"Helvetica-Light" size:8.0];
        _lineChart.showGenYLabels = NO;
        _lineChart.showYGridLines = YES;
        _lineChart.yFixedValueMax = 200;
        _lineChart.yFixedValueMin = 0.0;
        
        [_lineChart setXLabels:@[@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"11"]];
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
        
        NSArray *data02Array = @[@0.0, @18.1, @26.4, @30.2, @12.2, @16.2, @27.2];
        PNLineChartData *data02 = [PNLineChartData new];
        data02.dataTitle = @"Beta";
        data02.pointLabelColor = [UIColor blackColor];
        data02.color = PNTwitterColor;
        data02.alpha = 0.5f;
        data02.itemCount = data02Array.count;
        data02.inflexionPointStyle = PNLineChartPointStyleCircle;
        data02.getData = ^(NSUInteger index) {
            CGFloat yValue = [data02Array[index] floatValue];
            return [PNLineChartDataItem dataItemWithY:yValue];
        };
        
        self.lineChart.chartData = @[data01, data02];
        [self.lineChart.chartData enumerateObjectsUsingBlock:^(PNLineChartData *obj, NSUInteger idx, BOOL *stop) {
            obj.pointLabelColor = [UIColor blackColor];
        }];
        
        
        [_lineChart strokeChart];
    }
    return _lineChart;
}

-(PNBarChart *)barChart
{
    if (!_barChart) {
        static NSNumberFormatter *barChartFormatter;
        if (!barChartFormatter) {
            barChartFormatter = [[NSNumberFormatter alloc] init];
            barChartFormatter.numberStyle = NSNumberFormatterCurrencyStyle;
            barChartFormatter.allowsFloats = NO;
            barChartFormatter.maximumFractionDigits = 0;
        }
        
        self.barChart = [[PNBarChart alloc] initWithFrame:CGRectMake(0, 135.0, SCREEN_WIDTH, 200.0)];
        //        self.barChart.showLabel = NO;
        self.barChart.yLabelFormatter = ^(CGFloat yValue) {
            return [barChartFormatter stringFromNumber:@(yValue)];
        };
        
        self.barChart.yChartLabelWidth = 20.0;
        self.barChart.chartMarginLeft = 30.0;
        self.barChart.chartMarginRight = 10.0;
        self.barChart.chartMarginTop = 5.0;
        self.barChart.chartMarginBottom = 10.0;
        
        
        self.barChart.labelMarginTop = 5.0;
        self.barChart.showChartBorder = YES;
        [self.barChart setXLabels:@[@"2", @"3", @"4", @"5", @"2", @"3", @"4", @"5"]];
        //       self.barChart.yLabels = @[@-10,@0,@10];
        //        [self.barChart setYValues:@[@10000.0,@30000.0,@10000.0,@100000.0,@500000.0,@1000000.0,@1150000.0,@2150000.0]];
        [self.barChart setYValues:@[@10.82, @1.88, @6.96, @33.93, @10.82, @1.88, @6.96, @33.93]];
        [self.barChart setStrokeColors:@[PNGreen, PNGreen, PNRed, PNGreen, PNGreen, PNGreen, PNRed, PNGreen]];
        self.barChart.isGradientShow = NO;
        self.barChart.isShowNumbers = NO;
        
        [self.barChart strokeChart];
        
        self.barChart.delegate = self;
    }
    return _barChart;
}

-(PNCircleChart *)circleChart
{
    if (!_circleChart) {
        self.circleChart = [[PNCircleChart alloc] initWithFrame:CGRectMake(0, 150.0, SCREEN_WIDTH, 100.0)
                                                          total:@100
                                                        current:@60
                                                      clockwise:YES];
        
        self.circleChart.backgroundColor = [UIColor whiteColor];
        
        [self.circleChart setStrokeColor:[UIColor clearColor]];
        [self.circleChart setStrokeColorGradientStart:[UIColor blueColor]];
        [self.circleChart strokeChart];
    }
    return _circleChart;
}

-(PNPieChart *)pieChart
{
    if (!_pieChart) {
        NSArray *items = @[[PNPieChartDataItem dataItemWithValue:10 color:PNLightGreen],
                           [PNPieChartDataItem dataItemWithValue:20 color:PNFreshGreen description:@"WWDC"],
                           [PNPieChartDataItem dataItemWithValue:40 color:PNDeepGreen description:@"GOOG I/O"],
                           ];
        
        self.pieChart = [[PNPieChart alloc] initWithFrame:CGRectMake((CGFloat) (SCREEN_WIDTH / 2.0 - 100), 135, 200.0, 200.0) items:items];
        self.pieChart.descriptionTextColor = [UIColor whiteColor];
        self.pieChart.descriptionTextFont = [UIFont fontWithName:@"Avenir-Medium" size:11.0];
        self.pieChart.descriptionTextShadowColor = [UIColor clearColor];
        self.pieChart.showAbsoluteValues = NO;
        self.pieChart.showOnlyValues = NO;
        [self.pieChart strokeChart];
    }
    return _pieChart;
}

-(PNScatterChart *)scatterChart
{
    if (!_scatterChart) {
        self.scatterChart = [[PNScatterChart alloc] initWithFrame:CGRectMake((CGFloat) (SCREEN_WIDTH / 6.0 - 30), 135, 280, 200)];
        //        self.scatterChart.yLabelFormat = @"xxx %1.1f";
        [self.scatterChart setAxisXWithMinimumValue:20 andMaxValue:100 toTicks:6];
        [self.scatterChart setAxisYWithMinimumValue:30 andMaxValue:50 toTicks:5];
        [self.scatterChart setAxisXLabel:@[@"x1", @"x2", @"x3", @"x4", @"x5", @"x6"]];
        [self.scatterChart setAxisYLabel:@[@"y1", @"y2", @"y3", @"y4", @"y5"]];
        
        NSArray *data01Array = [self randomSetOfObjects];
        PNScatterChartData *data01 = [PNScatterChartData new];
        data01.strokeColor = PNGreen;
        data01.fillColor = PNFreshGreen;
        data01.size = 2;
        data01.itemCount = [data01Array[0] count];
        data01.inflexionPointStyle = PNScatterChartPointStyleCircle;
        __block NSMutableArray *XAr1 = [NSMutableArray arrayWithArray:data01Array[0]];
        __block NSMutableArray *YAr1 = [NSMutableArray arrayWithArray:data01Array[1]];
        
        data01.getData = ^(NSUInteger index) {
            CGFloat xValue;
            xValue = [XAr1[index] floatValue];
            CGFloat yValue = [YAr1[index] floatValue];
            return [PNScatterChartDataItem dataItemWithX:xValue AndWithY:yValue];
        };
        
        [self.scatterChart setup];
        self.scatterChart.chartData = @[data01];
        
        self.scatterChart.delegate = self;
    }
    return _scatterChart;
}

-(PNRadarChart *)radarChart
{
    if (!_radarChart) {
        NSArray *items = @[[PNRadarChartDataItem dataItemWithValue:3 description:@"Art"],
                           [PNRadarChartDataItem dataItemWithValue:2 description:@"Math"],
                           [PNRadarChartDataItem dataItemWithValue:8 description:@"Sports"],
                           [PNRadarChartDataItem dataItemWithValue:5 description:@"Literature"],
                           [PNRadarChartDataItem dataItemWithValue:4 description:@"Other"],
                           ];
        self.radarChart = [[PNRadarChart alloc] initWithFrame:CGRectMake(0, 135.0, SCREEN_WIDTH, 300.0) items:items valueDivider:1];
        
        self.radarChart.plotColor = [UIColor redColor];
        
        [self.radarChart strokeChart];
    }
    return _radarChart;
}



@end
