//
//  BillingViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 3/12/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BillingViewController : UIViewController
{
    BOOL recordResults;
}

@property(strong,nonatomic)NSString *billstring;

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

/*Dictionary*/
@property(strong,nonatomic)NSMutableDictionary *popdict;

/*xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlparser;
@property(strong,nonatomic)NSMutableString *soapresults;
@property(strong,nonatomic)NSMutableData *webdata;

@end
