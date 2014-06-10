//
//  EqothersViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 6/9/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EqOthersMdl.h"
@interface EqothersViewController : UIViewController{
    BOOL  recordResults;
    int btnclck;
    NSString *previousdate;
}
- (IBAction)clsebtn:(id)sender;
@property (strong, nonatomic)EqOthersMdl*equpmdl;
@property (strong, nonatomic)NSMutableArray *equipmntarray;
@property (strong, nonatomic)NSMutableArray *Optionarray;
@property (strong, nonatomic)NSMutableDictionary *mydict;
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
@property (strong, nonatomic) IBOutlet UIButton *optionbtnlbl;
@property (strong, nonatomic) IBOutlet UIButton *checkbtnlbl;

@property (strong, nonatomic) IBOutlet UIButton *selectbtnlbl;
- (IBAction)selectbtn:(id)sender;
- (IBAction)checkbtn:(id)sender;

- (IBAction)optnbtn:(id)sender;
- (IBAction)showbtn:(id)sender;

@end
