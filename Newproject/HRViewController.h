//
//  HRViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 9/24/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "VerificationViewController.h"
#import "UploadDocViewController.h"
@interface HRViewController : UIViewController{
    BOOL recordResults;
}

@property(strong,nonatomic)VerificationViewController*verifctnVCtrl;
@property(strong,nonatomic)UploadDocViewController*uploadVCtrl;
/*Tables*/
@property (strong, nonatomic) IBOutlet UITableView *employeestable;

/*searchbar*/
@property (strong, nonatomic) IBOutlet UISearchBar * SearchingBar;
@property (strong, nonatomic) NSString *searchstring;
@property (strong, nonatomic) IBOutlet UIScrollView *scroll;


/*cellOutlets*/
@property (strong, nonatomic) IBOutlet UITableViewCell *employeecell;
@property (strong, nonatomic) IBOutlet UIButton *_disclyrebtnlbl;
@property (strong, nonatomic) IBOutlet UILabel *empolyeename;
- (IBAction)disclurebtn:(id)sender;


/*popover*/
@property(strong,nonatomic)UIPopoverController *popOverController;
@property(strong,nonatomic)UITableView *popOverTableView;

/*Arrays*/

@property(strong,nonatomic)NSMutableArray*listarray;
/*xmlparse*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;

@end
