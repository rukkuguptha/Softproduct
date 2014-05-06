//
//  WrksetngViewController.h
//  Newproject
//
//  Created by GMSIndia 2 on 05/05/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ServiceViewController.h"
#import "workPhasesViewController.h"
#import "WorktypeViewController.h"

@interface WrksetngViewController : UIViewController

//

@property (strong, nonatomic) IBOutlet UIView *serviceview;
@property (strong, nonatomic) IBOutlet UIView *worktypeview;
@property (strong, nonatomic) IBOutlet UIView *workphaseview;

@property(strong,nonatomic)ServiceViewController *serviceVCtrl;
@property(strong,nonatomic)workPhasesViewController *workVCtrl;
@property(strong,nonatomic)WorktypeViewController *wrktypeVCtrl;

-(IBAction)closethepage:(id)sender;

@end
