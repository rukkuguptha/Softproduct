//
//  workPhasesViewController.h
//  Newproject
//
//  Created by GMSIndia 2 on 23/12/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface workPhasesViewController : UIViewController
{
    NSInteger poptype;
    NSInteger parentcheck;
    NSInteger path;
    BOOL recordresults;
    NSInteger optionIdentifier;
    UIButton *button;
    NSInteger btnindex;

    
}
/*popover*/
@property(strong,nonatomic)UIPopoverController *popOverController;
@property(strong,nonatomic)UIPopoverController *popOverController1;
@property(strong,nonatomic)UITableView *popOverTableView;

/*Outlets*/
@property(strong,nonatomic)IBOutlet UITableView *phasetable;
@property(strong,nonatomic)IBOutlet UITableViewCell *phasecell;
@property(strong,nonatomic)IBOutlet UIView *titleview;
@property(strong,nonatomic)IBOutlet UIView *workphasesview;
@property(strong,nonatomic)IBOutlet UINavigationItem *navItem;

@property(strong,nonatomic)UISearchBar *searchbar;
@property(strong,nonatomic)NSString *searchstring;

/*IBActions*/
-(IBAction)closePhases:(id)sender;
-(IBAction)addworkPhasesview:(id)sender;
-(IBAction)editWorkPhasesview:(id)sender;
-(IBAction)closeworkphasesview:(id)sender;
-(IBAction)deletephases:(id)sender;

/*IBAction in view*/
-(IBAction)selectphases:(id)sender;
-(IBAction)selectservice:(id)sender;
-(IBAction)parentbtn:(id)sender;
-(IBAction)update_phases:(id)sender;
-(IBAction)cancel_phases:(id)sender;

/*outlet in view*/
@property(strong,nonatomic)IBOutlet UIButton *servicebtn;
@property(strong,nonatomic)IBOutlet UIButton *phasebtn;
@property(strong,nonatomic)IBOutlet UIButton *parentbtn;

/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;

/*arrays*/
@property(strong,nonatomic)NSMutableArray *workphasesarray;

@end
