//
//  AllfolderViewController.m
//  Newproject
//
//  Created by GMSIndia 2 on 17/12/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import "AllfolderViewController.h"

@interface AllfolderViewController ()

@end

@implementation AllfolderViewController

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
-(IBAction)closefolderview:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}


@end
