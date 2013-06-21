//
//  FollowupViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 6/17/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "CKCalendarView.h"
@interface FollowupViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIScrollView *scrollview;
@property (strong, nonatomic) IBOutlet UIView *view1;
@property (strong, nonatomic) IBOutlet UITableView *followuptable;
- (IBAction)addbtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *view2;
@property (strong, nonatomic) IBOutlet UINavigationBar *navigationbar;
- (IBAction)closebtn:(id)sender;
@property(nonatomic, strong) NSDateFormatter *dateFormatter;
@property(strong,nonatomic)UIPopoverController *popOverController;
@property(strong,nonatomic)IBOutlet UIButton *dateBtn;
@property(nonatomic, weak) CKCalendarView *calendar;
@property(strong,nonatomic)IBOutlet UIButton *communictntypeBtn;
-(IBAction)selectCommunicationType:(id)sender;
@property(strong,nonatomic)UITableView *popOverTableView;
@property(strong,nonatomic)NSMutableArray*btnArray;
@property(strong,nonatomic)NSMutableArray *communctiontypeArray;
@property(strong,nonatomic)IBOutlet UITableViewCell *followcell;
- (IBAction)editcellbtn:(id)sender;
- (IBAction)namebtn:(id)sender;

@end
