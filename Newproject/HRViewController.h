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
#import "Empdetails.h"
@interface HRViewController : UIViewController{
    BOOL recordResults;
    NSString *imgString;
}
@property(readwrite)NSInteger *applicantid;
@property(strong,nonatomic)NSString*newid;
@property(strong,nonatomic)NSString*teststrng;
@property(strong,nonatomic)Empdetails*empdetl;
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
@property(strong,nonatomic)IBOutlet UIImageView *empImgview;
- (IBAction)disclurebtn:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *ssnlbl;
@property (strong, nonatomic) IBOutlet UILabel *phonelbl;


/*popover*/
@property(strong,nonatomic)UIPopoverController *popOverController;
@property(strong,nonatomic)UITableView *popOverTableView;

/*Arrays & Dictionaries*/
@property(strong,nonatomic)NSMutableDictionary*imageArraydict;
@property(strong,nonatomic)NSMutableArray*listarray;
@property(strong,nonatomic)NSMutableArray*empnameArray;
@property(strong,nonatomic)NSMutableArray *imageArray;

/*xmlparse*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;

@end
