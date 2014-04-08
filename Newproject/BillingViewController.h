//
//  BillingViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 3/12/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Mastermarkmodel.h"
#import "Manpwr.h"

@interface BillingViewController : UIViewController
{
    BOOL recordResults;
    NSInteger webtype;
}

@property(strong,nonatomic)NSString *billstring;
@property(strong,nonatomic)NSString *mark;
@property(strong,nonatomic)Mastermarkmodel *mastermark;
@property(strong,nonatomic)Manpwr *manpwr;

@property(strong,nonatomic)IBOutlet UITableView *billingtable;
@property(strong,nonatomic)IBOutlet UITableViewCell *billcell;
@property(strong,nonatomic)IBOutlet UIView *tabletitleview;
@property(strong,nonatomic)IBOutlet UIButton *matrixbutton;



@property(strong,nonatomic)UITableView *popovertableview;
@property(strong,nonatomic)UIPopoverController *popovercontroller;




/*IBActions*/
-(IBAction)closebillingmatrixpage:(id)sender;
-(IBAction)selectamatrix:(id)sender;
-(IBAction)viewmatrixaction:(id)sender;

/*array*/
@property(strong,nonatomic)NSMutableArray *viewmatrixarray;
@property(strong,nonatomic)NSMutableArray *poparray;
@property(strong,nonatomic)NSMutableArray *totalmarkuparray;
@property(strong,nonatomic)NSMutableArray *manpowerarray;

/*Dictionary*/
@property(strong,nonatomic)NSMutableDictionary *popdict;

/*xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlparser;
@property(strong,nonatomic)NSMutableString *soapresults;
@property(strong,nonatomic)NSMutableData *webdata;


/*Outlets in cell*/
@property(strong,nonatomic)IBOutlet UILabel *deslabel;
@property(strong,nonatomic)IBOutlet UILabel *unitcostlabel;
@property(strong,nonatomic)IBOutlet UILabel *stratelabel;
@property(strong,nonatomic)IBOutlet UILabel *otratelabel;

@end
