//
//  ManViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 12/13/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Manpwr.h"
@interface ManViewController : UIViewController{
    
    BOOL recordResults;
    NSInteger webtype;
    NSInteger path;
    UIButton *button;
    NSInteger btnindex;
    NSInteger btnidtfr;
    NSInteger checkbtnclick;
}

@property(strong,nonatomic)Manpwr *manpwrmdl;

/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;

/*Arrays&Dicts*/

@property(strong,nonatomic)NSMutableArray *Allmanpwrarry;
@property(strong,nonatomic)NSMutableArray *subtypearray;


/*popover*/
@property(strong,nonatomic)UIPopoverController *popOverController;
@property(strong,nonatomic)UITableView *popOverTableView;


/*cell outlets*/

@property (strong, nonatomic) IBOutlet UILabel *codelbl;
@property (strong, nonatomic) IBOutlet UILabel *deslbl;
@property (strong, nonatomic) IBOutlet UILabel *typelbl;
@property (strong, nonatomic) IBOutlet UILabel *costlbl;
@property (strong, nonatomic) IBOutlet UIButton *overhdchecklbl;

/*Add button outlets*/
@property (strong, nonatomic) IBOutlet UIButton *searchbtnlbl;
@property (strong, nonatomic) IBOutlet UITextField *itemcodetxtfld;
@property (strong, nonatomic) IBOutlet UITextField *itemdestxtfld;
@property (strong, nonatomic) IBOutlet UITextField *subtypetxtfld;
@property (strong, nonatomic) IBOutlet UITextField *unitcosttxtfld;

- (IBAction)overhdcheck:(id)sender;
- (IBAction)searchbtn:(id)sender;
- (IBAction)update:(id)sender;
- (IBAction)cancel:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *checkbtnlbl;



- (IBAction)deletebtn:(id)sender;
@property (strong, nonatomic)NSString*searchstring;

@property (strong, nonatomic) IBOutlet UISearchBar * SearchingBar;

@property (strong, nonatomic) IBOutlet UIScrollView *scrollview;
@property(strong,nonatomic)IBOutlet UITableView *manpowerTable;
@property(strong,nonatomic)IBOutlet UITableViewCell *manpowecell;
@property(strong,nonatomic)IBOutlet UIView *titleview;
-(IBAction)closemanpower:(id)sender;

@property(strong,nonatomic)IBOutlet UIView *addview;
- (IBAction)addmanpwer:(id)sender;
-(IBAction)editmanpower:(id)sender;
@property(strong,nonatomic)IBOutlet UINavigationItem *navitem;

@end
