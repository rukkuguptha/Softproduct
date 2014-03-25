//
//  SalesRepInfoViewController.h
//  Newproject
//
//  Created by GMSIndia 2 on 20/06/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Rsalesmdl.h"
#import "Validation.h"

@interface SalesRepInfoViewController : UIViewController
{
    NSInteger optionidentifier;
    NSInteger webtype;
    BOOL recordResults;
}

@property(strong,nonatomic)Rsalesmdl *rmodel;
@property(strong,nonatomic)Validation *val;
@property(strong,nonatomic)NSString *ccode;


@property(strong,nonatomic)IBOutlet UIScrollView *scroll;
@property(strong,nonatomic)IBOutlet UITableView *salesRepTable;
@property(strong,nonatomic)IBOutlet UIView *addView;
@property(strong,nonatomic)IBOutlet UINavigationItem *navbar;
@property(strong,nonatomic)IBOutlet UIView *infoview;
@property(strong,nonatomic)IBOutlet UITableViewCell *salescell;

- (IBAction)closesalesreppage:(id)sender;
- (IBAction)addsalesaction:(id)sender;
- (IBAction)deletesalesaction:(id)sender;
- (IBAction)editsalesaction:(id)sender;

/*Outlets in cell*/
@property (strong, nonatomic) IBOutlet UILabel *custcodelabel;
@property (strong, nonatomic) IBOutlet UILabel *empidlabel;
@property (strong, nonatomic) IBOutlet UILabel *namelabel;
@property (strong, nonatomic) IBOutlet UILabel *phonelabel;
@property (strong, nonatomic) IBOutlet UILabel *extensionlabel;
@property (strong, nonatomic) IBOutlet UILabel *mobilelabel;
@property (strong, nonatomic) IBOutlet UILabel *email;

/*xmlparser*/
@property(strong,nonatomic)NSMutableData *webData;
@property(strong,nonatomic)NSXMLParser *xmlparser;
@property(strong,nonatomic)NSMutableString *soapResults;
/*array*/
@property(strong,nonatomic)NSMutableArray *salesarray;

@end
