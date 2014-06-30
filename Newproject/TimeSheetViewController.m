//
//  TimeSheetViewController.m
//  Newproject
//
//  Created by Riya on 6/30/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "TimeSheetViewController.h"

@interface TimeSheetViewController ()

@end

@implementation TimeSheetViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)allemplysbtn:(id)sender {
}

- (IBAction)foremanbtn:(id)sender {
}

- (IBAction)formanselctn:(id)sender {
}

- (IBAction)time1btn:(id)sender {
}

- (IBAction)time2btn:(id)sender {
}

- (IBAction)phase1btn:(id)sender {
}

- (IBAction)sequence1btn:(id)sender {
}

- (IBAction)tagnumber1btn:(id)sender {
}

- (IBAction)phase2btn:(id)sender {
}

- (IBAction)sequence2btn:(id)sender {
}

- (IBAction)tagnumber2btn:(id)sender {
}


#pragma mark-Barbutton Actions

- (IBAction)laborbtn:(id)sender {
    _view1.hidden=NO;
     _view2.hidden=YES;
}

- (IBAction)equpbtn:(id)sender {
    _view1.hidden=NO;
    _view2.hidden=YES;

}

- (IBAction)fleetbtn:(id)sender {
    _view1.hidden=NO;
    _view2.hidden=YES;

}

- (IBAction)tpfbtn:(id)sender {
    _view1.hidden=NO;
    _view2.hidden=YES;

}

- (IBAction)tpebtn:(id)sender {
    _view1.hidden=NO;
    _view2.hidden=YES;

}

- (IBAction)materialsbtn:(id)sender {
    _view2.hidden=NO;
    _view1.hidden=YES;

}

- (IBAction)consumblesbtn:(id)sender {
    _view2.hidden=NO;
    _view1.hidden=YES;
}

- (IBAction)othrsbtn:(id)sender {
    _view2.hidden=NO;
    _view1.hidden=YES;
}

- (IBAction)applybtn:(id)sender {
    _view2.hidden=NO;
    _view1.hidden=YES;
}

- (IBAction)clsebtn:(id)sender {
    _view2.hidden=NO;
    _view1.hidden=YES;
}
@end
