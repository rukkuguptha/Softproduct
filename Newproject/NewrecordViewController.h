//
//  NewrecordViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 2/19/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewrecordViewController : UIViewController

/*Product Rate*/


@property (strong, nonatomic) IBOutlet UINavigationBar *navbar;
- (IBAction)clsebtn:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *ratetxtfld;
@property (strong, nonatomic) IBOutlet UITextField *descptntxtfld;
@property (strong, nonatomic) IBOutlet UITextField *valuetxtfld;
- (IBAction)updatepratebtn:(id)sender;

- (IBAction)pratecancel:(id)sender;


@end
