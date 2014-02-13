//
//  AddserviceViewController.h
//  Newproject
//
//  Created by GMSIndia 2 on 13/02/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddserviceViewController : UIViewController



/*IBAction*/
-(IBAction)closeservices:(id)sender;
-(IBAction)deleteservices:(id)sender;

/*outlets*/
@property(strong,nonatomic)IBOutlet UITableView *servicelisttable;

@end
