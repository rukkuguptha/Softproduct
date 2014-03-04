//
//  DetailplanViewController.h
//  Newproject
//
//  Created by GMSIndia 2 on 13/02/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Customscaffoldingplan.h"
#import "Scaffoldtypemdl.h"
#import "AllDetailsplandisplayViewController.h"

@interface DetailplanViewController : UIViewController
{
    BOOL recordResults;
    NSInteger webtype;
    UIButton *button;
    NSInteger btnindex;
    NSInteger optionidentifier;
    NSInteger scaffoldtypeindex;
}

@property(strong,nonatomic)NSString *planid;
@property(strong,nonatomic)Customscaffoldingplan *scfldmdl;
@property(strong,nonatomic)Scaffoldtypemdl *typemdl;
@property(strong,nonatomic)AllDetailsplandisplayViewController *allctrlr;

/*IBActions*/
-(IBAction)closeplan:(id)sender;
- (IBAction)Scaffoldslection:(id)sender;
- (IBAction)InsulationSelection:(id)sender;
- (IBAction)fireproofingselection:(id)sender;
-(IBAction)editscaffoldaction:(id)sender;
-(IBAction)addplan:(id)sender;
-(IBAction)closescaffoldview:(id)sender;
-(IBAction)nextbtnaction:(id)sender;
-(IBAction)selectscaffoldtype:(id)sender;


/*IBOutlets in main view*/
@property(strong,nonatomic)IBOutlet UIBarButtonItem *scaffoldbtn;
@property(strong,nonatomic)IBOutlet UIBarButtonItem *insulationbtn;
@property(strong,nonatomic)IBOutlet UIBarButtonItem *fireproofingbtn;

@property(strong,nonatomic)IBOutlet UIView *scaffoldview;
@property(strong,nonatomic)IBOutlet UIView *addscaffoldrecordview;
//@property(strong,nonatomic)IBOutlet UIView *insulationview;
//@property(strong,nonatomic)IBOutlet UIView *fireproofingview;
@property(strong,nonatomic)IBOutlet UIView *scaffoldtabletitleview;
@property(strong,nonatomic)IBOutlet UITableViewCell *scaffoldcell;
@property(strong,nonatomic)IBOutlet UITableView *scaffoldtable;

/*popovercontroller*/
@property(strong,nonatomic)UITableView *popovertableview;
@property(strong,nonatomic)UIPopoverController *popovercontroller;

/*outlets in cell*/
@property(strong,nonatomic)IBOutlet UILabel *unitcelllabel;
@property(strong,nonatomic)IBOutlet UILabel *equipcelllabel;
@property(strong,nonatomic)IBOutlet UILabel *pjctheadercelllabel;
@property(strong,nonatomic)IBOutlet UILabel *scaffoldcellalbel;
@property(strong,nonatomic)IBOutlet UILabel *lengthcelllabel;
@property(strong,nonatomic)IBOutlet UILabel *heightcelllabel;
@property(strong,nonatomic)IBOutlet UILabel *widthcelllabel;
@property(strong,nonatomic)IBOutlet UILabel *quantitycelllabel;
@property(strong,nonatomic)IBOutlet UILabel *elevationcelllabel;
@property(strong,nonatomic)IBOutlet UILabel *manhourslabel;

/*outlets in addrecordview*/
@property(strong,nonatomic)IBOutlet UITextField *unittextfield;
@property(strong,nonatomic)IBOutlet UITextField *equipmenttextfield;
@property(strong,nonatomic)IBOutlet UITextField *proheadertextfield;
@property(strong,nonatomic)IBOutlet UIButton *scaffoldtyprbtn;
@property(strong,nonatomic)IBOutlet UITextField *lengthtextfield;
@property(strong,nonatomic)IBOutlet UITextField *heighttextfield;
@property(strong,nonatomic)IBOutlet UITextField *widthtextfield;
@property(strong,nonatomic)IBOutlet UITextField *qtytextfield;
@property(strong,nonatomic)IBOutlet UITextField *elevationtextfield;


/*xmlParser*/
@property(strong,nonatomic)NSMutableData *webData;
@property(strong,nonatomic)NSMutableString *soapresults;
@property(strong,nonatomic)NSXMLParser *xmlparser;



/*arrays and Dicts*/
@property(strong,nonatomic)NSMutableArray *scaffoldingplanlistarray;
@property(strong,nonatomic)NSMutableArray *scaffoldtyperesultarray;
@property(strong,nonatomic)NSMutableDictionary *scaffoldtypeDict;
@property(strong,nonatomic)NSMutableDictionary *scaffoldidDict;
@property(strong,nonatomic)NSString *scaffoldtypestring;
@property(strong,nonatomic)NSString *insertresultvalue;

@end
