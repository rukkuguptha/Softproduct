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
    NSInteger webtype;
}
@property(strong,nonatomic)listusermdl *usrmdl;
@property(strong,nonatomic)NSString *searchstring;

//Outlets
@property(strong,nonatomic)IBOutlet UITableView *usertable;
@property(strong,nonatomic)IBOutlet UITableViewCell *usercell;
@property(strong,nonatomic)IBOutlet UIView *titleview;
@property(strong,nonatomic)IBOutlet UIView *addview;
@property(strong,nonatomic)IBOutlet UINavigationItem *navitem;
@property(strong,nonatomic)IBOutlet UISearchBar *searchbar;

/*outlets in cell*/
@property(strong,nonatomic)IBOutlet UILabel *usernamelabel;

/*outlets in view*/
@property(strong,nonatomic)IBOutlet UITextField *usrnametextfld;
@property(strong,nonatomic)IBOutlet UITextField *pswdtextfld;

/*IBAction in view*/
-(IBAction)insertuser:(id)sender;
-(IBAction)cancel:(id)sender;

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

/*array*/
@property(strong,nonatomic)NSMutableArray *userlistarray;

@end
