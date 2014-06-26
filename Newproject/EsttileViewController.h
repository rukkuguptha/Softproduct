//
//  EsttileViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 5/9/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EstimationViewController.h"
#import "BidViewController.h"

@interface EsttileViewController : UIViewController

@property(strong,nonatomic)EstimationViewController * EHVctrl;
@property(strong,nonatomic)BidViewController * bidVctrl;


@property (strong, nonatomic) IBOutlet UIView *estimteview;

@property (strong, nonatomic) IBOutlet UIView *bidsview;

- (IBAction)clsebtn:(id)sender;

@end
