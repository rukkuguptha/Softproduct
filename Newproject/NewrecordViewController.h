//
//  NewrecordViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 2/19/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewrecordViewController : UIViewController{
    BOOL recordResults;
    NSString *jobtypeitm;
}
/*popover*/
@property(strong,nonatomic)UIPopoverController *popOverController;
@property(strong,nonatomic)UITableView *popOverTableView;


@property(strong,nonatomic) NSString *companyid;

/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;

/*Product Rate*/


@property (strong, nonatomic) IBOutlet UINavigationBar *navbar;
- (IBAction)clsebtn:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *ratetxtfld;
@property (strong, nonatomic) IBOutlet UITextField *descptntxtfld;
@property (strong, nonatomic) IBOutlet UITextField *valuetxtfld;
- (IBAction)updatepratebtn:(id)sender;
- (IBAction)pratecancel:(id)sender;

/*jobsite requirmnt*/
@property (strong, nonatomic)NSMutableDictionary * JobtypeDic;

@property (strong, nonatomic) IBOutlet UITextField *jobnametxtfld;
@property (strong, nonatomic) IBOutlet UITextField *jobcodetxtfld;
@property (strong, nonatomic) IBOutlet UIButton *typeidbtnlbl;

@property (strong, nonatomic) IBOutlet UITextField *jobcosttxtfld;
- (IBAction)typeidbtn:(id)sender;

- (IBAction)jobupdatebtn:(id)sender;

- (IBAction)cancelbtn:(id)sender;



@end
