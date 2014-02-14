//
//  SitevisitViewController.h
//  Newproject
//
//  Created by GMSIndia 2 on 13/02/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface SitevisitViewController : UIViewController<UITabBarDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *scrollview;

/*uitabbaritems*/
@property (strong, nonatomic) IBOutlet UITabBar *firsttabbar;
@property (strong, nonatomic) IBOutlet UITabBar *secondtabbar;

@property (strong, nonatomic) IBOutlet UITabBarItem *genralitm;
@property (strong, nonatomic) IBOutlet UITabBarItem *rateitm;
@property (strong, nonatomic) IBOutlet UITabBarItem *docuitm;
@property (strong, nonatomic) IBOutlet UITabBarItem *accesblity;

@property (strong, nonatomic) IBOutlet UITabBarItem *Estagareaitm;

@property (strong, nonatomic) IBOutlet UITabBarItem *meetgnotsitm;

@property (strong, nonatomic) IBOutlet UITabBarItem *equpmntiem;

@property (strong, nonatomic) IBOutlet UITabBarItem *wrkshedule;
@property (strong, nonatomic) IBOutlet UITabBarItem *biddersitm;
@property (strong, nonatomic) IBOutlet UITabBarItem *weatheritm;

@property (strong, nonatomic) IBOutlet UITabBarItem *noteitm;

/*General View outlet*/
@property (strong, nonatomic) IBOutlet UIView *gernalview;
@property (strong, nonatomic) IBOutlet UITextField *companynametxtfld;
@property (strong, nonatomic) IBOutlet UITextField *loctntxtfld;
@property (strong, nonatomic) IBOutlet UITextField *ziptxtfld;
@property (strong, nonatomic) IBOutlet UIButton *complextyofwrkbtnlbl;
@property (strong, nonatomic) IBOutlet UITextView *facilitytxtview;
@property (strong, nonatomic) IBOutlet UITextView *scpeofwrktxtview;

- (IBAction)cmpxtyofwrkbtn:(id)sender;
- (IBAction)updatebtn:(id)sender;

/*productn Rate*/
@property (strong, nonatomic) IBOutlet UIView *ratecell;
@property (strong, nonatomic) IBOutlet UILabel *ratelbl;
@property (strong, nonatomic) IBOutlet UILabel *ratedeslbl;
@property (strong, nonatomic) IBOutlet UITableView *prdunratetble;
@property (strong, nonatomic) IBOutlet UILabel *ratevaluelbl;



- (IBAction)ratedeletebtn:(id)sender;
- (IBAction)Rateaddbtn:(id)sender;
- (IBAction)celleditbtn:(id)sender;

/*IBAction*/
-(IBAction)closesitevisit:(id)sender;

@end
