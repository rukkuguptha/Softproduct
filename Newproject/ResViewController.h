//
//  ResViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 12/13/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ManViewController.h"
#import "EqpmViewController.h"
#import "MaterialsViewController.h"
#import "FleetsViewController.h"
#import "SmalltoolsViewController.h"

@interface ResViewController : UIViewController
//Tiles

@property (strong, nonatomic) IBOutlet UIView *manpwrview;
@property(strong,nonatomic)IBOutlet UIView *eqpView;
@property(strong,nonatomic)IBOutlet UIView *materialView;
@property (strong, nonatomic) IBOutlet UIView *fleetview;
@property (strong, nonatomic) IBOutlet UIView *smalltoolview;

//ViewControllers

@property(strong,nonatomic)ManViewController *manVCtrl;
@property(strong,nonatomic)EqpmViewController *equipVCtrl;
@property(strong,nonatomic)MaterialsViewController *materialVCtrl;
@property(strong,nonatomic)FleetsViewController *fleetVCtrl;
@property(strong,nonatomic)SmalltoolsViewController *smalltoolVCtrl;

- (IBAction)closebtnActn:(id)sender;

@end
