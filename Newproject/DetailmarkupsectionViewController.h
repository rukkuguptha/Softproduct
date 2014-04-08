//
//  DetailmarkupsectionViewController.h
//  Newproject
//
//  Created by GMSIndia 2 on 07/04/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "subheadermarkmodel.h"

@interface DetailmarkupsectionViewController : UIViewController
{
     BOOL recordResults;
}

@property(strong,nonatomic)subheadermarkmodel *submodel;


/*IBActions*/
-(IBAction)closedetailpage:(id)sender;



@property(strong,nonatomic)IBOutlet UIView *marktitleview;
@property(strong,nonatomic)IBOutlet UINavigationItem *navitem;
@property(strong,nonatomic)IBOutlet UITableView *markdetailtable;
@property(strong,nonatomic)IBOutlet UITableViewCell *markcell;


@property(strong,nonatomic)IBOutlet UILabel *subheaderlabel;
@property(strong,nonatomic)IBOutlet UILabel *variablelabel;
@property(strong,nonatomic)IBOutlet UILabel *stlabel;
@property(strong,nonatomic)IBOutlet UILabel *otlabel;
@property(strong,nonatomic)IBOutlet UILabel *rciplabel;
@property(strong,nonatomic)IBOutlet UILabel *selectedlabel;
@property(strong,nonatomic)IBOutlet UILabel *fixedlabel;

/*xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlparser;
@property(strong,nonatomic)NSMutableString *soapresults;
@property(strong,nonatomic)NSMutableData *webdata;

@property(readwrite)NSInteger mainid;
@property(strong,nonatomic)NSString *mainheader;

@property(strong,nonatomic)NSMutableArray *subdetailarray;

@end
