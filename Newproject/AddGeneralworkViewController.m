//
//  AddGeneralworkViewController.m
//  Newproject
//
//  Created by GMSIndia 2 on 21/04/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "AddGeneralworkViewController.h"

@interface AddGeneralworkViewController ()

@end

@implementation AddGeneralworkViewController

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
     self.scroll.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    [[self.destextview layer] setBorderColor:[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor];
    [[self.destextview layer] setBorderWidth:2];
    [[self.destextview layer] setCornerRadius:10];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)closegeneralpage:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

@end
