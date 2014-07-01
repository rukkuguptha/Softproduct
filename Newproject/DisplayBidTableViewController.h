//
//  DisplayBidTableViewController.h
//  Newproject
//
//  Created by GMSIndia 2 on 25/06/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DisplayBidTableViewController : UIViewController
{
    NSInteger tooltype;
}

/*IBActions*/
- (IBAction)colsethispage:(id)sender;
- (IBAction)manpoweraction:(id)sender;
- (IBAction)equipmentaction:(id)sender;
- (IBAction)materialaction:(id)sender;
- (IBAction)otheraction:(id)sender;
- (IBAction)summaryaction:(id)sender;
@end
