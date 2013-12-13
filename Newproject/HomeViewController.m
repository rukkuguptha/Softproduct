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

}



-(void)customerpage{
    if (!self.custmrVCtrl) {
        self.custmrVCtrl=[[CustomerViewController alloc]initWithNibName:@"CustomerViewController" bundle:nil];
    }
    [self.navigationController pushViewController:_custmrVCtrl animated:YES];
    
}
-(void)LeadPage
{
    if (!self.leadVCtrl) {
        self.leadVCtrl=[[LeadsViewController alloc]initWithNibName:@"LeadsViewController" bundle:nil];
    }
    [self.navigationController pushViewController:_leadVCtrl animated:YES];
    

}
-(void)companyPage
{
    if (!self.cmpanyctrl) {
        self.cmpanyctrl=[[CompanyViewController alloc]initWithNibName:@"CompanyViewController" bundle:nil];
    }
    _cmpanyctrl.modalPresentationStyle = UIModalPresentationPageSheet;
    [self presentViewController:_cmpanyctrl
                       animated:YES completion:NULL];
    
    
}
-(void)hrpage{
    if (!self.hrVCtrl) {
        self.hrVCtrl=[[HRViewController alloc]initWithNibName:@"HRViewController" bundle:nil];
    }
  
    [self.navigationController pushViewController:_hrVCtrl animated:YES];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
