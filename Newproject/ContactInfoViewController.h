//
//  ContactInfoViewController.h
//  Newproject
//
//  Created by GMSIndia 2 on 20/06/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContactInfoViewController : UIViewController
@property(strong,nonatomic)IBOutlet UITableView *contactinfoTable;
@property(strong,nonatomic)IBOutlet UIView *infoview;
@property(strong,nonatomic)IBOutlet UINavigationBar *navbar;
@property(strong,nonatomic)IBOutlet UIView *addview;
@property(strong,nonatomic)IBOutlet UIScrollView *scroll;
- (IBAction)editcellbtn:(id)sender;
-(IBAction)closetheView:(id)sender;

@end
