//
//  jobdetailsViewController.h
//  Newproject
//
//  Created by GMSIndia 2 on 02/01/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface jobdetailsViewController : UIViewController



/*IBOutlets*/
@property(strong,nonatomic)IBOutlet UITableView *jobdetailstable;
@property(strong,nonatomic)IBOutlet UITableViewCell *jobdetailscell;
@property(strong,nonatomic)IBOutlet UIView *titleview;
@property(strong,nonatomic)IBOutlet UISearchBar *searchbar;
@property(strong,nonatomic)IBOutlet UIView *editview;

/*IBAction*/
-(IBAction)closejobdetails:(id)sender;
-(IBAction)editjobdetails:(id)sender;
-(IBAction)closeeditview:(id)sender;

@end
