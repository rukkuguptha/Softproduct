//
//  BasicReqViewController.h
//  Newproject
//
//  Created by GMSIndia 2 on 16/12/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BasicReqViewController : UIViewController
{
    NSInteger poptype;
    /*value for checkbtn*/
    NSInteger expiry;
    NSInteger defaultcheck;
    NSInteger inhouse;
    NSInteger craft;
    
     
}


@property(strong,nonatomic)IBOutlet UITableView *basicreqtable;
@property(strong,nonatomic)IBOutlet UIView *titleview;
@property(strong,nonatomic)IBOutlet UIView *addreqview;
@property(strong,nonatomic)IBOutlet UITableViewCell *reqcell;
@property(strong,nonatomic)IBOutlet UINavigationItem *navItem;

@property(strong,nonatomic)UISearchBar *searchbar;

//IBActions
-(IBAction)closetheBASicreqview:(id)sender;
-(IBAction)addbasicreq:(id)sender;
-(IBAction)editBasicreq:(id)sender;

/*IBAction in editview*/
-(IBAction)closeeditBasicreqview:(id)sender;
-(IBAction)selectjobs:(id)sender;
-(IBAction)expirycheckaction:(id)sender;
-(IBAction)defaultcheckaction:(id)sender;
-(IBAction)inhousecheckaction:(id)sender;
-(IBAction)craftcheckaction:(id)sender;
-(IBAction)selectcraft:(id)sender;


/*outlets in addview*/
@property(strong,nonatomic)IBOutlet UIButton *jobbtn;
@property(strong,nonatomic)IBOutlet UIButton *expirycheckbtn;
@property(strong,nonatomic)IBOutlet UIButton *defaultcheckbtn;
@property(strong,nonatomic)IBOutlet UIButton *inhousecheckbtn;
@property(strong,nonatomic)IBOutlet UIButton *craftcheckbtn;
@property(strong,nonatomic)IBOutlet UIButton *craftbtn;



/*popover*/
@property(strong,nonatomic)UIPopoverController *popOverController;
@property(strong,nonatomic)UIPopoverController *popOverController1;
@property(strong,nonatomic)UITableView *popOverTableView;



@end
