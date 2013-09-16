//
//  SecondViewcontrollerViewController.h
//  PlotDemo
//
//  Created by Cyberlinks on 04/09/13.
//  Copyright (c) 2013 Cyberlinks. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CorePlot-CocoaTouch.h"

@interface SecondViewcontrollerViewController : UIViewController<CPTBarPlotDataSource, CPTBarPlotDelegate>{
     NSArray *DataArray;
    NSArray *YDataArray;
}
@property (strong, nonatomic) IBOutlet CPTGraphHostingView *hostview;

@end
