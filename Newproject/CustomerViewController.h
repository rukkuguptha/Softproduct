//
//  CustomerViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 6/14/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>


@interface CustomerViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIScrollView *scrollview;
@property (strong, nonatomic) IBOutlet UITableView *customertable;
@property (strong, nonatomic) IBOutlet UITableViewCell *customercell;

@property (strong, nonatomic) IBOutlet UIView *view1;
@property (strong, nonatomic)NSMutableArray*custmrarray;
@end
