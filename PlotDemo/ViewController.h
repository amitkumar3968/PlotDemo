//
//  ViewController.h
//  PlotDemo
//
//  Created by Cyberlinks on 04/09/13.
//  Copyright (c) 2013 Cyberlinks. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CorePlot-CocoaTouch.h"
#import "SecondViewcontrollerViewController.h"



@interface ViewController : UIViewController<CPTBarPlotDataSource, CPTBarPlotDelegate>{
   
    CPTGraphHostingView *hostView;
    CPTBarPlot *aaplPlot;
    NSArray *prices;
}
- (IBAction)ko:(id)sender;
@property(nonatomic,strong)    CPTGraphHostingView *hostView;
@end
