//
//  FollowupViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 6/17/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
@interface FollowupViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIScrollView *scrollview;
@property (strong, nonatomic) IBOutlet UIView *view1;
@property (strong, nonatomic) IBOutlet UITableView *followuptable;
- (IBAction)addbtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *view2;
@property (strong, nonatomic) IBOutlet UINavigationBar *navigationbar;
- (IBAction)closebtn:(id)sender;

@end
