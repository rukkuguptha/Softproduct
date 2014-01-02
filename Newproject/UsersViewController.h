//
//  UsersViewController.h
//  Newproject
//
//  Created by GMSIndia 2 on 16/12/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "listusermdl.h"

@interface UsersViewController : UIViewController
{
    NSInteger path;
    BOOL recordresults;
    NSInteger optionIdentifier;
    UIButton *button;
    NSInteger btnindex;
}
@property(strong,nonatomic)listusermdl *usrmdl;

//Outlets
@property(strong,nonatomic)IBOutlet UITableView *usertable;
@property(strong,nonatomic)IBOutlet UITableViewCell *usercell;
@property(strong,nonatomic)IBOutlet UIView *titleview;
@property(strong,nonatomic)IBOutlet UIView *addview;
@property(strong,nonatomic)IBOutlet UINavigationItem *navitem;

//IBActions
-(IBAction)closeuser:(id)sender;
-(IBAction)adduserview:(id)sender;
-(IBAction)edituserview:(id)sender;
-(IBAction)closeuserview:(id)sender;
-(IBAction)deleteusers:(id)sender;

/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;

@end
