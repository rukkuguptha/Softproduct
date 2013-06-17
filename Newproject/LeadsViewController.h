//
//  LeadsViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 6/14/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface LeadsViewController : UIViewController
@property(strong,nonatomic)IBOutlet UITableView *leadTable;
@property(strong,nonatomic)IBOutlet UIScrollView *scroll;
// for LeadCustomCell
@property(strong,nonatomic)IBOutlet UILabel *leadName;
@property(strong,nonatomic)IBOutlet UILabel *Location;
@property(strong,nonatomic)IBOutlet UILabel *Contract;
@property(strong,nonatomic)IBOutlet UILabel *EmailId;
@property(strong,nonatomic)IBOutlet UILabel *IndustryType;
@property(strong,nonatomic)IBOutlet UILabel *ProjectType;
@property(strong,nonatomic)IBOutlet UILabel *ProjectExecution;

@property(strong,nonatomic)IBOutlet UITableViewCell *leadsTablecell;

@end
