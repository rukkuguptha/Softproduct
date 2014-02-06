//
//  TilehrViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 2/4/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HRViewController.h"
@interface TilehrViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIView *masterview;
@property (strong, nonatomic) IBOutlet UIView *processview;
@property (strong, nonatomic) IBOutlet UIView *mangmntview;
@property (strong, nonatomic)HRViewController *hrVCtrl;
- (IBAction)closebtnactn:(id)sender;

@end
