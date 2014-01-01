//
//  ResViewController.m
//  Newproject
//
//  Created by GMSIndia1 on 12/13/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import "ResViewController.h"

@interface ResViewController ()

@end

@implementation ResViewController

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
    
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc]
                                         initWithTarget:self
                                         action:@selector(manpwrpage)];
    doubleTap.numberOfTapsRequired=1;
    doubleTap.delegate=(id)self;
    [self.manpwrview addGestureRecognizer:doubleTap];
    
    UITapGestureRecognizer *doubleTap1 = [[UITapGestureRecognizer alloc]
                                         initWithTarget:self
                                         action:@selector(equipPage)];
    doubleTap1.numberOfTapsRequired=1;
    doubleTap1.delegate=(id)self;
    [self.eqpView addGestureRecognizer:doubleTap1];
    UITapGestureRecognizer *doubleTap2 = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(materialsPage)];
    doubleTap2.numberOfTapsRequired=1;
    doubleTap2.delegate=(id)self;
    [self.materialView addGestureRecognizer:doubleTap2];
    UITapGestureRecognizer *doubleTap3 = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(fleetPage)];
    doubleTap3.numberOfTapsRequired=1;
    doubleTap3.delegate=(id)self;
    [self.fleetview addGestureRecognizer:doubleTap3];

    UITapGestureRecognizer *doubleTap4 = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(toolPage)];
    doubleTap4.numberOfTapsRequired=1;
    doubleTap4.delegate=(id)self;
    [self.smalltoolview addGestureRecognizer:doubleTap4];
    



}
-(void)equipPage
{
    if (!self.equipVCtrl) {
        _equipVCtrl=[[EqpmViewController alloc]initWithNibName:@"EqpmViewController" bundle:nil];
    }
    _equipVCtrl.modalPresentationStyle = UIModalPresentationPageSheet;
    
    [self presentViewController:_equipVCtrl
                       animated:YES completion:NULL];
}

-(void)manpwrpage{
    if (!self.manVCtrl) {
        _manVCtrl=[[ManViewController alloc]initWithNibName:@"ManViewController" bundle:nil];
    }
    _manVCtrl.modalPresentationStyle = UIModalPresentationPageSheet;

    [self presentViewController:_manVCtrl
                       animated:YES completion:NULL];
}
-(void)materialsPage
{
    if (!self.materialVCtrl) {
        _materialVCtrl=[[MaterialsViewController alloc]initWithNibName:@"MaterialsViewController" bundle:nil];
    }
    _materialVCtrl.modalPresentationStyle = UIModalPresentationPageSheet;
    
    [self presentViewController:_materialVCtrl
                       animated:YES completion:NULL];
}


-(void)fleetPage{
    if (!self.fleetVCtrl) {
        _fleetVCtrl=[[FleetsViewController alloc]initWithNibName:@"FleetsViewController" bundle:nil];
    }
    
    _fleetVCtrl.modalPresentationStyle=UIModalPresentationPageSheet;
    [self presentViewController:_fleetVCtrl animated:YES completion:nil];
    
}
-(void)toolPage{
    if (!self.smalltoolVCtrl) {
        _smalltoolVCtrl=[[SmalltoolsViewController alloc]initWithNibName:@"SmalltoolsViewController" bundle:nil];
    }
    
    _smalltoolVCtrl.modalPresentationStyle=UIModalPresentationPageSheet;
    [self presentViewController: _smalltoolVCtrl animated:YES completion:nil];

    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)closebtnActn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
