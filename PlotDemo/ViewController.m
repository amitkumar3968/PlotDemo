//
//  ViewController.m
//  PlotDemo
//
//  Created by Cyberlinks on 04/09/13.
//  Copyright (c) 2013 Cyberlinks. All rights reserved.
//

#import "ViewController.h"
#import "CPDStockPriceStore.h"


@interface ViewController ()

@end

@implementation ViewController
@synthesize hostView;


CGFloat const CPDBarWidth = 0.25f;
CGFloat const CPDBarInitialX = 0.25f;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
  self.hostView= [(CPTGraphHostingView *) [CPTGraphHostingView alloc] initWithFrame: CGRectMake(10, 20, 500, 200)];
    self.hostView.allowPinchScaling = YES;
    [self.view addSubview:self.hostView];
    /*
     graph = [[CPTXYGraph alloc] initWithFrame:self.hostView.bounds];
    self.hostView.hostedGraph = graph;
    graph.paddingLeft = 0.0f;
    graph.paddingTop = 0.0f;
    graph.paddingRight = 0.0f;
    graph.paddingBottom = 0.0f;
    graph.axisSet = nil;
    graph.delegate=self;
    // 2 - Set up text style
    CPTMutableTextStyle *textStyle = [CPTMutableTextStyle textStyle];
    textStyle.color = [CPTColor redColor];
    textStyle.fontName = @"Helvetica-Bold";
    textStyle.fontSize = 16.0f;
    // 3 - Configure title
    NSString *title = @"Portfolio Prices: May 1, 2012";
    graph.title = title;
    graph.titleTextStyle = textStyle;
    graph.titlePlotAreaFrameAnchor = CPTRectAnchorTop;
    graph.titleDisplacement = CGPointMake(0.0f, -12.0f);
    // 4 - Set theme
    
    [graph applyTheme:[CPTTheme themeNamed:kCPTPlainWhiteTheme]];
    
    // 1 - Get graph instance
   
    // 2 - Create legend
    CPTLegend *theLegend = [CPTLegend legendWithGraph:graph];
    // 3 - Configure legend
    theLegend.numberOfColumns = 1;
    theLegend.fill = [CPTFill fillWithColor:[CPTColor whiteColor]];
    theLegend.borderLineStyle = [CPTLineStyle lineStyle];
    theLegend.cornerRadius = 5.0;
    // 4 - Add legend to graph
    graph.legend = theLegend;
    graph.legendAnchor = CPTRectAnchorRight;
    CGFloat legendPadding = -(self.view.bounds.size.width / 8);
    graph.legendDisplacement = CGPointMake(legendPadding, 0.0);
    
    */
    
    
    
    
    prices = [NSArray arrayWithObjects:
              [NSDecimalNumber numberWithFloat:571.70],
              [NSDecimalNumber numberWithFloat:560.28],
              [NSDecimalNumber numberWithFloat:610.00],
              [NSDecimalNumber numberWithFloat:607.70],
              [NSDecimalNumber numberWithFloat:603.00],
              
              [NSDecimalNumber numberWithFloat:571.70],
              [NSDecimalNumber numberWithFloat:560.28],
              [NSDecimalNumber numberWithFloat:610.00],
              [NSDecimalNumber numberWithFloat:607.70],
              [NSDecimalNumber numberWithFloat:603.00],
              nil];
     [self initPlot];
}
#pragma mark - CPTPlotDataSource methods
-(NSUInteger)numberOfRecordsForPlot:(CPTPlot *)plot {
	return 5;
    //return [[[CPDStockPriceStore sharedInstance] datesInWeek] count];
}

-(NSNumber *)numberForPlot:(CPTPlot *)plot field:(NSUInteger)fieldEnum recordIndex:(NSUInteger)index {
    NSLog(@"plot--%@  fiedenum %d  and index=%d",plot,fieldEnum,index);
    
    NSLog(@"%@",[[CPDStockPriceStore sharedInstance] weeklyPrices:CPDTickerSymbolAAPL]);
    
    
	if ((fieldEnum == CPTBarPlotFieldBarTip) && (index < [[[CPDStockPriceStore sharedInstance] datesInWeek] count])) {
		if ([plot.identifier isEqual:CPDTickerSymbolAAPL]) {
            
            NSLog(@"coming here....");
            return [prices objectAtIndex:index];
			//return [[[CPDStockPriceStore sharedInstance] weeklyPrices:CPDTickerSymbolAAPL] objectAtIndex:index];
		}
        
         
	}
     
    NSLog(@"---%@",[[[CPDStockPriceStore sharedInstance] weeklyPrices:CPDTickerSymbolAAPL] objectAtIndex:index]);

   //return [[[CPDStockPriceStore sharedInstance] weeklyPrices:CPDTickerSymbolAAPL] objectAtIndex:index];

    
    return [NSDecimalNumber numberWithUnsignedInteger:index];
}


#pragma mark - CPTBarPlotDelegate methods
-(void)barPlot:(CPTBarPlot *)plot barWasSelectedAtRecordIndex:(NSUInteger)index {
}



#pragma mark - Chart behavior
-(void)initPlot {
    self.hostView.allowPinchScaling = YES;
    [self configureGraph];
    [self configurePlots];
    [self configureAxes];
}

-(void)configureGraph {
    
      CPTXYGraph *graph = [[CPTXYGraph alloc] initWithFrame:self.hostView.bounds];
    graph.plotAreaFrame.masksToBorder = NO;
    self.hostView.hostedGraph = graph;
    // 2 - Configure the graph
    [graph applyTheme:[CPTTheme themeNamed:kCPTPlainBlackTheme]];
    graph.paddingBottom = 30.0f;
    graph.paddingLeft  = 30.0f;
    graph.paddingTop    = -1.0f;
    graph.paddingRight  = -5.0f;
    // 3 - Set up styles
    CPTMutableTextStyle *titleStyle = [CPTMutableTextStyle textStyle];
    titleStyle.color = [CPTColor whiteColor];
    titleStyle.fontName = @"Helvetica-Bold";
    titleStyle.fontSize = 16.0f;
    // 4 - Set up title
    NSString *title = @"Portfolio Prices: April 23 - 27, 2012";
    graph.title = title;
    graph.titleTextStyle = titleStyle;
    graph.titlePlotAreaFrameAnchor = CPTRectAnchorTop;
    graph.titleDisplacement = CGPointMake(0.0f, -16.0f);
    // 5 - Set up plot space
    CGFloat xMin = 0.0f;
    CGFloat xMax = 5;//[[[CPDStockPriceStore sharedInstance] datesInWeek] count];
    CGFloat yMin = 0.0f;
    CGFloat yMax = 800.0f;  // should determine dynamically based on max price
    CPTXYPlotSpace *plotSpace = (CPTXYPlotSpace *) graph.defaultPlotSpace;
    plotSpace.xRange = [CPTPlotRange plotRangeWithLocation:CPTDecimalFromFloat(xMin) length:CPTDecimalFromFloat(xMax)];
    plotSpace.yRange = [CPTPlotRange plotRangeWithLocation:CPTDecimalFromFloat(yMin) length:CPTDecimalFromFloat(yMax)];
}

-(void)configurePlots {
    
    aaplPlot = [CPTBarPlot tubularBarPlotWithColor:[CPTColor redColor] horizontalBars:NO];
	 aaplPlot.identifier = CPDTickerSymbolAAPL;
	 
	// 2 - Set up line style
	CPTMutableLineStyle *barLineStyle = [[CPTMutableLineStyle alloc] init];
	barLineStyle.lineColor = [CPTColor lightGrayColor];
	barLineStyle.lineWidth = 0.5;
	// 3 - Add plots to graph
	CPTGraph *graph = self.hostView.hostedGraph;
	CGFloat barX = .25;
	NSArray *plots = [NSArray arrayWithObjects: aaplPlot, nil];// self.googPlot, self.msftPlot,
	for (CPTBarPlot *plot in plots) {
		plot.dataSource = self;
		plot.delegate = self;
		plot.barWidth = CPTDecimalFromDouble(.25);
		plot.barOffset = CPTDecimalFromDouble(barX);
		plot.lineStyle = barLineStyle;
		[graph addPlot:plot toPlotSpace:graph.defaultPlotSpace];
		barX += CPDBarWidth;
	}
    
}

-(void)configureAxes {
    
    // 1 - Configure styles
    CPTMutableTextStyle *axisTitleStyle = [CPTMutableTextStyle textStyle];
    axisTitleStyle.color = [CPTColor whiteColor];
    axisTitleStyle.fontName = @"Helvetica-Bold";
    axisTitleStyle.fontSize = 12.0f;
    CPTMutableLineStyle *axisLineStyle = [CPTMutableLineStyle lineStyle];
    axisLineStyle.lineWidth = 2.0f;
    axisLineStyle.lineColor = [[CPTColor whiteColor] colorWithAlphaComponent:1];
    // 2 - Get the graph's axis set
    CPTXYAxisSet *axisSet = (CPTXYAxisSet *) self.hostView.hostedGraph.axisSet;
    // 3 - Configure the x-axis
    axisSet.xAxis.labelingPolicy = CPTAxisLabelingPolicyNone;
    axisSet.xAxis.title = @"Days of Week (Mon - Fri)";
    axisSet.xAxis.titleTextStyle = axisTitleStyle;
    axisSet.xAxis.titleOffset = 10.0f;
    axisSet.xAxis.axisLineStyle = axisLineStyle;
    // 4 - Configure the y-axis
    axisSet.yAxis.labelingPolicy = CPTAxisLabelingPolicyNone;
    axisSet.yAxis.title = @"Price";
    axisSet.yAxis.titleTextStyle = axisTitleStyle;
    axisSet.yAxis.titleOffset = 5.0f;
    axisSet.yAxis.axisLineStyle = axisLineStyle;
}

-(void)hideAnnotation:(CPTGraph *)graph {
}





- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
 
- (IBAction)ko:(id)sender {
    
    
//    UIStoryboard *Story=[UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:[NSBundle mainBundle]];
//    
//    SecondViewcontrollerViewController *obj=[Story instantiateViewControllerWithIdentifier:@"SecondViewcontrollerViewControllerID"];
    
    
    SecondViewcontrollerViewController *objsecond=[[SecondViewcontrollerViewController alloc]initWithNibName:nil bundle:nil];

    [self.navigationController pushViewController:objsecond animated:YES];
}
@end
