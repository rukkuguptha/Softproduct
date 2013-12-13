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
//#import "CompanyViewController.h"
#import "HRViewController.h"
#import "TileViewController.h"
#import "ResViewController.h"
@interface HomeViewController : UIViewController
/*Views*/
@property (strong, nonatomic) IBOutlet UIView *customerview;
@property (strong, nonatomic) IBOutlet UIView *leadView;
@property (strong, nonatomic) IBOutlet UIView *companyView;
@property (strong, nonatomic) IBOutlet UIView *hrview;


@property (strong, nonatomic)CustomerViewController*custmrVCtrl;
@property(strong,nonatomic)LeadsViewController *leadVCtrl;
//@property(strong,nonatomic)CompanyViewController *cmpanyctrl;
@property(strong,nonatomic)HRViewController*hrVCtrl;
@property(strong,nonatomic)TileViewController*tileVCtrl;
@property(strong,nonatomic)ResViewController*ReVCtrl;


//newcomment.
@property (strong, nonatomic) IBOutlet UIView *reurceview;


@end
