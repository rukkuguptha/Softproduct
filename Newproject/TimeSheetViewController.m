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
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    _view1.hidden=NO;
    _view2.hidden=YES;
    _timesheettable.rowHeight=60;
    _timesheettable.layer.borderWidth=3.0;
    _timesheettable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f].CGColor;
    _equipmnttableview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f];
    _materialstableview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f];
    _otherstableview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f];
    _labortableview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f];
    
    
    
//    .tintColor=[UIColor whiteColor];
//    _pratebtnlbl.tintColor=[UIColor blackColor];
//    _documntbtnlbl.tintColor=[UIColor blackColor];
//    _accesbltybtnlbl.tintColor=[UIColor blackColor];
//    _EstggAreabtnlbl.tintColor=[UIColor blackColor];
//    _jobsitebtnlbl.tintColor=[UIColor blackColor];
//    _saftybtnlbl.tintColor=[UIColor blackColor];
//    _equpmntslbl.tintColor=[UIColor blackColor];
//    _workbtnlbl.tintColor=[UIColor blackColor];
//    _meetingnotesbtnlbl.tintColor=[UIColor blackColor];
//    _biddersbtnlbl.tintColor=[UIColor blackColor];
//    _weatherbtnlbl.tintColor=[UIColor blackColor];
//    _notesbtnlbl.tintColor=[UIColor blackColor];
//

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
    _labortableview.hidden=NO;
    _equipmnttableview.hidden=YES;
    _materialstableview.hidden=YES;
    _otherstableview.hidden=YES;
    
}

- (IBAction)equpbtn:(id)sender {
    _view1.hidden=NO;
    _view2.hidden=YES;
    _labortableview.hidden=YES;
    _equipmnttableview.hidden=NO;
    _materialstableview.hidden=YES;
    _otherstableview.hidden=YES;

}

- (IBAction)fleetbtn:(id)sender {
    _view1.hidden=NO;
    _view2.hidden=YES;
    _labortableview.hidden=YES;
    _equipmnttableview.hidden=NO;
    _materialstableview.hidden=YES;
    _otherstableview.hidden=YES;


}

- (IBAction)tpfbtn:(id)sender {
    _view1.hidden=NO;
    _view2.hidden=YES;
    _labortableview.hidden=YES;
    _equipmnttableview.hidden=NO;
    _materialstableview.hidden=YES;
    _otherstableview.hidden=YES;


}

- (IBAction)tpebtn:(id)sender {
    _view1.hidden=NO;
    _view2.hidden=YES;
    _labortableview.hidden=YES;
    _equipmnttableview.hidden=NO;
    _materialstableview.hidden=YES;
    _otherstableview.hidden=YES;


}

- (IBAction)materialsbtn:(id)sender {
    _view2.hidden=NO;
    _view1.hidden=YES;
    _labortableview.hidden=YES;
    _equipmnttableview.hidden=YES;
    _materialstableview.hidden=NO;
    _otherstableview.hidden=YES;


}

- (IBAction)consumblesbtn:(id)sender {
    _view2.hidden=NO;
    _view1.hidden=YES;
    _labortableview.hidden=YES;
    _equipmnttableview.hidden=YES;
    _materialstableview.hidden=NO;
    _otherstableview.hidden=YES;
    

}

- (IBAction)othrsbtn:(id)sender {
    _view2.hidden=NO;
    _view1.hidden=YES;
    _labortableview.hidden=YES;
    _equipmnttableview.hidden=YES;
    _materialstableview.hidden=YES;
    _otherstableview.hidden=NO;
    

}

- (IBAction)wobt:(id)sender {
    
}

- (IBAction)PO2btn:(id)sender {
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
