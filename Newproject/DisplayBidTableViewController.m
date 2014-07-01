//
//  DisplayBidTableViewController.m
//  Newproject
//
//  Created by GMSIndia 2 on 25/06/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "DisplayBidTableViewController.h"

@interface DisplayBidTableViewController ()

@end

@implementation DisplayBidTableViewController

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
    self.view.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
  

  
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}


- (IBAction)colsethispage:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)manpoweraction:(id)sender
{
    tooltype=1;
}
- (IBAction)equipmentaction:(id)sender
{
    tooltype=2;
}
- (IBAction)materialaction:(id)sender
{
    tooltype=3;
}
- (IBAction)otheraction:(id)sender
{
    tooltype=4;
}
- (IBAction)summaryaction:(id)sender
{
    
}
@end
