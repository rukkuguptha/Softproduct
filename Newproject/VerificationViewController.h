//
//  VerificationViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 9/24/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface VerificationViewController : UIViewController<UITabBarDelegate>{
     BOOL recordResults;
}



@property(readwrite)NSInteger *applicantid;
@property (strong, nonatomic) IBOutlet UIScrollView *scroll;
@property (strong, nonatomic) IBOutlet UIView *view1;
@property (strong, nonatomic) IBOutlet UIView *ssnview;

@property (strong, nonatomic) IBOutlet UILabel *namelbltext;
@property (strong, nonatomic) IBOutlet UILabel *ssnlbltext;

@property (strong, nonatomic) IBOutlet UITabBar *tabbar;
- (IBAction)requrmntactn:(id)sender;
- (IBAction)i9action:(id)sender;
- (IBAction)bgaction:(id)sender;
- (IBAction)ssnaction:(id)sender;






@property (strong, nonatomic) IBOutlet UITabBarItem *I9item;
/*popover*/
@property(strong,nonatomic)UIPopoverController *popOverController;
@property(strong,nonatomic)UITableView *popOverTableView;


/*I9view*/
@property (strong, nonatomic) IBOutlet UIView *I9view;
@property (strong, nonatomic) IBOutlet UITextField *suffixtxtfld;
@property (strong, nonatomic) IBOutlet UITextField *lastnametxtfld;
@property (strong, nonatomic) IBOutlet UITextField *firstnametxtfld;
@property (strong, nonatomic) IBOutlet UITextField *middlenametxtfld;
@property (strong, nonatomic) IBOutlet UITextField *ssntxtfld;
@property (strong, nonatomic) IBOutlet UITextField *Addresstxtfld;
@property (strong, nonatomic) IBOutlet UITextField *citytxtfld;
@property (strong, nonatomic) IBOutlet UITextField *statetxtfld;
@property (strong, nonatomic) IBOutlet UITextField *ziptextfld;
@property (strong, nonatomic) IBOutlet UITextField *datetxtfld;
@property (strong, nonatomic) IBOutlet UITextField *verifiedbytxtfld;


- (IBAction)savebtn:(id)sender;
- (IBAction)cancelbtn:(id)sender;
- (IBAction)uploadbtn:(id)sender;

/*RequirementView*/

@property (strong, nonatomic) IBOutlet UIView *_requirmentview;
@property (strong, nonatomic) IBOutlet UITableView *requirementtable;
- (IBAction)Rsavebtn:(id)sender;

- (IBAction)Rcancelbtn:(id)sender;

/*RequirementView cell*/
@property (strong, nonatomic) IBOutlet UILabel *reqiuremntnamelbl;
@property (strong, nonatomic) IBOutlet UIButton *uploadbtnlbl;
/*xmlparse*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;

@end
