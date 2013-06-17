//
//  ActivityViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 6/17/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface ActivityViewController : UIViewController
@property(strong,nonatomic)IBOutlet UITableView *activityTable;
@property(strong,nonatomic)IBOutlet UITableViewCell *actvityCell;
@property(strong,nonatomic)IBOutlet UIScrollView *scroll;
-(IBAction)addNewActivity:(id)sender;
@property(strong,nonatomic)IBOutlet UIView *newviewactivity;
-(IBAction)closetheView:(id)sender;
@property(strong,nonatomic)IBOutlet UINavigationBar *activityNav;

@end
