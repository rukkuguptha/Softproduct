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
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clsebtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
