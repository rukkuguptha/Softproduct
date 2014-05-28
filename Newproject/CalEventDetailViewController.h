//
//  CalEventDetailViewController.h
//  Newproject
//
//  Created by GMSIndia 2 on 28/05/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalEventDetailViewController : UIViewController
{
    NSInteger tooltype;
}


@property(strong,nonatomic)IBOutlet UITableView *calmanpwrtable;
@property(strong,nonatomic)IBOutlet UITableView *sumtable;

@property(strong,nonatomic)IBOutlet UITableViewCell *calmanpwrcell;
@property(strong,nonatomic)IBOutlet UITableViewCell *calmaterialcell;
@property(strong,nonatomic)IBOutlet UITableViewCell *sumcell;


@property(strong,nonatomic)IBOutlet UIView *mantitleview;
@property(strong,nonatomic)IBOutlet UIView *mattitleview;
@property(strong,nonatomic)IBOutlet UIView *summarytitleview;


- (IBAction)clsebtn:(id)sender;
- (IBAction)manpoweraction:(id)sender;
- (IBAction)equipmentaction:(id)sender;
- (IBAction)materialaction:(id)sender;
- (IBAction)summaryaction:(id)sender;

@end
