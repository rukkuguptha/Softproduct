//
//  ManViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 12/13/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ManViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIScrollView *scrollview;
@property(strong,nonatomic)IBOutlet UITableView *manpowerTable;
@property(strong,nonatomic)IBOutlet UITableViewCell *manpowecell;
@property(strong,nonatomic)IBOutlet UIView *titleview;
-(IBAction)closemanpower:(id)sender;
@property (strong, nonatomic)UISearchBar * SearchingBar;
@property(strong,nonatomic)IBOutlet UIView *addview;
- (IBAction)addmanpwer:(id)sender;
-(IBAction)editmanpower:(id)sender;
@property(strong,nonatomic)IBOutlet UINavigationItem *navitem;

@end
