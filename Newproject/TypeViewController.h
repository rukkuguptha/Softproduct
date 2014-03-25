//
//  TypeViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 3/24/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TypeViewController : UIViewController

@property (strong, nonatomic) NSMutableArray *typelistarray;
@property (strong, nonatomic) IBOutlet UIView *titleview;
@property (strong, nonatomic) IBOutlet UINavigationBar *navbar;

@property (strong, nonatomic) IBOutlet UITableView *typetable;

@property (strong, nonatomic) IBOutlet UIView *addview;

@property (strong, nonatomic) IBOutlet UITextField *typetxtfld;
@property (strong, nonatomic) IBOutlet UIButton *cancelbtn;
@property (strong, nonatomic) IBOutlet UINavigationItem *navitem;



- (IBAction)deltebtn:(id)sender;

- (IBAction)addbtn:(id)sender;
- (IBAction)clsebtn:(id)sender;

- (IBAction)updatebtn:(id)sender;
@end
