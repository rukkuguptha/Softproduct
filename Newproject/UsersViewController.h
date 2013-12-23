//
//  UsersViewController.h
//  Newproject
//
//  Created by GMSIndia 2 on 16/12/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UsersViewController : UIViewController


//Outlets
@property(strong,nonatomic)IBOutlet UITableView *usertable;
@property(strong,nonatomic)IBOutlet UITableViewCell *usercell;
@property(strong,nonatomic)IBOutlet UIView *titleview;
@property(strong,nonatomic)IBOutlet UIView *addview;
@property(strong,nonatomic)IBOutlet UINavigationItem *navitem;

//IBActions
-(IBAction)closeuser:(id)sender;
-(IBAction)adduserview:(id)sender;
-(IBAction)edituserview:(id)sender;
-(IBAction)closeuserview:(id)sender;
@end
