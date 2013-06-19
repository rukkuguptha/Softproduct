//
//  ActivityViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 6/17/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "CKCalendarView.h"

@interface ActivityViewController : UIViewController
@property(strong,nonatomic)IBOutlet UITableView *activityTable;
@property(strong,nonatomic)IBOutlet UITableViewCell *actvityCell;
@property(strong,nonatomic)IBOutlet UIScrollView *scroll;
-(IBAction)addNewActivity:(id)sender;
@property(strong,nonatomic)IBOutlet UIView *newviewactivity;
-(IBAction)closetheView:(id)sender;
@property(strong,nonatomic)IBOutlet UINavigationBar *activityNav;
@property(nonatomic, weak) CKCalendarView *calendar;
@property(nonatomic, strong) NSDateFormatter *dateFormatter;
@property(strong,nonatomic)UIPopoverController *popOverController;
@property(strong,nonatomic)IBOutlet UIButton *dateBtn;
-(IBAction)selectDate:(id)sender;

@end
