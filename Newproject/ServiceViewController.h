//
//  ServiceViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 12/13/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ServiceViewController : UIViewController

{
    NSInteger optionidentifier;
}

-(IBAction)closetheservicesview:(id)sender;
@property(strong,nonatomic)IBOutlet UITableView *servicesTable;
@property(strong,nonatomic)IBOutlet UIView *titleview;
-(IBAction)Addservices:(id)sender;
@property(strong,nonatomic)IBOutlet UITableViewCell *servicecell;
-(IBAction)editservices:(id)sender;
@property(strong,nonatomic)IBOutlet UIView *addserview;
-(IBAction)closeaddview:(id)sender;
@property(strong,nonatomic)IBOutlet UINavigationItem *navabar;
@end
