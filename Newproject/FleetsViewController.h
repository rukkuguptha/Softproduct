//
//  FleetsViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 1/1/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FleetsViewController : UIViewController


/*Outlets*/
@property (strong, nonatomic) IBOutlet UINavigationItem *navbar;

@property (strong, nonatomic) IBOutlet UIView *view1;
@property (strong, nonatomic) IBOutlet UITableView *fleettable;
@property (strong, nonatomic)NSString*searchstring;
@property (strong, nonatomic) IBOutlet UISearchBar *searchbar;



/*Actions*/
- (IBAction)closebtn:(id)sender;

@end
