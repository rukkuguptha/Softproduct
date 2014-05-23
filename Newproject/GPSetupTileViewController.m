//
//  GPSetupTileViewController.m
//  Newproject
//
//  Created by GMSIndia 2 on 23/05/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "GPSetupTileViewController.h"

@interface GPSetupTileViewController ()

@end

@implementation GPSetupTileViewController

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
     self.view.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc]
                                         initWithTarget:self
                                         action:@selector(crewpage)];
    doubleTap.numberOfTapsRequired=1;
    doubleTap.delegate=(id)self;
    [self.manview addGestureRecognizer:doubleTap];
    
    UITapGestureRecognizer *doubleTap1 = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(equipPage)];
    doubleTap1.numberOfTapsRequired=1;
    doubleTap1.delegate=(id)self;
    [self.equipview addGestureRecognizer:doubleTap1];
    UITapGestureRecognizer *doubleTap2 = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(materialsPage)];
    doubleTap2.numberOfTapsRequired=1;
    doubleTap2.delegate=(id)self;
    [self.materview addGestureRecognizer:doubleTap2];
   
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)closethegroup:(id)sender

{
    [self dismissViewControllerAnimated:YES completion:NULL];
}
-(void)crewpage
{
    if (!self.crewctrl) {
        _crewctrl=[[CrewsetupViewController alloc]initWithNibName:@"CrewsetupViewController" bundle:nil];
    }
    //_crewctrl.modalPresentationStyle = UIModalPresentationPageSheet;
    
    [self presentViewController:_crewctrl
                       animated:YES completion:NULL];
}

-(void)equipPage{
    if (!self.equipVCtrl) {
        _equipVCtrl=[[GroupEqupViewController alloc]initWithNibName:@"GroupEqupViewController" bundle:nil];
    }
    //_equipVCtrl.modalPresentationStyle = UIModalPresentationFullScreen;
    
    [self presentViewController:_equipVCtrl
                       animated:YES completion:NULL];
}
-(void)materialsPage
{
    if (!self.materialVCtrl) {
        _materialVCtrl=[[GpMaterViewController alloc]initWithNibName:@"GpMaterViewController" bundle:nil];
    }
    //_materialVCtrl.modalPresentationStyle = UIModalPresentationPageSheet;
    
    [self presentViewController:_materialVCtrl
                       animated:YES completion:NULL];
}



@end
