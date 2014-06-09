//
//  MovementtileViewController.m
//  Newproject
//
//  Created by GMSIndia1 on 6/9/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "MovementtileViewController.h"

@interface MovementtileViewController ()

@end

@implementation MovementtileViewController

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
                                         action:@selector(labourpage)];
    doubleTap.numberOfTapsRequired=1;
    doubleTap.delegate=(id)self;
    [self.labourview addGestureRecognizer:doubleTap];
    
    UITapGestureRecognizer *doubleTap1 = [[UITapGestureRecognizer alloc]
                                         initWithTarget:self
                                         action:@selector(equpage)];
    doubleTap1.numberOfTapsRequired=1;
    doubleTap1.delegate=(id)self;
    [self.equview addGestureRecognizer:doubleTap1];


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)labourpage{
    
}
-(void)equpage{
    if (!_EquVCtrl) {
        _EquVCtrl=[[EqothersViewController alloc]initWithNibName:@"EqothersViewController" bundle:nil];
    }
    //_EquVCtrl.modalPresentationStyle=UIModalPresentationFormSheet;
   // _EquVCtrl.modalTransitionStyle=UIModalTransitionStyleCoverVertical;
    [self presentViewController:_EquVCtrl
                       animated:YES completion:NULL];

    
}

- (IBAction)clsebtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
