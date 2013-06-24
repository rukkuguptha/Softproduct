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
#import "FollowupViewController.h"
@interface ActivityViewController : UIViewController
@property(strong,nonatomic)IBOutlet UITableView *activityTable;
@property(strong,nonatomic)IBOutlet UITableViewCell *actvityCell;
@property(strong,nonatomic)IBOutlet UIScrollView *scroll;
@property(strong,nonatomic)IBOutlet UIView *newviewactivity;
@property(strong,nonatomic)IBOutlet UINavigationBar *activityNav;
@property(nonatomic, weak) CKCalendarView *calendar;
@property(nonatomic, strong) NSDateFormatter *dateFormatter;
@property(strong,nonatomic)IBOutlet UIButton *dateBtn;
@property(strong,nonatomic)IBOutlet UIView *view2;
@property(strong,nonatomic)FollowupViewController*followupVCtrl;

/*Arrays*/
@property(strong,nonatomic)NSMutableArray*btnArray;

/*butn*/
-(IBAction)addNewActivity:(id)sender;
-(IBAction)closetheView:(id)sender;
-(IBAction)selectDate:(id)sender;
- (IBAction)editcellbtn:(id)sender;
- (IBAction)disbtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *disbtnlbl;
/*popover*/
@property(strong,nonatomic)UIPopoverController *popOverController;
@property(strong,nonatomic)UITableView *popOverTableView;
@property(strong,nonatomic)NSMutableArray*popoverArray;

@end
