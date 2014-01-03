//
//  jobsitereqViewController.h
//  Newproject
//
//  Created by GMSIndia 2 on 16/12/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "jobdetailsViewController.h"

@interface jobsitereqViewController : UIViewController
{
    NSInteger path;
    BOOL recordresults;
}

@property(strong,nonatomic)jobdetailsViewController *jbdetailVCtrl;
//IBOutlets
@property(strong,nonatomic)IBOutlet UITableView *jobsitetable;
@property(strong,nonatomic)IBOutlet UITableViewCell *jobcell;
@property(strong,nonatomic)IBOutlet UIView *titleview;
@property(strong,nonatomic)IBOutlet UIView *addjobview;
@property(strong,nonatomic)IBOutlet UINavigationItem *navItem;
@property(strong,nonatomic)UISearchBar *searchbar;

/*IBActions*/
-(IBAction)closejobreqview:(id)sender;
-(IBAction)addjobview:(id)sender;
-(IBAction)deletejobs:(id)sender;

/*IBActions in addview*/
-(IBAction)closeaddjbview:(id)sender;

/*in cell*/
@property(strong,nonatomic)IBOutlet UILabel *jobsitelabel;
-(IBAction)editjobs:(id)sender;


/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;

/*arrays*/
@property(strong,nonatomic)NSMutableArray *jobsitelistarray;


@end
