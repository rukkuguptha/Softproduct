//
//  ContractViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 3/12/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "MangmntdetailsViewController.h"
#import "subcontract.h"

@interface ContractViewController : UIViewController
{
    BOOL recordResults;
    UIButton *disbutton;
    UIButton *button;
    NSInteger buttonindex;
    NSInteger selectedcell;
    
}



@property(strong,nonatomic)MangmntdetailsViewController *mgmtdetails;
@property(strong,nonatomic)subcontract *sub;
@property(strong,nonatomic)NSString *searchstring;

/*IBActions*/
-(IBAction)closethecontractpage:(id)sender;

/*IBOutlets*/
@property(strong,nonatomic)IBOutlet UITableView *contracttable;
@property(strong,nonatomic)IBOutlet UIView *contracttitleview;
@property(strong,nonatomic)IBOutlet UIScrollView *scroll;

@property(strong,nonatomic)IBOutlet UITableViewCell *contrctcell;
@property(strong,nonatomic)IBOutlet UISearchBar *searchbar;



@property(strong,nonatomic)IBOutlet UIView *animatedview;
@property(strong,nonatomic)IBOutlet UILabel *detailslabel;
@property(readwrite)NSInteger openviewindex;
@property(readwrite)NSInteger previousopenviewindex;

/*xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlparser;
@property(strong,nonatomic)NSMutableString *soapresults;
@property(strong,nonatomic)NSMutableData *webdata;


/*IBOutlets in cell*/
@property(strong,nonatomic)IBOutlet UILabel *namelabel;
@property(strong,nonatomic)IBOutlet UILabel *numberlabel;
@property(strong,nonatomic)IBOutlet UILabel *datelabel;
@property(strong,nonatomic)IBOutlet UILabel *billingdayslabel;
@property(strong,nonatomic)IBOutlet UILabel *weeklyhourslabel;
@property(strong,nonatomic)IBOutlet UILabel *subcontractlabel;

/*array*/
@property(strong,nonatomic)NSMutableArray *contractlistarray;
@property(strong,nonatomic)NSMutableArray *passingarray;

@end
