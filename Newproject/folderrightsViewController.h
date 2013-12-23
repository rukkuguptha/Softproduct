//
//  folderrightsViewController.h
//  Newproject
//
//  Created by GMSIndia 2 on 17/12/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface folderrightsViewController : UIViewController

@property(strong,nonatomic)IBOutlet UITableViewCell *folderrightscell;
@property(strong,nonatomic)IBOutlet UITableView *folderrighttable;
@property(strong,nonatomic)IBOutlet UIView *titleview;
@property(strong,nonatomic)IBOutlet UIButton *createcheckbtn;
@property(strong,nonatomic)IBOutlet UIButton *upldcheckbtn;
@property(strong,nonatomic)IBOutlet UIButton *dwnldcheckbtn;

-(IBAction)closefolderrightsview:(id)sender;
-(IBAction)editfolderrights:(id)sender;

@end
