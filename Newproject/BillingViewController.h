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
#import "Fmodel.h"

@interface BillingViewController : UIViewController
{
    BOOL recordResults;
    NSInteger webtype;
}

@property(strong,nonatomic)NSString *billstring;
@property(strong,nonatomic)NSString *mark;
@property(strong,nonatomic)Mastermarkmodel *mastermark;
@property(strong,nonatomic)Manpwr *manpwr;
@property(strong,nonatomic)Fmodel *fmdl;

@property(strong,nonatomic)IBOutlet UITableView *billingtable;
@property(strong,nonatomic)IBOutlet UITableViewCell *billcell;
@property(strong,nonatomic)IBOutlet UIView *tabletitleview;
@property(strong,nonatomic)IBOutlet UIButton *matrixbutton;

@property (strong, nonatomic) IBOutlet UIView *titleview;


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
@property(strong,nonatomic)NSMutableArray *fArray;

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

@property (strong, nonatomic) IBOutlet UITableViewCell *fcell;

@property (strong, nonatomic) IBOutlet UILabel *filbl;
@property (strong, nonatomic) IBOutlet UILabel *f2lbl;
@property (strong, nonatomic) IBOutlet UILabel *f3labl;

@property (strong, nonatomic) IBOutlet UILabel *f4lbl;
@property (strong, nonatomic) IBOutlet UILabel *f5lbl;
@property (strong, nonatomic) IBOutlet UILabel *f6lbl;
@property (strong, nonatomic) IBOutlet UILabel *f7lbl;
@property (strong, nonatomic) IBOutlet UILabel *f8lbl;
@property (strong, nonatomic) IBOutlet UILabel *f9lbl;
@property (strong, nonatomic) IBOutlet UILabel *f10lbl;
@property (strong, nonatomic) IBOutlet UILabel *f11lbl;
@property (strong, nonatomic) IBOutlet UILabel *f12lbl;
@property (strong, nonatomic) IBOutlet UILabel *f13lbl;
@property (strong, nonatomic) IBOutlet UILabel *f14lbl;
@property (strong, nonatomic) IBOutlet UILabel *f15lbl;
@property (strong, nonatomic) IBOutlet UILabel *f16lbl;
@property (strong, nonatomic) IBOutlet UILabel *f17lbl;
@property (strong, nonatomic) IBOutlet UILabel *f18lbl;
@property (strong, nonatomic) IBOutlet UILabel *f19lbl;
@property (strong, nonatomic) IBOutlet UILabel *f20lbl;
@property (strong, nonatomic) IBOutlet UILabel *f21lbl;
@property (strong, nonatomic) IBOutlet UILabel *f22lbl;



@end
