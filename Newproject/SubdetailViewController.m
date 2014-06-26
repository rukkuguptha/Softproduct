//
//  SubdetailViewController.m
//  Newproject
//
//  Created by GMSIndia 2 on 26/06/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "SubdetailViewController.h"

@interface SubdetailViewController ()

@end

@implementation SubdetailViewController

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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)closethispage:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
