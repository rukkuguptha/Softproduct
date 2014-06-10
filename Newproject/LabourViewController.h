//
//  LabourViewController.h
//  Newproject
//
//  Created by GMSIndia 2 on 09/06/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LabourViewController : UIViewController

@property(strong,nonatomic)IBOutlet UIView *titleview;
@property(strong,nonatomic)IBOutlet UITableViewCell *labrcell;
@property(strong,nonatomic)IBOutlet UITableView *labrtable;
@property(strong,nonatomic)IBOutlet UILabel *totalquantitylabel;

/*cell Labels*/
@property(strong,nonatomic)IBOutlet UILabel *joblbl;
@property(strong,nonatomic)IBOutlet UILabel *itemcodelbl;
@property(strong,nonatomic)IBOutlet UILabel *deslbl;
@property(strong,nonatomic)IBOutlet UILabel *datelbl;
@property(strong,nonatomic)IBOutlet UILabel *quantitylbl;


@property(strong,nonatomic)NSMutableArray *labourarray;

- (IBAction)clsebtn:(id)sender;
@end
