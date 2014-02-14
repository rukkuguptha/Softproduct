//
//  PlanningViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 2/12/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "AddserviceViewController.h"
#import "SitevisitViewController.h"
#import "DetailplanViewController.h"
#import "planmodel.h"
@interface PlanningViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSInteger leadcheck;
    NSInteger customercheck;
    NSInteger poptype;
    UIButton *button;
    BOOL recordResults;
}
@property(strong,nonatomic)planmodel *plnmdl;
@property(strong,nonatomic)AddserviceViewController *servVctrl;
@property(strong,nonatomic)SitevisitViewController *sitevisitVctrl;
@property(strong,nonatomic)DetailplanViewController *DetailplanVctrl;

/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;



/*views*/
@property (strong, nonatomic) IBOutlet UINavigationBar *titleview;
@property (strong, nonatomic) IBOutlet UIView *tabletitleview;
@property (strong, nonatomic) IBOutlet UITableView *plangtable;
@property(strong,nonatomic)IBOutlet UIView *addplanview;

/*Buttons*/
@property(strong,nonatomic)IBOutlet UIButton *leadcheckbtn;
@property(strong,nonatomic)IBOutlet UIButton *custcheckbtn;
@property(strong,nonatomic)IBOutlet UIButton *customerselectionBtn;
@property(strong,nonatomic)IBOutlet UIButton *leadselectionBtn;
@property(strong,nonatomic)IBOutlet UIButton *disclosurebtn;

@property(strong,nonatomic)IBOutlet UITableViewCell *planingcell;
@property(strong,nonatomic)IBOutlet UILabel *organizationname;
@property(strong,nonatomic)IBOutlet UILabel *leadlabel;
@property(strong,nonatomic)UITableView *popovertableview;
@property(strong,nonatomic)UIPopoverController *popovercontroller;
@property(strong,nonatomic)UISearchBar *searchbar;
@property(strong,nonatomic)NSString *searchstring;
@property(strong,nonatomic)IBOutlet UILabel *selectionlabel;


/*IBAction*/
- (IBAction)clseVCtrlbtn:(id)sender;
- (IBAction)addplan:(id)sender;
-(IBAction)closeaddview:(id)sender;
-(IBAction)checkleadaction:(id)sender;
-(IBAction)checkcustomeraction:(id)sender;
-(IBAction)selectcustomer:(id)sender;
-(IBAction)selectlead:(id)sender;
-(IBAction)selectdisclosure:(id)sender;
-(IBAction)updateplanning:(id)sender;
-(IBAction)cancelplanning:(id)sender;

/*array*/
@property(strong,nonatomic)NSMutableArray *leadlistarray;
@property(strong,nonatomic)NSMutableArray *customerlistarray;
@property(strong,nonatomic)NSMutableArray *disclosurearry;
@property(strong,nonatomic)NSMutableArray *planlistarray;

/*Dict*/
@property(strong,nonatomic)NSMutableDictionary *leaddict;
@property(strong,nonatomic)NSMutableDictionary *customerdict;

@property(strong,nonatomic)NSString *leadstring;
@property(strong,nonatomic)NSString *customerstring;



@end
