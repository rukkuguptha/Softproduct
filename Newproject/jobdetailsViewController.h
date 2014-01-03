//
//  jobdetailsViewController.h
//  Newproject
//
//  Created by GMSIndia 2 on 02/01/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface jobdetailsViewController : UIViewController
{
    NSInteger path;
    NSInteger craft;
    
}



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
-(IBAction)deletejobdetails:(id)sender;

/*IBAction in view*/
-(IBAction)craftcheckaction:(id)sender;
-(IBAction)selectcraft:(id)sender;

/*IBOutlet in view*/
@property(strong,nonatomic)IBOutlet UIButton *checkcraftbtn;
@property(strong,nonatomic)IBOutlet UIButton *craftbtn;

/*popover*/
@property(strong,nonatomic)UIPopoverController *popOverController;
@property(strong,nonatomic)UIPopoverController *popOverController1;
@property(strong,nonatomic)UITableView *popOverTableView;



@end
