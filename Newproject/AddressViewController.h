//
//  AddressViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 3/24/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
@interface AddressViewController : UIViewController

@property (strong, nonatomic) IBOutlet UINavigationBar *navbar;
@property (strong, nonatomic) IBOutlet UITableView *addresstable;
@property (strong, nonatomic) IBOutlet UIView *addview;

/*IBaction*/
- (IBAction)clsebtn:(id)sender;
- (IBAction)addbtn:(id)sender;
- (IBAction)deletebtn:(id)sender;

@end
