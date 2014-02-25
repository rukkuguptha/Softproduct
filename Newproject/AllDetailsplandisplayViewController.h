//
//  AllDetailsplandisplayViewController.h
//  Newproject
//
//  Created by GMSIndia 2 on 24/02/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Scaffoldtypemdl.h"
#import "Customscaffoldingplan.h"
#import <QuartzCore/QuartzCore.h>

@interface AllDetailsplandisplayViewController : UIViewController{
    
}

@property(strong,nonatomic)Scaffoldtypemdl *sccfldtypemdl;
@property(strong,nonatomic)Customscaffoldingplan *customsccfldmdl;

@property (strong, nonatomic) IBOutlet UINavigationBar *navbar;

-(IBAction)clsebtn:(id)sender;

@property (strong, nonatomic) IBOutlet UITableView *subtypetable;
@property (strong, nonatomic) IBOutlet UITableView *maintable;




@end
