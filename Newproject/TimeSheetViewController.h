//
//  TimeSheetViewController.h
//  Newproject
//
//  Created by Riya on 6/30/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimeSheetViewController : UIViewController{
    
    NSInteger barbtntype;
}


@property (strong, nonatomic) IBOutlet UITableView *timesheettable;
@property (strong, nonatomic) IBOutlet UIView *labortableview;


@property (strong, nonatomic) IBOutlet UIView *view1;
@property (strong, nonatomic) IBOutlet UIView *view2;
@property (strong, nonatomic) IBOutlet UIView *equipmnttableview;

@property (strong, nonatomic) IBOutlet UIView *otherstableview;
@property (strong, nonatomic) IBOutlet UIView *materialstableview;



@property (strong, nonatomic) IBOutlet UIButton *allemplyescheckbtnlbl;

@property (strong, nonatomic) IBOutlet UIButton *foremancheckbtnlbl;
@property (strong, nonatomic) IBOutlet UIButton *foremanbtnlbl;
@property (strong, nonatomic) IBOutlet UIButton *time1checkbtnlbl;
@property (strong, nonatomic) IBOutlet UIButton *time2checkbtnlbl;
@property (strong, nonatomic) IBOutlet UITextField *time1txtfld;
@property (strong, nonatomic) IBOutlet UITextField *time2txtfld;
@property (strong, nonatomic) IBOutlet UIButton *phase1btnlbl;
@property (strong, nonatomic) IBOutlet UIButton *sequence1btnlbl;
@property (strong, nonatomic) IBOutlet UIButton *tagnumber1btnlbl;
@property (strong, nonatomic) IBOutlet UIButton *phase2btnlbl;
@property (strong, nonatomic) IBOutlet UIButton *sequence2btnlbl;

@property (strong, nonatomic) IBOutlet UIButton *tagnumber2btnlbl;

@property (strong, nonatomic) IBOutlet UIButton *wo2btn;
@property (strong, nonatomic) IBOutlet UIButton *po2btnlbl;


@property (strong, nonatomic) IBOutlet UIBarButtonItem *labrbarbtn;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *equpbarbtn;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *fleetbarbtn;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *thirpfleetbarbtn;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *tpebarbtn;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *materialbarbtn;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *consumblebarbtn;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *othrsbarbtn;




- (IBAction)allemplysbtn:(id)sender;
- (IBAction)foremanbtn:(id)sender;
- (IBAction)formanselctn:(id)sender;
- (IBAction)time1btn:(id)sender;
- (IBAction)time2btn:(id)sender;
- (IBAction)phase1btn:(id)sender;
- (IBAction)sequence1btn:(id)sender;
- (IBAction)tagnumber1btn:(id)sender;
- (IBAction)phase2btn:(id)sender;
- (IBAction)sequence2btn:(id)sender;
- (IBAction)tagnumber2btn:(id)sender;



- (IBAction)laborbtn:(id)sender;
- (IBAction)equpbtn:(id)sender;
- (IBAction)fleetbtn:(id)sender;
- (IBAction)tpfbtn:(id)sender;

- (IBAction)tpebtn:(id)sender;
- (IBAction)materialsbtn:(id)sender;
- (IBAction)consumblesbtn:(id)sender;
- (IBAction)othrsbtn:(id)sender;
- (IBAction)wobt:(id)sender;

- (IBAction)PO2btn:(id)sender;


- (IBAction)applybtn:(id)sender;


- (IBAction)clsebtn:(id)sender;


/*cell outlets*/

@property (strong, nonatomic) IBOutlet UITableViewCell *laborcell;
@property (strong, nonatomic) IBOutlet UITableViewCell *labrequpcell;


@end
