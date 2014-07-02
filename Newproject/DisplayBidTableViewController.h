//
//  DisplayBidTableViewController.h
//  Newproject
//
//  Created by GMSIndia 2 on 25/06/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Reviebidmdl.h"


@interface DisplayBidTableViewController : UIViewController
{
    NSInteger tooltype;
    BOOL recordResults;
}

/*IBActions*/
- (IBAction)colsethispage:(id)sender;
- (IBAction)manpoweraction:(id)sender;
- (IBAction)equipmentaction:(id)sender;
- (IBAction)materialaction:(id)sender;
- (IBAction)otheraction:(id)sender;
- (IBAction)summaryaction:(id)sender;

@property(strong,nonatomic)NSString *bidid;
@property(strong,nonatomic)Reviebidmdl *reviewmdl;
/*xmlParser*/
@property(strong,nonatomic)NSMutableData *webData;
@property(strong,nonatomic)NSMutableString *soapresults;
@property(strong,nonatomic)NSXMLParser *xmlparser;

@property(strong,nonatomic)IBOutlet UITableView *manpowertable;
@property(strong,nonatomic)IBOutlet UIView *manpowertitle;
@property(strong,nonatomic)IBOutlet UITableViewCell *manpowercell;
@property (strong, nonatomic) IBOutlet UITableView *Othertable;
@property (strong, nonatomic) IBOutlet UIView *Othertitle;
@property(strong,nonatomic)IBOutlet UITableViewCell *othercell;
@property (strong, nonatomic) IBOutlet UITableView *SummaryTable;
@property (strong, nonatomic) IBOutlet UIView *summarytitle;
@property(strong,nonatomic)IBOutlet UITableViewCell *sumcell;


@property(strong,nonatomic)IBOutlet UIBarButtonItem *manpwrbtn;
@property(strong,nonatomic)IBOutlet UIBarButtonItem *eqpmntbtn;
@property(strong,nonatomic)IBOutlet UIBarButtonItem *materialbtn;
@property(strong,nonatomic)IBOutlet UIBarButtonItem *otherbtn;
@property(strong,nonatomic)IBOutlet UIBarButtonItem *summarybtn;

/*Labels in Manpowercell*/
@property(strong,nonatomic)IBOutlet UILabel *Mestilabel;
@property(strong,nonatomic)IBOutlet UILabel *Mitemcodelabel;
@property(strong,nonatomic)IBOutlet UILabel *Mdesclabel;
@property(strong,nonatomic)IBOutlet UILabel *Mqtylabel;
@property(strong,nonatomic)IBOutlet UILabel *Mstlabel;
@property(strong,nonatomic)IBOutlet UILabel *Motlabel;
@property(strong,nonatomic)IBOutlet UILabel *Mstratelabel;
@property(strong,nonatomic)IBOutlet UILabel *Motratelabel;
@property(strong,nonatomic)IBOutlet UILabel *Mtotlabel;
@property(strong,nonatomic)IBOutlet UILabel *Mtypelabel;



/*Labels in Othercell*/
@property(strong,nonatomic)IBOutlet UILabel *Oestilabel;
@property(strong,nonatomic)IBOutlet UILabel *Oitemcodelabel;
@property(strong,nonatomic)IBOutlet UILabel *Odesclabel;
@property(strong,nonatomic)IBOutlet UILabel *Oqtylabel;
@property(strong,nonatomic)IBOutlet UILabel *Ototallabel;
@property(strong,nonatomic)IBOutlet UILabel *Otypelabel;



/*array & dict */
@property(strong,nonatomic)NSMutableArray *manpowerarray;
@property(strong,nonatomic)NSMutableArray *Equipmentarray;
@property(strong,nonatomic)NSMutableArray *materialarray;
@property(strong,nonatomic)NSMutableArray *Otherarray;


@end
