//
//  FoldersViewController.h
//  Newproject
//
//  Created by GMSIndia 2 on 16/12/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AllfolderViewController.h"
#import "folderrightsViewController.h"

@interface FoldersViewController : UIViewController


-(IBAction)closefolderview:(id)sender;
@property(strong,nonatomic)AllfolderViewController *allfolderVctrl;
@property(strong,nonatomic)folderrightsViewController *folderrightVCtrl;
@property(strong,nonatomic)IBOutlet UIView *allfolderview;
@property(strong,nonatomic)IBOutlet UIView *folderrightsview;
@end
