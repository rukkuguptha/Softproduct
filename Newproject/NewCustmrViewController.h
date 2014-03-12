//
//  NewCustmrViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 3/12/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewCustmrViewController : UIViewController{
    BOOL recordResults;
}



/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;

/*popover*/
@property(strong,nonatomic)UIPopoverController *popOverController;
@property(strong,nonatomic)UITableView *popOverTableView;
@property (strong, nonatomic)NSMutableArray*popoverArry;



/*outlets*/
@property (strong, nonatomic) IBOutlet UINavigationBar *navgtnbar;
@property (strong, nonatomic) IBOutlet UIView *titleview;
@property (strong, nonatomic) IBOutlet UITableView *custmrtable;
@property (strong, nonatomic) IBOutlet UIView *addview;
@property (strong, nonatomic) IBOutlet UITextField *nametextfld;
@property (strong, nonatomic) IBOutlet UITextView *addresstxtview;
@property (strong, nonatomic) IBOutlet UITextField *citytxtfld;
@property (strong, nonatomic) IBOutlet UIButton *statebtnlbl;
@property (strong, nonatomic) IBOutlet UITextField *zipbtnlbl;
@property (strong, nonatomic) IBOutlet UIButton *cuntrybtnlbl;
@property (strong, nonatomic) IBOutlet UITextField *phonetxtfld;
@property (strong, nonatomic) IBOutlet UITextField *faxtxtfld;
@property (strong, nonatomic) IBOutlet UITextField *emailtxtfld;
@property (strong, nonatomic) IBOutlet UITextField *websitetxtfld;

@property (strong, nonatomic) IBOutlet UINavigationBar *addnavbar;



/*cell outlets*/

@property (strong, nonatomic) IBOutlet UITableViewCell *custmrcell;


/*actions*/

- (IBAction)clsebtn:(id)sender;
- (IBAction)addcustmrbtn:(id)sender;
- (IBAction)deletecustmrbtn:(id)sender;
- (IBAction)statebtn:(id)sender;
- (IBAction)cuntrybtn:(id)sender;
- (IBAction)updatebtn:(id)sender;
- (IBAction)cancelbtn:(id)sender;
- (IBAction)clseviewbtn:(id)sender;


@end
