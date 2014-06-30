//
//  TimeSheetViewController.h
//  Newproject
//
//  Created by Riya on 6/30/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimeSheetViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIView *view1;
@property (strong, nonatomic) IBOutlet UIView *view2;




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



- (IBAction)applybtn:(id)sender;


- (IBAction)clsebtn:(id)sender;

@end
