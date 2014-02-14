//
//  DetailplanViewController.h
//  Newproject
//
//  Created by GMSIndia 2 on 13/02/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailplanViewController : UIViewController

/*IBActions*/
-(IBAction)closeplan:(id)sender;
- (IBAction)Scaffoldslection:(id)sender;
- (IBAction)InsulationSelection:(id)sender;
- (IBAction)fireproofingselection:(id)sender;

/*IBOutlets*/
@property(strong,nonatomic)IBOutlet UIBarButtonItem *scaffoldbtn;
@property(strong,nonatomic)IBOutlet UIBarButtonItem *insulationbtn;
@property(strong,nonatomic)IBOutlet UIBarButtonItem *fireproofingbtn;

@property(strong,nonatomic)IBOutlet UIView *scaffoldview;
//@property(strong,nonatomic)IBOutlet UIView *insulationview;
//@property(strong,nonatomic)IBOutlet UIView *fireproofingview;
@property(strong,nonatomic)IBOutlet UIView *scaffoldtabletitleview;




@end
