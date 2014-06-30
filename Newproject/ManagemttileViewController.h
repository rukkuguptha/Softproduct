//
//  ManagemttileViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 6/9/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovementtileViewController.h"
#import "IssuesViewController.h"
#import "TimeSheetViewController.h"
#import "LbrMgmtViewController.h"

@interface ManagemttileViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIView *resurceview;
@property (strong, nonatomic) IBOutlet UIView *issueview;
@property (strong, nonatomic) IBOutlet UIView *timesheetview;
@property (strong, nonatomic) IBOutlet UIView *labrview;

@property (strong, nonatomic)MovementtileViewController*movemtVCtrl;
@property (strong, nonatomic)TimeSheetViewController*timesheetVCtrl;
@property (strong, nonatomic)IssuesViewController *issueVCtrl;
@property (strong, nonatomic)LbrMgmtViewController *lbrmgmtvctrl;
- (IBAction)clsebtn:(id)sender;


@end
