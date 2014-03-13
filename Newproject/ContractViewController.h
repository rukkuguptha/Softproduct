//
//  ContractViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 3/12/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface ContractViewController : UIViewController


/*IBActions*/
-(IBAction)closethecontractpage:(id)sender;

/*IBOutlets*/
@property(strong,nonatomic)IBOutlet UITableView *contracttable;
@property(strong,nonatomic)IBOutlet UIView *contracttitleview;

@end
