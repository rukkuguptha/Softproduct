//
//  DocmntViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 12/13/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DocmntViewController : UIViewController


/*tiles*/
@property(strong,nonatomic)IBOutlet UIView *valuesphilosophyview;
@property(strong,nonatomic)IBOutlet UIView *qualityAssuranceview;
@property(strong,nonatomic)IBOutlet UIView *saftymanualview;
@property(strong,nonatomic)IBOutlet UIView *EmpHandbkview;
@property(strong,nonatomic)IBOutlet UIView *fleetmgmtpgmview;
@property(strong,nonatomic)IBOutlet UIView *msdsdbview;


-(IBAction)closethedocument:(id)sender;

//viewCtrlr


@end
