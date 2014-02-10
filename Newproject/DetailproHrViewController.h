//
//  DetailproHrViewController.h
//  Newproject
//
//  Created by GMSIndia 2 on 10/02/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailproHrViewController : UIViewController

- (IBAction)DetailsBtnAction:(id)sender;
- (IBAction)DcmntBtnAction:(id)sender;
- (IBAction)w4BtnAction:(id)sender;
- (IBAction)paymentbtnaction:(id)sender;

//Detailsview
@property(strong,nonatomic)IBOutlet UIView *detailsaddview;
@property(strong,nonatomic)IBOutlet UITableView *detailstablview;
@property(strong,nonatomic)IBOutlet UIView *detailstabletitleview;
@property(strong,nonatomic)IBOutlet UITableViewCell *detailscell;

//W4 view
@property(strong,nonatomic)IBOutlet UIView *w4addview;
@property(strong,nonatomic)IBOutlet UIButton *maritalbtn;


-(IBAction)selectmaritalstatus:(id)sender;




/*popover*/
@property(strong,nonatomic)UIPopoverController *popOverController;
@property(strong,nonatomic)UITableView *popOverTableView;

/*arrays*/
@property(strong,nonatomic)NSMutableArray *maritalarray;
@end
