//
//  HomeViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 6/14/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomerViewController.h"
@interface HomeViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIView *customerview;
@property (strong, nonatomic)CustomerViewController*custmrVCtrl;
@end
