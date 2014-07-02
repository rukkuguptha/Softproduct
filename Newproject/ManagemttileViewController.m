//
//  ManagemttileViewController.m
//  Newproject
//
//  Created by GMSIndia1 on 6/9/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "ManagemttileViewController.h"

@interface ManagemttileViewController ()

@end

@implementation ManagemttileViewController

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
    self.view.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    
    
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc]
                                         initWithTarget:self
                                         action:@selector(Resourcepage)];
    doubleTap.numberOfTapsRequired=1;
    doubleTap.delegate=(id)self;
    [self.resurceview addGestureRecognizer:doubleTap];
    UITapGestureRecognizer *doubleTap1 = [[UITapGestureRecognizer alloc]
                                         initWithTarget:self
                                         action:@selector(Issuepage)];
    doubleTap1.numberOfTapsRequired=1;
    doubleTap1.delegate=(id)self;
    [self.issueview addGestureRecognizer:doubleTap1];
    UITapGestureRecognizer *doubleTap2 = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(Timesheetpage)];
    doubleTap2.numberOfTapsRequired=1;
    doubleTap2.delegate=(id)self;
    [self.timesheetview addGestureRecognizer:doubleTap2];
    UITapGestureRecognizer *doubleTap3 = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(labourPage)];
    doubleTap3.numberOfTapsRequired=1;
    doubleTap3.delegate=(id)self;
    [self.labrview addGestureRecognizer:doubleTap3];
    
    UITapGestureRecognizer *doubleTap4 = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(Sitereqpage)];
    doubleTap4.numberOfTapsRequired=1;
    doubleTap4.delegate=(id)self;
    [self.siteview addGestureRecognizer:doubleTap4];



}
-(void)Resourcepage{
    if (!_movemtVCtrl) {
        _movemtVCtrl=[[MovementtileViewController alloc]initWithNibName:@"MovementtileViewController" bundle:nil];
    }
    _movemtVCtrl.modalPresentationStyle=UIModalPresentationFormSheet;
    _movemtVCtrl.modalTransitionStyle=UIModalTransitionStyleCoverVertical;
    [self presentViewController:_movemtVCtrl
                       animated:YES completion:NULL];
}
-(void)Issuepage{
    if (!_issueVCtrl) {
        _issueVCtrl=[[IssuesViewController alloc]initWithNibName:@"IssuesViewController" bundle:nil];
    }
   //_issueVCtrl.modalPresentationStyle=UIModalPresentationFormSheet;
    _issueVCtrl.modalTransitionStyle=UIModalTransitionStyleCoverVertical;
    [self presentViewController:_issueVCtrl
                       animated:YES completion:NULL];

    
}
-(void)Timesheetpage{
    if (!_timesheetVCtrl) {
        _timesheetVCtrl=[[TimeSheetViewController alloc]initWithNibName:@"TimeSheetViewController" bundle:nil];
    }
    //_issueVCtrl.modalPresentationStyle=UIModalPresentationFormSheet;
    _timesheetVCtrl.modalTransitionStyle=UIModalTransitionStyleCoverVertical;
    [self presentViewController:_timesheetVCtrl
                       animated:YES completion:NULL];
    
    
}
-(void)labourPage{
    
    if (!_lbrmgmtvctrl) {
        _lbrmgmtvctrl=[[LbrMgmtViewController alloc]initWithNibName:@"LbrMgmtViewController" bundle:nil];
    }
    _lbrmgmtvctrl.modalPresentationStyle=UIModalPresentationFormSheet;
    _lbrmgmtvctrl.modalTransitionStyle=UIModalTransitionStyleCoverVertical;
    [self presentViewController:_lbrmgmtvctrl
                       animated:YES completion:NULL];
    
    
}

-(void)Sitereqpage{
    if (!_SitereqVCtrl) {
        _SitereqVCtrl=[[PSitereqmntViewController alloc]initWithNibName:@"PSitereqmntViewController" bundle:nil];
    }
    //_issueVCtrl.modalPresentationStyle=UIModalPresentationFormSheet;
    _timesheetVCtrl.modalTransitionStyle=UIModalTransitionStyleCoverVertical;
    [self presentViewController:_SitereqVCtrl
                       animated:YES completion:NULL];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clsebtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
