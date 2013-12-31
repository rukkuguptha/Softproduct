//
//  ServiceViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 12/13/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ServiceViewController : UIViewController

{
    NSInteger optionidentifier;
    BOOL recordResults;
    NSInteger path;
}

/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;


/*IBOutlets*/
@property(strong,nonatomic)IBOutlet UITableView *servicesTable;
@property(strong,nonatomic)IBOutlet UIView *titleview;
@property(strong,nonatomic)IBOutlet UITableViewCell *servicecell;
@property(strong,nonatomic)IBOutlet UIView *addserview;
@property(strong,nonatomic)IBOutlet UINavigationItem *navabar;
/*cell outlets*/

@property (strong, nonatomic) IBOutlet UILabel *servicelabel;
@property (strong, nonatomic) IBOutlet UIButton *editbtn;

/*IBActions*/
-(IBAction)closetheservicesview:(id)sender;
-(IBAction)Addservices:(id)sender;
-(IBAction)editservices:(id)sender;
-(IBAction)closeaddview:(id)sender;
-(IBAction)deleteservices:(id)sender;

/*actions in addview*/
-(IBAction)updateservice:(id)sender;
-(IBAction)cancelservice:(id)sender;

/*outlets in addview*/
@property(strong,nonatomic)IBOutlet UITextField *servicetextfld;

@end
