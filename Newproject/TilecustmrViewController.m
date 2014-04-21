//
//  TilecustmrViewController.m
//  Newproject
//
//  Created by GMSIndia1 on 3/11/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "TilecustmrViewController.h"

@interface TilecustmrViewController ()

@end

@implementation TilecustmrViewController

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
    _navgtnbar.tintColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
 self.view.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226.0/255.0f blue:226.0/255.0f alpha:1.0f];
     // _navbar.tintColor=[UIColor blueColor];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc]
                                         initWithTarget:self
                                         action:@selector(customerpage)];
    doubleTap.numberOfTapsRequired=1;
    doubleTap.delegate=(id)self;
    [self.custmrview addGestureRecognizer:doubleTap];
    UITapGestureRecognizer *doubleTap2 = [[UITapGestureRecognizer alloc]
                                         initWithTarget:self
                                         action:@selector(contractpage)];
    doubleTap2.numberOfTapsRequired=1;
    doubleTap2.delegate=(id)self;
    [self.cntrctview addGestureRecognizer:doubleTap2];

    UITapGestureRecognizer *doubleTap3 = [[UITapGestureRecognizer alloc]
                                         initWithTarget:self
                                         action:@selector(markuppage)];
    doubleTap3.numberOfTapsRequired=1;
    doubleTap3.delegate=(id)self;
    [self.markupview addGestureRecognizer:doubleTap3];

    UITapGestureRecognizer *doubleTap4 = [[UITapGestureRecognizer alloc]
                                         initWithTarget:self
                                         action:@selector(billingpage)];
    doubleTap4.numberOfTapsRequired=1;
    doubleTap4.delegate=(id)self;
    [self.billingview addGestureRecognizer:doubleTap4];


}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)customerpage{
    if (!self.custmrVCtrl) {
        self.custmrVCtrl=[[NewCustmrViewController alloc]initWithNibName:@"NewCustmrViewController" bundle:nil];
    }
    //_custmrVCtrl.modalPresentationStyle = UIModalPresentationPageSheet;
    
    [self presentViewController:_custmrVCtrl
                       animated:YES completion:NULL];

    
}
-(void)contractpage{
    if (!self.cntrctVCtrl) {
        self.cntrctVCtrl=[[ContractViewController alloc]initWithNibName:@"ContractViewController" bundle:nil];
    }
    //_custmrVCtrl.modalPresentationStyle = UIModalPresentationPageSheet;
    
    [self presentViewController:_cntrctVCtrl
                       animated:YES completion:NULL];

}
-(void)markuppage{
    if (!self.markVCtrl) {
        self.markVCtrl=[[MarkupViewController alloc]initWithNibName:@"MarkupViewController" bundle:nil];
    }
    //_custmrVCtrl.modalPresentationStyle = UIModalPresentationPageSheet;
    
    [self presentViewController:_markVCtrl
                       animated:YES completion:NULL];
    
}
-(void)billingpage{
    if (!self.billgVCtrl) {
        self.billgVCtrl=[[BillingViewController alloc]initWithNibName:@"BillingViewController" bundle:nil];
    }
    //_billgVCtrl.modalPresentationStyle = UIModalPresentationPageSheet;
    
    [self presentViewController:_billgVCtrl
                       animated:YES completion:NULL];
    
}


- (IBAction)clsebtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
