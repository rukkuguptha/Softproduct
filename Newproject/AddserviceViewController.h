//
//  AddserviceViewController.h
//  Newproject
//
//  Created by GMSIndia 2 on 13/02/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddserviceViewController : UIViewController

{
    NSInteger path;
}

/*IBAction*/
-(IBAction)closeservices:(id)sender;
-(IBAction)deleteservices:(id)sender;
-(IBAction)selectservices:(id)sender;

/*outlets*/
@property(strong,nonatomic)IBOutlet UITableView *servicelisttable;
@property(strong,nonatomic)IBOutlet UIView *tabletitleview;
@property(strong,nonatomic)UITableView *popovertableview;
@property(strong,nonatomic)UIPopoverController *popovercontroller;
@property(strong,nonatomic)IBOutlet UIButton *servicebtn;


/*array*/
@property(strong,nonatomic)NSMutableArray *allservicearray;
@property(strong,nonatomic)NSMutableArray *serviceaddedarray;
@end
