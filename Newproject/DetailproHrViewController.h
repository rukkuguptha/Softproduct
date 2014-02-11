//
//  DetailproHrViewController.h
//  Newproject
//
//  Created by GMSIndia 2 on 10/02/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailproHrViewController : UIViewController
{
    NSInteger poptype;
}

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

/*Paymentypeview*/
@property(strong,nonatomic)IBOutlet UIView *paymentdetailview;
@property(strong,nonatomic)IBOutlet UIButton *paymenttypebtn;


-(IBAction)selectpaymenttype:(id)sender;

/*document View*/
@property(strong,nonatomic)IBOutlet UIView *dcmntdetailview;
@property(strong,nonatomic)IBOutlet UIView *documentnametextfld;
@property(strong,nonatomic)IBOutlet UITableView *documentlisttable;
@property(strong,nonatomic)IBOutlet UITableViewCell *doccell;
@property(strong,nonatomic)IBOutlet UIView *doctabletitleview;

-(IBAction)selectfileaction:(id)sender;
-(IBAction)updatedoc:(id)sender;

/*popover*/
@property(strong,nonatomic)UIPopoverController *popOverController;
@property(strong,nonatomic)UITableView *popOverTableView;

/*arrays*/
@property(strong,nonatomic)NSMutableArray *maritalarray;
@end
