//
//  PlanningViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 2/12/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface PlanningViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

/*views*/
@property (strong, nonatomic) IBOutlet UINavigationBar *titleview;
@property (strong, nonatomic) IBOutlet UIView *tabletitleview;
@property (strong, nonatomic) IBOutlet UITableView *plangtable;

- (IBAction)clseVCtrlbtn:(id)sender;
- (IBAction)addplan:(id)sender;

@end
