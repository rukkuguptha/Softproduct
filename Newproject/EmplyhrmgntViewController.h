//
//  EmplyhrmgntViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 3/4/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Empmdl.h"
@interface EmplyhrmgntViewController : UIViewController
{
    NSInteger Path;
       BOOL recordResults;
    NSInteger webtype;
    
}
@property(strong,nonatomic)Empmdl *empmdl;
@property (strong, nonatomic)NSString *jobsiteid;
@property (strong, nonatomic)NSMutableDictionary *jobsitedict;
@property (strong, nonatomic)NSMutableArray *jobsitearray;
/*xmlparse*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;


/*IBAction*/
-(IBAction)closeempmgmt:(id)sender;

/*IBOutlets*/
@property(strong,nonatomic)IBOutlet UITableView *mgmttableview;
@property(strong,nonatomic)IBOutlet UIView *tabletitleview;
@property(strong,nonatomic)IBOutlet UISearchBar *searchbar;
@property(strong,nonatomic)IBOutlet UITableViewCell *mgmtcell;
@property(strong,nonatomic)NSString *searchstring;

/*Array*/
@property(strong,nonatomic)NSMutableArray *employeelistarray;

/*outlet in cell*/
@property(strong,nonatomic)IBOutlet UILabel *ssnlabel;
@property(strong,nonatomic)IBOutlet UILabel *firstnamelabel;
@property(strong,nonatomic)IBOutlet UILabel *lastnamelabel;
@property(strong,nonatomic)IBOutlet UILabel *jobsitelabel;

@end
