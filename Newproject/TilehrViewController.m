//
//  TilehrViewController.m
//  Newproject
//
//  Created by GMSIndia1 on 2/4/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "TilehrViewController.h"
@interface TilehrViewController ()

@end

@implementation TilehrViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc]
                                         initWithTarget:self
                                         action:@selector(masterpage)];
    doubleTap.numberOfTapsRequired=1;
    doubleTap.delegate=(id)self;
    [self.masterview addGestureRecognizer:doubleTap];
    
    UITapGestureRecognizer *doubleTap1 = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(processpage)];
    doubleTap1.numberOfTapsRequired=1;
    doubleTap1.delegate=(id)self;
    [self.processview addGestureRecognizer:doubleTap1];
    UITapGestureRecognizer *doubleTap2 = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(managmntPage)];
    doubleTap2.numberOfTapsRequired=1;
    doubleTap2.delegate=(id)self;
    [self.mangmntview addGestureRecognizer:doubleTap2];
    
    UITapGestureRecognizer *doubleTap3 = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(JobPage)];
    doubleTap3.numberOfTapsRequired=1;
    doubleTap3.delegate=(id)self;
    [self.jobview addGestureRecognizer:doubleTap3];
    
    }
-(void)masterpage{
    if (!self.hrVCtrl) {
        self.hrVCtrl=[[HRViewController alloc]initWithNibName:@"HRViewController" bundle:nil];
    }
    
    _hrVCtrl.modalPresentationStyle=UIModalPresentationFullScreen;
    
    [self presentViewController:_hrVCtrl
                       animated:YES completion:NULL];

    
}

-(void)processpage{
    
    if (!self.prcsVCtrl ) {
        self.prcsVCtrl=[[ProcesshrViewController alloc]initWithNibName:@"ProcesshrViewController" bundle:nil];
    }
    
        self.prcsVCtrl.modalPresentationStyle=UIModalPresentationFullScreen;
    
    [self presentViewController:self.prcsVCtrl
                       animated:YES completion:NULL];
    

    
}
-(void)managmntPage{
    
    if (!self.mgmtVCtrl ) {
        self.mgmtVCtrl=[[EmplyhrmgntViewController alloc]initWithNibName:@"EmplyhrmgntViewController" bundle:nil];
    }
    
    self.mgmtVCtrl.modalPresentationStyle=UIModalPresentationPageSheet;
    
    [self presentViewController:self.mgmtVCtrl
                       animated:YES completion:NULL];
    
    
    
}
-(void)JobPage{
    
    if (!self.EmpVCtrl ) {
        self.EmpVCtrl=[[EmpJobViewController alloc]initWithNibName:@"EmpJobViewController" bundle:nil];
    }
    
   // self.EmpVCtrl.modalPresentationStyle=UIModalPresentationPageSheet;
    
    [self presentViewController:self.EmpVCtrl
                       animated:YES completion:NULL];
    
    
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)closebtnactn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:NULL];

}
@end
