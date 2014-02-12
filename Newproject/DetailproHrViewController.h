//
//  DetailproHrViewController.h
//  Newproject
//
//  Created by GMSIndia 2 on 10/02/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Empdetails.h"

@interface DetailproHrViewController : UIViewController
{
    NSInteger poptype;
    BOOL   recordResults;
    
}




/*webservice*/

@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;


/*button*/
- (IBAction)DetailsBtnAction:(id)sender;
- (IBAction)DcmntBtnAction:(id)sender;
- (IBAction)w4BtnAction:(id)sender;
- (IBAction)paymentbtnaction:(id)sender;

/*Detailsview*/
@property(strong,nonatomic)IBOutlet UIView *detailsaddview;
@property(strong,nonatomic)IBOutlet UITableView *detailstablview;
@property(strong,nonatomic)IBOutlet UIView *detailstabletitleview;
@property(strong,nonatomic)IBOutlet UITableViewCell *detailscell;

//celldetail labels
@property(strong,nonatomic)IBOutlet UILabel *requirementlabel;
@property(strong,nonatomic)IBOutlet UILabel *statuslabel;
@property(strong,nonatomic)IBOutlet UILabel *expirylabel;
@property(strong,nonatomic)IBOutlet UILabel *verificationlabel;
@property(strong,nonatomic)IBOutlet UIButton *editbtn;
@property(strong,nonatomic)IBOutlet UIView *editview;
-(IBAction)editdetails:(id)sender;
-(IBAction)closeeditview:(id)sender;
-(IBAction)updaterequirement:(id)sender;
-(IBAction)cancelrequirement:(id)sender;
-(IBAction)selectstatus:(id)sender;
-(IBAction)verifiedaction:(id)sender;

/*W4 view*/
@property(strong,nonatomic)IBOutlet UIView *w4detailview;
@property(strong,nonatomic)IBOutlet UIButton *maritalbtn;
@property(strong,nonatomic)IBOutlet UITextField *Dependentstexffld;


-(IBAction)selectmaritalstatus:(id)sender;

- (IBAction)w4savebtn:(id)sender;


/*Paymentypeview*/
@property(strong,nonatomic)IBOutlet UIView *paymentdetailview;
@property(strong,nonatomic)IBOutlet UIButton *paymenttypebtn;

@property (strong, nonatomic) IBOutlet UITextField *instnname;
@property (strong, nonatomic) IBOutlet UITextField *Accuntnumbr;
@property (strong, nonatomic) IBOutlet UITextField *rontgnumbr;
@property (strong, nonatomic) IBOutlet UITextField *citytxt;


@property (strong, nonatomic) IBOutlet UIButton *statelbl;
@property (strong, nonatomic) IBOutlet UITextField *cardnumbtxtfld;
@property (strong, nonatomic) IBOutlet UITextField *expbtn;

@property (strong, nonatomic) IBOutlet UITextField *cardroutdno;
@property (strong, nonatomic) IBOutlet UISegmentedControl *typesegmntlbl;

- (IBAction)statebtn:(id)sender;
- (IBAction)typesegmnt:(id)sender;

-(IBAction)selectpaymenttype:(id)sender;
- (IBAction)savebtn:(id)sender;

/*document View*/
@property(strong,nonatomic)IBOutlet UIView *dcmntdetailview;
@property(strong,nonatomic)IBOutlet UIView *documentnametextfld;
@property(strong,nonatomic)IBOutlet UITableView *documentlisttable;
@property(strong,nonatomic)IBOutlet UITableViewCell *doccell;
@property(strong,nonatomic)IBOutlet UIView *doctabletitleview;

-(IBAction)selectfileaction:(id)sender;
-(IBAction)updatedoc:(id)sender;
- (IBAction)detailclsebtn:(id)sender;


/*popover*/
@property(strong,nonatomic)UIPopoverController *popOverController;
@property(strong,nonatomic)UITableView *popOverTableView;

/*arrays*/
@property(strong,nonatomic)NSMutableArray *maritalarray;
@property(strong,nonatomic)NSMutableArray *maritalkeyarray;
@property(strong,nonatomic)NSMutableArray *Applicantarray;
@property(strong,nonatomic)NSMutableDictionary *maritaldict;

@end
