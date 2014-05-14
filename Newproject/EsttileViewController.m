//
//  EsttileViewController.m
//  Newproject
//
//  Created by GMSIndia1 on 5/9/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "EsttileViewController.h"

@interface EsttileViewController ()

@end

@implementation EsttileViewController

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
                                         action:@selector(newestpage)];
    doubleTap.numberOfTapsRequired=1;
    doubleTap.delegate=(id)self;
    [self.estimteview addGestureRecognizer:doubleTap];
    
    UITapGestureRecognizer *doubleTap1 = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(bidpage)];
    doubleTap1.numberOfTapsRequired=1;
    doubleTap1.delegate=(id)self;
    [self.bidsview addGestureRecognizer:doubleTap1];

}


-(void)newestpage{
    if (!self.EHVctrl) {
        self.EHVctrl=[[EstimationViewController alloc]initWithNibName:@"EstimationViewController" bundle:nil];
    }
    _EHVctrl.modalPresentationStyle=UIModalPresentationPageSheet;
    _EHVctrl.modalTransitionStyle=UIModalTransitionStyleCoverVertical;
    [self presentViewController:_EHVctrl
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
