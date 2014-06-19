//
//  InOutSiteViewController.h
//  Newproject
//
//  Created by GMSIndia 2 on 12/06/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EqOthersMdl.h"
#import "jobsitemodel.h"


@protocol sendback<NSObject>

-(void)toreloadtable;


@end
@interface InOutSiteViewController : UIViewController
{
    NSInteger confirmcheck;
     NSInteger outconfirmcheck;
    BOOL recordResults;
    NSString *confmin;
    NSString *confirmout;
    NSString *job;
    NSInteger jobid;
    NSInteger webtype;
    NSString *msg;
    NSInteger excptn;
    NSInteger  btnclck;
}
-(void)toreloadtable;

@property(strong,nonatomic)EqOthersMdl *eqmdl;
@property(strong,nonatomic)jobsitemodel *jmdl;
@property(nonatomic, weak)id<sendback>delegate;

-(IBAction)closethepage:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *remveexptn;


/*IBOutlets in Sitein*/
@property(strong,nonatomic)IBOutlet UITextField *jobsitetxtfld;
@property(strong,nonatomic)IBOutlet UITextField *itemcodetxtfld;
@property(strong,nonatomic)IBOutlet UITextField *orderedqtytxtfld;
@property(strong,nonatomic)IBOutlet UITextField *receivedqtytxtfld;
@property(strong,nonatomic)IBOutlet UITextField *qtyrcvdnwtxtfld;
@property(strong,nonatomic)IBOutlet UITextView *notetextview;
@property(strong,nonatomic)IBOutlet UIButton *cnfrmbtn;
@property (strong, nonatomic) IBOutlet UIButton *excptnbtnlbl;

-(IBAction)confirmcheckaction:(id)sender;
-(IBAction)savesitein:(id)sender;
- (IBAction)removeexpbtn:(id)sender;

- (IBAction)excptnbtn:(id)sender;

/*popover*/
@property(strong,nonatomic)UIPopoverController *popOverController;
@property(strong,nonatomic)UITableView *popOverTableView;
/*IBOutlets in Siteout*/
@property(strong,nonatomic)IBOutlet UITextField *outjobsitetxtfld;
@property(strong,nonatomic)IBOutlet UITextField *outitemcodetxtfld;
@property(strong,nonatomic)IBOutlet UITextField *outorderedqtytxtfld;
@property(strong,nonatomic)IBOutlet UITextField *outreceivedqtytxtfld;
@property(strong,nonatomic)IBOutlet UITextField *outtotalqtysendtxtfld;
@property(strong,nonatomic)IBOutlet UITextField *outqtysendbacktxtfld;
@property(strong,nonatomic)IBOutlet UITextView *outnotetextview;
@property(strong,nonatomic)IBOutlet UIButton *outcnfrmbtn;
@property(strong,nonatomic)IBOutlet UIButton *tojobbtn;

-(IBAction)outconfirmcheckaction:(id)sender;
-(IBAction)tojobsiteaction:(id)sender;
-(IBAction)savesiteout:(id)sender;



@property(strong,nonatomic)IBOutlet UITableView *popovertableview;
@property(strong,nonatomic)UIPopoverController *popovercontroller;

/*array*/
@property(strong,nonatomic)NSMutableArray *inoutarray;
@property(strong,nonatomic)NSMutableArray *jobarray;
@property(strong,nonatomic)NSMutableDictionary *jobdict;

@property(strong,nonatomic)NSMutableArray *jobnoarray;
@property(strong,nonatomic)NSMutableDictionary *jobnodictionary;
@property(strong,nonatomic)NSString *jobdesc;

 /*xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;

@end
