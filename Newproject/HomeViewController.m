//
//  HomeViewController.m
//  Newproject
//
//  Created by GMSIndia1 on 6/14/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

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
   
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc]
                                         initWithTarget:self
                                         action:@selector(customerpage)];
    doubleTap.numberOfTapsRequired=1;
    doubleTap.delegate=(id)self;
    [self.customerview addGestureRecognizer:doubleTap];
    
    UITapGestureRecognizer *doubleTap1 = [[UITapGestureRecognizer alloc]
                                         initWithTarget:self
                                         action:@selector(LeadPage)];
    doubleTap1.numberOfTapsRequired=1;
    doubleTap1.delegate=(id)self;
    [self.leadView addGestureRecognizer:doubleTap1];
    UITapGestureRecognizer *doubleTap2 = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(companyPage)];
    doubleTap2.numberOfTapsRequired=1;
    doubleTap2.delegate=(id)self;
    [self.companyView addGestureRecognizer:doubleTap2];

    
    UITapGestureRecognizer *doubleTap3 = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(hrpage)];
    doubleTap3.numberOfTapsRequired=1;
    doubleTap3.delegate=(id)self;
    [self.hrview addGestureRecognizer:doubleTap3];
    
    UITapGestureRecognizer *doubleTap4 = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(repage)];
    doubleTap4.numberOfTapsRequired=1;
    doubleTap4.delegate=(id)self;
    [self.reurceview addGestureRecognizer:doubleTap4];
    
    UITapGestureRecognizer *doubleTap5 = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(plangpage)];
    doubleTap5.numberOfTapsRequired=1;
    doubleTap5.delegate=(id)self;
    [self.planngview addGestureRecognizer:doubleTap5];



}



-(void)customerpage{
    if (!self.custmrVCtrl) {
        self.custmrVCtrl=[[TilecustmrViewController alloc]initWithNibName:@"TilecustmrViewController" bundle:nil];
    }
    _custmrVCtrl.modalPresentationStyle = UIModalPresentationFormSheet;
  

    [self presentViewController:_custmrVCtrl
                       animated:YES completion:NULL];
    
    
}
-(void)LeadPage
{
    if (!self.leadVCtrl) {
        self.leadVCtrl=[[LeadsViewController alloc]initWithNibName:@"LeadsViewController" bundle:nil];
    }
    [self presentViewController:_leadVCtrl
                       animated:YES completion:NULL];
    

}
-(void)companyPage
{
    if (!self.tileVCtrl) {
        self.tileVCtrl=[[TileViewController alloc]initWithNibName:@"TileViewController" bundle:nil];
    }
    _tileVCtrl.modalPresentationStyle = UIModalPresentationFormSheet;
    
    [self presentViewController:_tileVCtrl
                       animated:YES completion:NULL];
    
    
}
-(void)hrpage{
    if (!self.TilehrVCtrl) {
        self.TilehrVCtrl=[[TilehrViewController alloc]initWithNibName:@"TilehrViewController" bundle:nil];
    }
  
    _TilehrVCtrl.modalPresentationStyle=UIModalPresentationFormSheet;
   
    [self presentViewController:_TilehrVCtrl
                       animated:YES completion:NULL];
}
-(void)repage{
    if (!self.ReVCtrl) {
        self.ReVCtrl=[[ResViewController alloc]initWithNibName:@"ResViewController" bundle:nil];
    }
    _ReVCtrl.modalPresentationStyle = UIModalPresentationFormSheet;
    [self presentViewController:_ReVCtrl
                       animated:YES completion:NULL];

    
}
-(void)plangpage{
    if (!self.PlangVCtrl) {
        self.PlangVCtrl=[[PlanningViewController alloc]initWithNibName:@"PlanningViewController" bundle:nil];
    }
    _PlangVCtrl.modalPresentationStyle=UIModalPresentationPageSheet;
    _PlangVCtrl.modalTransitionStyle=UIModalTransitionStyleCoverVertical;
    [self presentViewController:_PlangVCtrl
                       animated:YES completion:NULL];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
