//
//  SalesRepInfoViewController.h
//  Newproject
//
//  Created by GMSIndia 2 on 20/06/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SalesRepInfoViewController : UIViewController
{
    NSInteger optionidentifier;
}
@property(strong,nonatomic)IBOutlet UIScrollView *scroll;
@property(strong,nonatomic)IBOutlet UITableView *salesRepTable;
@property(strong,nonatomic)IBOutlet UIView *addView;
@property(strong,nonatomic)IBOutlet UINavigationItem *navbar;
@property(strong,nonatomic)IBOutlet UIView *infoview;
- (IBAction)closesalesreppage:(id)sender;
- (IBAction)addsalesaction:(id)sender;
- (IBAction)deletesalesaction:(id)sender;
- (IBAction)editsalesaction:(id)sender;
@end
