//
//  SmalltoolsViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 1/1/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SmalltoolsViewController : UIViewController
@property (strong, nonatomic) IBOutlet UINavigationBar *navbar;
@property (strong, nonatomic) IBOutlet UIView *view1;
@property (strong, nonatomic) IBOutlet UITableView *Tooltable;
@property (strong, nonatomic) IBOutlet UIView *addview;
@property (strong, nonatomic) IBOutlet UITextField *codetxtfld;
@property (strong, nonatomic) IBOutlet UITextField *destxtfld;
@property (strong, nonatomic) IBOutlet UITextField *subtypetxtfld;
@property (strong, nonatomic) IBOutlet UITextField *costtxtfld;
@property (strong, nonatomic) IBOutlet UIButton *subsearchbtnlbl;

@property (strong, nonatomic) IBOutlet UINavigationItem *navtitle;


@property (strong, nonatomic)NSString*searchstring;
@property (strong, nonatomic) IBOutlet UISearchBar *searchbar;

- (IBAction)addtoolbtn:(id)sender;
- (IBAction)deletetoolbtn:(id)sender;
- (IBAction)closebtn:(id)sender;
- (IBAction)updatebtn:(id)sender;

- (IBAction)cancelbtn:(id)sender;
- (IBAction)subsearchbtn:(id)sender;
- (IBAction)closeaddbtn:(id)sender;


@end