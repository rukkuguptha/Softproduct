//
//  GPSetupTileViewController.h
//  Newproject
//
//  Created by GMSIndia 2 on 23/05/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CrewsetupViewController.h"
#import "GroupEqupViewController.h"
#import "GpMaterViewController.h"

@interface GPSetupTileViewController : UIViewController

-(IBAction)closethegroup:(id)sender;

@property(strong,nonatomic)IBOutlet UIView *manview;
@property(strong,nonatomic)IBOutlet UIView *equipview;
@property(strong,nonatomic)IBOutlet UIView *materview;

@property(strong,nonatomic)CrewsetupViewController *crewctrl;
@property(strong,nonatomic)GroupEqupViewController *equipVCtrl;
@property(strong,nonatomic)GpMaterViewController *materialVCtrl;

@end
