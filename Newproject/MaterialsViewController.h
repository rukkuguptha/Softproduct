//
//  MaterialsViewController.h
//  Newproject
//
//  Created by GMSIndia 2 on 18/12/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MaterialsViewController : UIViewController


//outlets
@property(strong,nonatomic)IBOutlet UITableView *materialTable;
@property(strong,nonatomic)IBOutlet UITableViewCell *materialCell;
@property(strong,nonatomic)IBOutlet UIView *titleView;
@property(strong,nonatomic)IBOutlet UINavigationItem *navItem;
@property(strong,nonatomic)IBOutlet UIView *addmatView;

@property(strong,nonatomic)UISearchBar *searchbar;

-(IBAction)closeMaterials:(id)sender;
-(IBAction)addmaterial:(id)sender;
-(IBAction)editmaterial:(id)sender;
-(IBAction)closeaddview:(id)sender;

@end
