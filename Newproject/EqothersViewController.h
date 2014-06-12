//
//  EqothersViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 6/9/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EqOthersMdl.h"
#import "InOutSiteViewController.h"
@interface EqothersViewController : UIViewController{
    BOOL  recordResults;
    int btnclck;
     int btnclck2;
    int btnclck3;

    NSString *previousdate;
    NSInteger btnindex;
    NSInteger dateselctor;
}
- (IBAction)clsebtn:(id)sender;
@property (strong, nonatomic)InOutSiteViewController *InoutVCtrl;
@property (strong, nonatomic)EqOthersMdl*equpmdl;
@property (strong, nonatomic)NSMutableArray *equipmntarray;
@property (strong, nonatomic)NSMutableArray *Optionarray;
@property (strong, nonatomic)NSMutableDictionary *mydict;
@property (strong, nonatomic)NSMutableArray *jobnumbrarray;
@property (strong, nonatomic)NSMutableArray *itemnamearray;
@property (strong, nonatomic)NSMutableArray *itemdatearray;

@property (strong, nonatomic) IBOutlet UIScrollView *scroll;
@property (strong, nonatomic) IBOutlet UITableView *eqtable;
@property (strong, nonatomic) IBOutlet UITableViewCell *eqcell;
@property (strong, nonatomic) IBOutlet UIView *titleview;

/*popover*/
@property(strong,nonatomic)UIPopoverController *popOverController;
@property(strong,nonatomic)UITableView *popOverTableView;


/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;


/*cell outlets*/

@property (strong, nonatomic) IBOutlet UILabel *jobnumbrlbl;

@property (strong, nonatomic) IBOutlet UILabel *itmcodelbl;

@property (strong, nonatomic) IBOutlet UILabel *itemnamelbl;
@property (strong, nonatomic) IBOutlet UILabel *typelbl;
@property (strong, nonatomic) IBOutlet UILabel *datelbl;
@property (strong, nonatomic) IBOutlet UILabel *orderdlbl;
@property (strong, nonatomic) IBOutlet UILabel *stocklbl;
@property (strong, nonatomic) IBOutlet UIButton *jobcheckbtnlbl;
@property (strong, nonatomic) IBOutlet UIButton *jobnubrbtnlbl;
@property (strong, nonatomic) IBOutlet UIButton *itemcheckbtnlbl;
@property (strong, nonatomic) IBOutlet UIButton *itembtnlbl;
@property (strong, nonatomic) IBOutlet UIButton *datecheckbtnlbl;
@property (strong, nonatomic) IBOutlet UIButton *itmdatebtnlbl;
- (IBAction)itembtn:(id)sender;
- (IBAction)itmcheckbtn:(id)sender;
- (IBAction)jobbtn:(id)sender;
- (IBAction)jobcheckbtn:(id)sender;

- (IBAction)datecheckbtn:(id)sender;

- (IBAction)itmdatebtn:(id)sender;

- (IBAction)showbtn:(id)sender;



- (IBAction)stockoutbtn:(id)sender;
- (IBAction)siteinbtn:(id)sender;

- (IBAction)siteoutbtn:(id)sender;
- (IBAction)stockinbtn:(id)sender;


/*new xib outlets*/
@property (strong, nonatomic) IBOutlet UITextField *jobsitetxtfld;
@property (strong, nonatomic) IBOutlet UITextField *itmnametxtfld;

@property (strong, nonatomic) IBOutlet UITextField *orderdtxtfld;

@property (strong, nonatomic) IBOutlet UITextField *stocktxtfld;
@property (strong, nonatomic) IBOutlet UITextField *delivrdtxtfld;

@property (strong, nonatomic) IBOutlet UITextField *sendtxtfld;
@property (strong, nonatomic) IBOutlet UILabel *orderedlbl;

@property (strong, nonatomic) IBOutlet UILabel *delivedlbl;
@property (strong, nonatomic) IBOutlet UILabel *sendlbl;

@property (strong, nonatomic) IBOutlet UIButton *thirdbtnlbl;
@property (strong, nonatomic) IBOutlet UILabel *confirmbtnlbl;
@property (strong, nonatomic) IBOutlet UIButton *confirmcheckbtnlbl;
@property (strong, nonatomic) IBOutlet UITextView *notestxtview;

- (IBAction)thirdbtn:(id)sender;
- (IBAction)confirmbtn:(id)sender;

- (IBAction)savebtn:(id)sender;

@end
