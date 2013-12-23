//
//  workPhasesViewController.h
//  Newproject
//
//  Created by GMSIndia 2 on 23/12/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface workPhasesViewController : UIViewController


//Outlets
@property(strong,nonatomic)IBOutlet UITableView *phasetable;
@property(strong,nonatomic)IBOutlet UITableViewCell *phasecell;
@property(strong,nonatomic)IBOutlet UIView *titleview;
@property(strong,nonatomic)IBOutlet UIView *workphasesview;
@property(strong,nonatomic)IBOutlet UINavigationItem *navItem;

@property(strong,nonatomic)UISearchBar *searchbar;
//IBActions
-(IBAction)closePhases:(id)sender;
-(IBAction)addworkPhasesview:(id)sender;
-(IBAction)editWorkPhasesview:(id)sender;
-(IBAction)closeworkphasesview:(id)sender;

@end
