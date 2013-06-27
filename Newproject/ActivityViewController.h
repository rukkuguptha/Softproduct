//
//  ActivityViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 6/17/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "CKCalendarView.h"
#import "FollowupViewController.h"
#import "activityInfo.h"
#import "commentmdl.h"
@interface ActivityViewController : UIViewController
{
       BOOL recordResults;
    NSString *datetext;
      NSInteger butnidtfr;
    NSInteger poptype;
}
@property(strong,nonatomic)IBOutlet UITableView *activityTable;
@property(strong,nonatomic)IBOutlet UITableViewCell *actvityCell;
@property(strong,nonatomic)IBOutlet UIScrollView *scroll;
@property(strong,nonatomic)IBOutlet UIView *newviewactivity;
@property(strong,nonatomic)IBOutlet UINavigationBar *activityNav;
@property(nonatomic, weak) CKCalendarView *calendar;
@property(nonatomic, strong) NSDateFormatter *dateFormatter;
@property(strong,nonatomic)IBOutlet UIButton *dateBtn;
@property(strong,nonatomic)IBOutlet UIView *view2;
@property(strong,nonatomic)FollowupViewController*followupVCtrl;
@property(readwrite)NSInteger leadid;
/*Arrays*/
@property(strong,nonatomic)NSMutableArray*btnArray;

/*butn*/
-(IBAction)addNewActivity:(id)sender;
-(IBAction)closetheView:(id)sender;
-(IBAction)selectDate:(id)sender;
- (IBAction)editcellbtn:(id)sender;
- (IBAction)disbtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *disbtnlbl;
/*popover*/
@property(strong,nonatomic)UIPopoverController *popOverController;
@property(strong,nonatomic)UITableView *popOverTableView;
@property(strong,nonatomic)NSMutableArray*popoverArray;
/*Xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;
@property(strong,nonatomic)NSMutableArray *activityArray;
@property(strong,nonatomic)activityInfo *act;



@property(strong,nonatomic)IBOutlet UILabel *activityname;
@property(strong,nonatomic)IBOutlet UILabel *datetext;
@property(strong,nonatomic)IBOutlet UILabel *employee;
@property(strong,nonatomic)IBOutlet UILabel *description;
@property(strong,nonatomic)IBOutlet UILabel *status;
@property(readwrite)  NSInteger activityid;

//*txtfld
@property(strong,nonatomic)IBOutlet UITextField *employerTxtfld;
@property(strong,nonatomic)IBOutlet UITextField *statusTxtFld;
@property(strong,nonatomic)IBOutlet UITextField *activityTxtFld;
@property(strong,nonatomic)IBOutlet UITextView *descptionTextview;
@property(strong,nonatomic)IBOutlet UIButton *activityTypeBtn;
@property(strong,nonatomic)NSMutableArray *activitytypeArray;
-(IBAction)selectActivityType:(id)sender;
-(IBAction)saveActivity:(id)sender;
-(IBAction)cancelaction:(id)sender;

@property (strong, nonatomic)NSIndexPath *Path;

@property(readwrite)NSInteger selectedpath;
//*commentview

@property (strong, nonatomic) IBOutlet UIView *commentview;
@property (strong, nonatomic) IBOutlet UINavigationBar *cmtnav;
@property (strong, nonatomic) IBOutlet UITableView *cmttable;
@property (strong, nonatomic) IBOutlet UITextView *cmttxtbox;
@property (strong, nonatomic) IBOutlet UIView *composecmtview;
@property (strong, nonatomic) IBOutlet UITableViewCell *cmtcell;
@property (strong, nonatomic) IBOutlet UILabel *titilelbl;

@property (strong, nonatomic) IBOutlet UILabel *commentlbl;


@property(strong,nonatomic)commentmdl *cmtmdl;
@property(strong,nonatomic)NSMutableArray *cmntarray;

- (IBAction)Addcmtbtn:(id)sender;
-(IBAction)savecomment:(id)sender;
-(IBAction)cancelcomment:(id)sender;

@property (strong, nonatomic) IBOutlet UISearchBar * SearchingBar;
@property (strong, nonatomic) NSString *searchstring;


@end
