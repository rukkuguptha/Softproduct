//
//  DisplayBidTableViewController.h
//  Newproject
//
//  Created by GMSIndia 2 on 25/06/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SubdetailViewController.h"

@interface DisplayBidTableViewController : UIViewController
{
    UIButton *carbutton;
    UIButton *button;
    NSInteger btnindex;
    NSInteger selectedcell;
}

@property(strong,nonatomic)NSString *bidid;
@property(strong,nonatomic)SubdetailViewController *subvctrl;

@property (strong, nonatomic) IBOutlet UITableView *biddistable;
@property (strong, nonatomic) IBOutlet UIView *titleview;
@property (strong, nonatomic) IBOutlet UITableViewCell *tcell;
@property(readwrite)NSInteger openviewindex;
@property(readwrite)NSInteger previousopenviewindex;

/*IBActions*/
- (IBAction)colsethispage:(id)sender;

@end
