//
//  LbrMgmtViewController.h
//  Newproject
//
//  Created by GMSIndia 2 on 30/06/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LbrMgmtViewController : UIViewController
{
    NSInteger btnindex;
    BOOL recordResults;
}


@property (strong, nonatomic) IBOutlet UITableView *mgmttable;
@property (strong, nonatomic) IBOutlet UIView *titleview;
@property(strong,nonatomic)IBOutlet UITableView *popovertable;
@property(strong,nonatomic)IBOutlet UITableViewCell *mgmtcell;
@property(strong,nonatomic)UIPopoverController *popover;
@property(strong,nonatomic)IBOutlet UIButton *jobbtn;
@property(strong,nonatomic)IBOutlet UIButton *formanbtn;
- (IBAction)Selectjobsite:(id)sender;
- (IBAction)Selectforman:(id)sender;


/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;
@property(strong,nonatomic)NSMutableArray *jobarray;
@property(strong,nonatomic)NSString  *jobnumber;
@end
