//
//  ResViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 12/13/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ManViewController.h"

@interface ResViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIView *manpwrview;
@property(strong,nonatomic)ManViewController *manVCtrl;

- (IBAction)closebtnActn:(id)sender;

@end
