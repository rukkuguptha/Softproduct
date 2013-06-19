//
//  LeadsViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 6/14/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "ActivityViewController.h"
#import "FollowupViewController.h"
@interface LeadsViewController : UIViewController<UIActionSheetDelegate>{
    NSInteger poptype;
}
@property(strong,nonatomic)IBOutlet UITableView *leadTable;
@property(strong,nonatomic)IBOutlet UIScrollView *scroll;
// for LeadCustomCell
@property(strong,nonatomic)IBOutlet UILabel *leadName;
@property(strong,nonatomic)IBOutlet UILabel *Location;
@property(strong,nonatomic)IBOutlet UILabel *Contract;
@property(strong,nonatomic)IBOutlet UILabel *EmailId;
@property(strong,nonatomic)IBOutlet UILabel *IndustryType;
@property(strong,nonatomic)IBOutlet UILabel *ProjectType;
@property(strong,nonatomic)IBOutlet UILabel *ProjectExecution;

@property(strong,nonatomic)IBOutlet UITableViewCell *leadsTablecell;
@property(strong,nonatomic)UIPopoverController *popOverController;
@property(strong,nonatomic)UITableView *popOverTableView;
@property (strong, nonatomic) IBOutlet UIImageView *imgview;
@property(strong,nonatomic)NSMutableArray*popoverArray;
@property(strong,nonatomic)NSMutableArray*btnArray;

@property(strong,nonatomic)ActivityViewController*activityVCtrl;

@property(strong,nonatomic)FollowupViewController*followupVCtrl;
- (IBAction)Addbtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *view2;
- (IBAction)clsebtn:(id)sender;
@property (strong, nonatomic) IBOutlet UINavigationBar *navbar;




/*connections in EDIT VIEW*/

@property (strong, nonatomic) IBOutlet UITextField *cmpnynametxtfld;
@property (strong, nonatomic) IBOutlet UITextField *contactnametxtfld;

@property (strong, nonatomic) IBOutlet UITextField *phonetxtfld;

@property (strong, nonatomic) IBOutlet UITextField *citytxtfld;
@property (strong, nonatomic) IBOutlet UIButton *leadtypebtnlbl;
@property (strong, nonatomic) IBOutlet UIButton *projecttype;
@property (strong, nonatomic) IBOutlet UITextField *prjctyeartxtfld;

@property (strong, nonatomic) IBOutlet UITextField *prjctdscptntxtfld;

@property (strong, nonatomic) IBOutlet UITextField *locationtxtfld;
@property (strong, nonatomic) IBOutlet UITextField *contacttiletxtfld;
@property (strong, nonatomic) IBOutlet UITextField *emailidtxtfld;
@property (strong, nonatomic) IBOutlet UITextField *statetxtfld;
@property (strong, nonatomic) IBOutlet UIButton *industrytypetxtfld;
@property (strong, nonatomic) IBOutlet UIButton *prjctexcutntxtfld;
- (IBAction)leadtypebtn:(id)sender;
- (IBAction)prjcttypebtn:(id)sender;
- (IBAction)industrytypetxtfld:(id)sender;

- (IBAction)prjctexcnbtn:(id)sender;

- (IBAction)updatebtn:(id)sender;
- (IBAction)cancelbtn:(id)sender;

/*Arrays*/

@property (strong, nonatomic)NSMutableArray*leadtypeArray;
@property (strong, nonatomic)NSMutableArray*projecttypeArray;
@property (strong, nonatomic)NSMutableArray*industrytypeArray;
@property (strong, nonatomic)NSMutableArray*prjctexcutnArray;




@end
