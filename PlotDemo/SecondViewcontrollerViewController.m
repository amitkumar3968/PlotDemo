//
//  SecondViewcontrollerViewController.m
//  PlotDemo
//
//  Created by Cyberlinks on 04/09/13.
//  Copyright (c) 2013 Cyberlinks. All rights reserved.
//

#import "SecondViewcontrollerViewController.h"

@interface SecondViewcontrollerViewController ()

@end

@implementation SecondViewcontrollerViewController

static const CGFloat majorTickLength = 12.0;
static const CGFloat minorTickLength = 8.0;
static const CGFloat titleOffset = 25.0;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
   
    
    self.view.backgroundColor=[UIColor blackColor];
	// Do any additional setup after loading the view.
    
    
    
    
    /*
    {
        
        OpinionCount1 = 7;
        
        OpinionCount2 = 0;
        
        OpinionCount3 = 21;
        
        OpinionCount4 = 0;
        
        OpinionCount5 = 0;
        
        OpinionCount6 = 0;
        
        "Opinion_Date" = "2013-09-04T16:56:40.753+05:30";
        
        "Opinion_ID" = 4926;
        
        "Opinion_Status" = false;
        
        Option1 = "\U0939\U093e\U0902";
        
        Option2 = "\U0928\U0939\U0940\U0902";
        
        Option3 = "\U0915\U0939 \U0928\U0939\U0940\U0902 \U0938\U0915\U0924\U0947";
        
        Option4 = "";
        
        Option5 = "";
        
        Option6 = "";
        
        "Story_ID" = 0;
        
        title = "\U092c\U0902\U091c\U093e\U0930\U093e \U092e\U094b\U0926\U0940 \U0915\U0947 \U0932\U093f\U090f \U092e\U0941\U0936\U094d\U0915\U093f\U0932\U0947\U0902 \U0916\U0921\U093c\U0940 \U0915\U0930\U0947\U0902\U0917\U0947?";
        
    }
     */
    

    
    NSDictionary *dataDict=[NSDictionary dictionaryWithObjectsAndKeys:@"7",@"OpinionCount1",@"0",@"OpinionCount2",@"21",@"OpinionCount3",@"1",@"OpinionCount4",@"1",@"OpinionCount5",@"1",@"OpinionCount6",@"2013-09-04T16:56:40.753+05:30",@"Opinion_Date",@"4926",@"Opinion_ID",
        @"\u0928\u0939\u0940\u0902",@"Option5",@"\u0939\u093e\u0902",@"Option1",@"\u0915\u0939 \u0928\u0939\u0940\u0902 \u0938\u0915\u0924\u0947",@"Option3",@"cyberlinks",@"Option4",@"Gurgaon",@"Option2",@"Neve",@"Option6", nil];
    
    
    NSArray *XdataArray=[NSArray arrayWithObjects:
                         [dataDict objectForKey:@"Option1"],
                         [dataDict objectForKey:@"Option2"],
                         [dataDict objectForKey:@"Option3"],
                         [dataDict objectForKey:@"Option4"],
                         [dataDict objectForKey:@"Option5"],
                         [dataDict objectForKey:@"Option6"],
                         nil];
    
    
    YDataArray=[NSArray arrayWithObjects:
                         [dataDict objectForKey:@"OpinionCount1"],
                         [dataDict objectForKey:@"OpinionCount2"],
                         [dataDict objectForKey:@"OpinionCount3"],
                         [dataDict objectForKey:@"OpinionCount4"],
                         [dataDict objectForKey:@"OpinionCount5"],
                         [dataDict objectForKey:@"OpinionCount6"],
                         nil];
//    XdataArray  YDataArray
    
    
    NSLog(@"%@",dataDict);
    DataArray=[NSArray arrayWithObjects:
               [NSNumber numberWithFloat:50.0f],
               [NSNumber numberWithFloat:50.0f],
               [NSNumber numberWithFloat:30.0f],
               [NSNumber numberWithFloat:40.0f],
               [NSNumber numberWithFloat:50.0f],
                [NSNumber numberWithFloat:20.0f],
               
               nil];
    
    
    self.hostview= [(CPTGraphHostingView *) [CPTGraphHostingView alloc] initWithFrame: CGRectMake(10, 20, 520, 200)];
    self.hostview.allowPinchScaling = YES;
    [self.view addSubview:self.hostview];
    
    
    
    
    CGRect temp=self.hostview.bounds;
    temp.origin.x=temp.origin.x+20;
    temp.size.height=300;
    temp.size.width=320;
    
    CPTXYGraph *graph = [[CPTXYGraph alloc] initWithFrame:temp];//self.hostview.bounds
    graph.plotAreaFrame.masksToBorder = NO;
    self.hostview.hostedGraph = graph;
    // 2 - Configure the graph
    [graph applyTheme:[CPTTheme themeNamed:kCPTPlainWhiteTheme]];
    graph.paddingBottom = 30.0f;
    graph.paddingLeft  = 30.0f;
    graph.paddingTop    = -1.0f;
    graph.paddingRight  = -5.0f;
    // 3 - Set up styles
    CPTMutableTextStyle *titleStyle = [CPTMutableTextStyle textStyle];
    titleStyle.color = [CPTColor whiteColor];
    
    titleStyle.fontSize = 16.0f;
    // 4 - Set up title
    NSString *title = @"Graph 2";
    graph.title = title;
    graph.titleTextStyle = titleStyle;
    graph.titlePlotAreaFrameAnchor = CPTRectAnchorTop;
    graph.titleDisplacement = CGPointMake(0.0f, -16.0f);
    // 5 - Set up plot space
    CGFloat xMin = 0.0f;
    CGFloat xMax = 7;//[[[CPDStockPriceStore sharedInstance] datesInWeek] count];
    CGFloat yMin = 0.0f;
    CGFloat yMax = 120;  // should determine dynamically based on max price
    CPTXYPlotSpace *plotSpace = (CPTXYPlotSpace *) graph.defaultPlotSpace;
    plotSpace.xRange = [CPTPlotRange plotRangeWithLocation:CPTDecimalFromFloat(xMin) length:CPTDecimalFromFloat(xMax)];
    plotSpace.yRange = [CPTPlotRange plotRangeWithLocation:CPTDecimalFromFloat(yMin) length:CPTDecimalFromFloat(yMax)];
    
    
    
    
    CPTMutableLineStyle *axisLineStyle = [CPTMutableLineStyle lineStyle];
    axisLineStyle.lineWidth = 3.0;
    CPTMutableLineStyle *majorTickLineStyle = [axisLineStyle mutableCopy];
    majorTickLineStyle.lineWidth = 2.0;
	majorTickLineStyle.lineCap = kCGLineCapRound;
    
    CPTMutableLineStyle *minorTickLineStyle = [axisLineStyle mutableCopy];
    minorTickLineStyle.lineWidth = 2.0;
	minorTickLineStyle.lineCap = kCGLineCapRound;

    
    CPTMutableTextStyle *axisTitleTextStyle = [CPTMutableTextStyle textStyle];
	axisTitleTextStyle.fontName = @"Helvetica-Bold";
	axisTitleTextStyle.fontSize = 14.0;

    
    // CPTAxisLabelingPolicyFixedInterval
    CPTXYAxis *axisFixedInterval = [[CPTXYAxis alloc] init];
	axisFixedInterval.plotSpace = graph.defaultPlotSpace;
	axisFixedInterval.labelingPolicy = CPTAxisLabelingPolicyFixedInterval;
	axisFixedInterval.orthogonalCoordinateDecimal = CPTDecimalFromUnsignedInteger(3);
	axisFixedInterval.majorIntervalLength = CPTDecimalFromDouble(25.0);
	axisFixedInterval.minorTicksPerInterval = 4;
	axisFixedInterval.tickDirection = CPTSignNone;
	axisFixedInterval.axisLineStyle = axisLineStyle;
	axisFixedInterval.majorTickLength = majorTickLength;
	axisFixedInterval.majorTickLineStyle = majorTickLineStyle;
	axisFixedInterval.minorTickLength = minorTickLength;
	axisFixedInterval.minorTickLineStyle = minorTickLineStyle;
	axisFixedInterval.title = @"CPTAxisLabelingPolicyFixedInterval";
	axisFixedInterval.titleTextStyle = axisTitleTextStyle;
	axisFixedInterval.titleOffset = titleOffset;
    
   // graph.axisSet.axes = [NSArray arrayWithObjects:  axisFixedInterval,  nil];
    
    
    
CPTBarPlot *aaplPlot = [CPTBarPlot tubularBarPlotWithColor:[CPTColor yellowColor] horizontalBars:NO];
    aaplPlot.identifier = @"you";
    
	// 2 - Set up line style
	CPTMutableLineStyle *barLineStyle = [[CPTMutableLineStyle alloc] init];
	barLineStyle.lineColor = [CPTColor lightGrayColor];
	barLineStyle.lineWidth = 0.5;
	// 3 - Add plots to graph
	CPTGraph *graph2 = self.hostview.hostedGraph;
	CGFloat barX = .8;
	NSArray *plots = [NSArray arrayWithObjects: aaplPlot, nil];// self.googPlot, self.msftPlot,
	for (CPTBarPlot *plot in plots) {
		plot.dataSource = self;
		plot.delegate = self;
		plot.barWidth = CPTDecimalFromDouble(.5);
		plot.barOffset = CPTDecimalFromDouble(barX);
		plot.lineStyle = barLineStyle;
		[graph addPlot:plot toPlotSpace:graph2.defaultPlotSpace];
		barX += 10;
	}
    
    
    
    
    
    
    
    // 1 - Configure styles
    CPTMutableTextStyle *axisTitleStyle = [CPTMutableTextStyle textStyle];
    axisTitleStyle.color = [CPTColor whiteColor];
    axisTitleStyle.fontName = @"Helvetica-Bold";
    axisTitleStyle.fontSize = 10.0f;
    CPTMutableLineStyle *axisLineStyle2 = [CPTMutableLineStyle lineStyle];
     axisLineStyle2.lineWidth = 2.0f;
     axisLineStyle2.lineColor = [[CPTColor whiteColor] colorWithAlphaComponent:1];
    // 2 - Get the graph's axis set
    CPTXYAxisSet *axisSet = (CPTXYAxisSet *) self.hostview.hostedGraph.axisSet;
    // 3 - Configure the x-axis
    axisSet.xAxis.labelingPolicy = CPTAxisLabelingPolicyNone;
    axisSet.xAxis.title = @"X axis)";
    axisSet.xAxis.titleTextStyle = axisTitleStyle;
    //axisSet.xAxis.titleOffset = 10.0f;
    axisSet.xAxis. axisLineStyle =  axisLineStyle2;
    
    
    
    
    
    NSSet *majorTickLocationsX = [NSSet setWithObjects:
                                  
                                  [NSDecimalNumber numberWithUnsignedInt:1.5],
                                 
                                 [NSDecimalNumber numberWithUnsignedInteger:2.5],
                                 [NSDecimalNumber numberWithUnsignedInteger:3.5],
                                 [NSDecimalNumber numberWithUnsignedInteger:4.5],
                                  [NSDecimalNumber numberWithUnsignedInt:5.5],
                                 nil];
    
  //  axisSet.xAxis.orthogonalCoordinateDecimal = CPTDecimalFromUnsignedInteger(1);
	//axisSet.xAxis.tickDirection = CPTSignNone;
	 axisSet.xAxis.axisLineStyle = axisLineStyle;
	//axisSet.xAxis.majorTickLength = majorTickLength;
	//axisSet.xAxis.majorTickLineStyle = majorTickLineStyle;
	//axisSet.yAxis.minorTickLength = minorTickLength;
	//axisSet.yAxis.minorTickLineStyle = minorTickLineStyle;
	//axisSet.yAxis.title = @"CPTAxisLabelingPolicyNone";
	//axisSet.xAxis.titleTextStyle = axisTitleTextStyle;
	//axisSet.xAxis.titleOffset = titleOffset;
	//axisSet.xAxis.majorTickLocations = majorTickLocationsX;
    
    //axisSet.xAxis.majorTickLocations=majorTickLocationsX;
    
    NSMutableSet *newAxisLabelsX = [NSMutableSet set];
    NSArray *setarrayX=[NSArray arrayWithObjects:@"Sadma",@"andaaz",@"chaalbaaz",@"intex",@"keyboard",@"afdd", nil];
    
	for ( NSUInteger i = 0; i < setarrayX.count; i++ ) {
        
        //  NSLog(@"%@",[NSString stringWithFormat:@"%d", [[setarray objectAtIndex:i] intValue]]);
		
        
        
        CPTAxisLabel *newLabel = [[CPTAxisLabel alloc] initWithText:[NSString stringWithFormat:@"%@", [XdataArray objectAtIndex:i]]
														  textStyle:axisSet.xAxis.labelTextStyle];
        //newLabel.contentLayer.contentsScale=.5;
        newLabel.alignment=CPTAlignmentRight;
        
		newLabel.tickLocation = CPTDecimalFromUnsignedInteger(i + 1.1);
       //newLabel.offset = axisSet.xAxis.labelOffset + axisSet.xAxis.majorTickLength / 2.0;
         newLabel.offset = -1;
        
		[newAxisLabelsX addObject:newLabel];
	}
    axisSet.xAxis.axisLabels = newAxisLabelsX;
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
   
    
    
    
    
    // 4 - Configure the y-axis
    axisSet.yAxis.labelingPolicy = CPTAxisLabelingPolicyNone;
   // axisSet.yAxis.title = @"Y-axis";
   // axisSet.yAxis.titleTextStyle = axisTitleStyle;
   // axisSet.yAxis.titleOffset = 5.0f;
   // axisSet.yAxis.axisLineStyle =  axisLineStyle2;
    
    
    
    
    
    
    NSSet *majorTickLocations = [NSSet setWithObjects:[NSDecimalNumber numberWithUnsignedInt:25],
                                 
                                 [NSDecimalNumber numberWithUnsignedInteger:50],
                                 [NSDecimalNumber numberWithUnsignedInteger:75],
                                 [NSDecimalNumber numberWithUnsignedInteger:100],
                                 nil];
    
   // axisSet.yAxis.orthogonalCoordinateDecimal = CPTDecimalFromUnsignedInteger(1);
	 axisSet.yAxis.tickDirection = CPTSignPositive;
	// axisSet.yAxis.axisLineStyle = axisLineStyle;
	// axisSet.yAxis.majorTickLength = majorTickLength;
	// axisSet.yAxis.majorTickLineStyle = majorTickLineStyle;
	//axisSet.yAxis.minorTickLength = minorTickLength;
	//axisSet.yAxis.minorTickLineStyle = minorTickLineStyle;
	//axisSet.yAxis.title = @"CPTAxisLabelingPolicyNone";
	//axisSet.yAxis.titleTextStyle = axisTitleTextStyle;
	//axisSet.yAxis.titleOffset = -100;
	//axisSet.yAxis.majorTickLocations = majorTickLocations;
    
   // axisSet.yAxis.majorTickLocations=majorTickLocations;
    NSMutableSet *newAxisLabels = [NSMutableSet set];
    NSArray *setarray=[NSArray arrayWithObjects:@"0%",@"25%",@"50%",@"75%",@"100%", nil];
    
	for ( NSUInteger i = 0; i < setarray.count; i++ ) {
        
      //  NSLog(@"%@",[NSString stringWithFormat:@"%d", [[setarray objectAtIndex:i] intValue]]);
		
         
        CPTAxisLabel *newLabel = [[CPTAxisLabel alloc] initWithText:[NSString stringWithFormat:@"%@", [setarray objectAtIndex:i]]
														  textStyle:axisSet.yAxis.labelTextStyle];
        newLabel.contentLayer.contentsScale=.5;
        newLabel.alignment=CPTAlignmentRight;
        
		newLabel.tickLocation = CPTDecimalFromUnsignedInteger(i * 25);
		 //newLabel.offset = axisSet.yAxis.labelOffset + axisSet.yAxis.majorTickLength / 2.0;
         newLabel.offset = -32;
        
		[newAxisLabels addObject:newLabel];
	}
	 axisSet.yAxis.axisLabels = newAxisLabels;
    
    
    
    
    
    
     [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setHostview:nil];
    [super viewDidUnload];
}





#pragma mark - CPTPlotDataSource methods
-(NSUInteger)numberOfRecordsForPlot:(CPTPlot *)plot {
	return 6;
    //return [[[CPDStockPriceStore sharedInstance] datesInWeek] count];
}

-(NSNumber *)numberForPlot:(CPTPlot *)plot field:(NSUInteger)fieldEnum recordIndex:(NSUInteger)index {
 
    if ((fieldEnum == CPTBarPlotFieldBarTip) && (index < 6)) {
		if ([plot.identifier isEqual:@"you"]) {
            
            NSLog(@"coming here....");
            
            return [NSDecimalNumber numberWithUnsignedInt:[[YDataArray objectAtIndex:index]intValue]];
            //return [DataArray objectAtIndex:index];
			//return [[[CPDStockPriceStore sharedInstance] weeklyPrices:CPDTickerSymbolAAPL] objectAtIndex:index];
		}
        
        
	}
    
    
    
   NSLog(@"plot--%@  fiedenum %d  and index=%d",plot,fieldEnum,index);
    //NSLog(@"%@",[DataArray objectAtIndex:index]);
        
    //return [[[CPDStockPriceStore sharedInstance] weeklyPrices:CPDTickerSymbolAAPL] objectAtIndex:index];
   
    
    return [NSDecimalNumber numberWithUnsignedInteger:index];
}

-(CPTLayer *)dataLabelForPlot:(CPTPlot *)plot recordIndex:(NSUInteger)index {
	// 1 - Define label text style
	static CPTMutableTextStyle *labelText = nil;
	if (!labelText) {
		labelText= [[CPTMutableTextStyle alloc] init];
		labelText.color = [CPTColor grayColor];
	}
	// 2 - Calculate portfolio total value
	 	// 3 - Calculate percentage value
	 
	// 4 - Set up display label
	NSString *labelValue = @"";//[NSString stringWithFormat:@"$%0.2f USD (%0.1f %%)", [price floatValue], ([percent floatValue] * 100.0f)];
	// 5 - Create and return layer with label text
	return [[CPTTextLayer alloc] initWithText:labelValue style:labelText];
}
@end
