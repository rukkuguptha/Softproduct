//
//  BasicReqViewController.h
//  Newproject
//
//  Created by GMSIndia 2 on 16/12/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BasicReqViewController : UIViewController


@property(strong,nonatomic)IBOutlet UITableView *basicreqtable;
@property(strong,nonatomic)IBOutlet UIView *titleview;
@property(strong,nonatomic)IBOutlet UIView *addreqview;
@property(strong,nonatomic)IBOutlet UITableViewCell *reqcell;
@property(strong,nonatomic)IBOutlet UINavigationItem *navItem;

@property(strong,nonatomic)UISearchBar *searchbar;

//IBActions
-(IBAction)closetheBASicreqview:(id)sender;
-(IBAction)addbasicreq:(id)sender;
-(IBAction)editBasicreq:(id)sender;
-(IBAction)closeBasicreqview:(id)sender;
@end
