//
//  TileViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 12/13/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CompanyViewController.h"
#import "DocmntViewController.h"
#import "ServiceViewController.h"
#import "folderrightsViewController.h"
#import "UsersViewController.h"
#import "jobsitereqViewController.h"
#import "BasicReqViewController.h"
#import "workPhasesViewController.h"


@interface TileViewController : UIViewController


//tiles
@property (strong, nonatomic) IBOutlet UIView *companyinfoview;
@property (strong, nonatomic) IBOutlet UIView *Documentsview;
@property (strong, nonatomic) IBOutlet UIView *servicesview;
@property (strong, nonatomic) IBOutlet UIView *foldersview;
@property (strong, nonatomic) IBOutlet UIView *usersview;
@property (strong, nonatomic) IBOutlet UIView *workprocedureview;
@property (strong, nonatomic) IBOutlet UIView *workphaseview;
@property(strong,nonatomic)IBOutlet UIView *jobsitereqview;
@property(strong,nonatomic)IBOutlet UIView *basicreqview;

//close Actions
-(IBAction)closethetile:(id)sender;



//viewcontroller
@property(strong,nonatomic)CompanyViewController *compVCtrl;
@property(strong,nonatomic)DocmntViewController *docVCtrl;
@property(strong,nonatomic)ServiceViewController *serviceVCtrl;
@property(strong,nonatomic)folderrightsViewController *folderVCtrl;
@property(strong,nonatomic)UsersViewController *usersVctrl;
@property(strong,nonatomic)jobsitereqViewController *jobsitereqVctrl;
@property(strong,nonatomic)BasicReqViewController *basicreqVctrl;
@property(strong,nonatomic)workPhasesViewController *workVCtrl;







@end
