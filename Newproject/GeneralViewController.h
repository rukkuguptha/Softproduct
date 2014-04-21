//
//  GeneralViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 4/21/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GeneralViewController : UIViewController
@property(strong,nonatomic)IBOutlet UIScrollView *scroll;
@property(strong,nonatomic)IBOutlet UITextView *destextview;


-(IBAction)closegeneralpage:(id)sender;
@end
