//
//  ManagemttileViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 6/9/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovementtileViewController.h"

@interface ManagemttileViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIView *resurceview;
@property (strong, nonatomic)MovementtileViewController*movemtVCtrl;
- (IBAction)clsebtn:(id)sender;


@end
