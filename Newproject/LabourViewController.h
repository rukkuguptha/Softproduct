//
//  LabourViewController.h
//  Newproject
//
//  Created by GMSIndia 2 on 09/06/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Labourcustommdl.h"
#import "Countmdl.h"

@interface LabourViewController : UIViewController
{
    BOOL recordResults;
    NSInteger sum;
    NSInteger webtype;
    NSInteger btnindex;
    int btnclck;
    int btnclck2;
    int btnclck3;
     NSInteger dateselctor;
       UIDatePicker *timePick;
}
@property(strong,nonatomic)Labourcustommdl *lbrmdl;
@property(strong,nonatomic)Countmdl *emdl;

@property(strong,nonatomic)IBOutlet UIView *titleview;
@property(strong,nonatomic)IBOutlet UITableViewCell *labrcell;
@property(strong,nonatomic)IBOutlet UITableView *labrtable;
@property(strong,nonatomic)IBOutlet UILabel *totalquantitylabel;

/*cell Labels*/
@property(strong,nonatomic)IBOutlet UILabel *joblbl;
@property(strong,nonatomic)IBOutlet UILabel *itemcodelbl;
@property(strong,nonatomic)IBOutlet UILabel *deslbl;
@property(strong,nonatomic)IBOutlet UILabel *datelbl;
@property(strong,nonatomic)IBOutlet UILabel *quantitylbl;
@property(strong,nonatomic)IBOutlet UILabel *countlabel;

@property(strong,nonatomic)IBOutlet UIButton *jobbtn;
@property(strong,nonatomic)IBOutlet UIButton *descbtn;
@property(strong,nonatomic)IBOutlet UIButton *datebtn;

@property(strong,nonatomic)IBOutlet UIButton *jobcheckbtn;
@property(strong,nonatomic)IBOutlet UIButton *desccheckbtn;
@property(strong,nonatomic)IBOutlet UIButton *datecheckbtn;


/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;


@property(strong,nonatomic)NSMutableArray *labourarray;
@property(strong,nonatomic)NSMutableArray *totalarray;
@property(strong,nonatomic)NSMutableArray *employeecountarray;
@property(strong,nonatomic)NSMutableArray *newlabrarray;
@property(strong,nonatomic)NSMutableArray *jobarray;
@property(strong,nonatomic)NSMutableArray *descarray;
@property(strong,nonatomic)NSMutableArray *datearray;

/*popover*/
@property(strong,nonatomic)UIPopoverController *popOverController;
@property(strong,nonatomic)UITableView *popOverTableView;


- (IBAction)clsebtn:(id)sender;
- (IBAction)selectjob:(id)sender;
- (IBAction)selectdate:(id)sender;
- (IBAction)seletdesc:(id)sender;
- (IBAction)show:(id)sender;
- (IBAction)jobcheckbtnaction:(id)sender;
- (IBAction)desccheckaction:(id)sender;
- (IBAction)datecheckbtnaction:(id)sender;
- (IBAction)cancelbtn:(id)sender;


@end
