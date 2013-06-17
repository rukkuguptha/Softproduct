//
//  HomeViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 6/14/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomerViewController.h"
#import "LeadsViewController.h"
@interface HomeViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIView *customerview;
@property (strong, nonatomic) IBOutlet UIView *leadView;

@property (strong, nonatomic)CustomerViewController*custmrVCtrl;
@property(strong,nonatomic)LeadsViewController *leadVCtrl;

@end
