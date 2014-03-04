//
//  EmplyhrmgntViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 3/4/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EmplyhrmgntViewController : UIViewController
{
    NSInteger Path;
    
}


/*IBAction*/
-(IBAction)closeempmgmt:(id)sender;

/*IBOutlets*/
@property(strong,nonatomic)IBOutlet UITableView *mgmttableview;
@property(strong,nonatomic)IBOutlet UIView *tabletitleview;
@property(strong,nonatomic)IBOutlet UISearchBar *searchbar;
@property(strong,nonatomic)IBOutlet UITableViewCell *mgmtcell;
@property(strong,nonatomic)NSString *searchstring;

/*Array*/
@property(strong,nonatomic)NSMutableArray *employeelistarray;

/*outlet in cell*/
@property(strong,nonatomic)IBOutlet UILabel *ssnlabel;
@property(strong,nonatomic)IBOutlet UILabel *firstnamelabel;
@property(strong,nonatomic)IBOutlet UILabel *lastnamelabel;
@property(strong,nonatomic)IBOutlet UILabel *jobsitelabel;

@end
