//
//  BranchViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 3/24/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BranchViewController : UIViewController
{
    NSInteger path;
}
/*IBActions*/
- (IBAction)Closebranchpage:(id)sender;
/*IBOutlets*/
@property(strong,nonatomic)IBOutlet UITableViewCell *branchcell;
@property (strong, nonatomic) IBOutlet UITableView *branchtable;

/*array*/
@property(strong,nonatomic)NSMutableArray *brancharray;

@end
