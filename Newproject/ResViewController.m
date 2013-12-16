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

}

-(void)manpwrpage{
    if (!self.manVCtrl) {
        _manVCtrl=[[ManViewController alloc]initWithNibName:@"ManViewController" bundle:nil];
    }
    _manVCtrl.modalPresentationStyle = UIModalPresentationPageSheet;

    [self presentViewController:_manVCtrl
                       animated:YES completion:NULL];
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
