//
//  jobsitereqViewController.h
//  Newproject
//
//  Created by GMSIndia 2 on 16/12/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface jobsitereqViewController : UIViewController


//IBOutlets
@property(strong,nonatomic)IBOutlet UITableView *jobsitetable;
@property(strong,nonatomic)IBOutlet UITableViewCell *jobcell;
@property(strong,nonatomic)IBOutlet UIView *titleview;
@property(strong,nonatomic)IBOutlet UIView *addjobview;

@property(strong,nonatomic)UISearchBar *searchbar;

//IBActions
-(IBAction)closejobreqview:(id)sender;
-(IBAction)addjobview:(id)sender;
-(IBAction)closeaddjbview:(id)sender;
@end
