//
//  StockViewController.m
//  Newproject
//
//  Created by GMSIndia1 on 6/12/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "StockViewController.h"

@interface StockViewController ()

@end

@implementation StockViewController

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
    [[self.notestxtview layer] setBorderColor:[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor];
    [[self.notestxtview layer] setBorderWidth:2.3];
    [[self.notestxtview layer] setCornerRadius:10];
    [[self.notes1txtview layer] setBorderColor:[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor];
    [[self.notes1txtview layer] setBorderWidth:2.3];
    [[self.notes1txtview layer] setCornerRadius:10];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)thirdbtn:(id)sender {
    btnclck1++;
    if (btnclck1%2!=0) {
        [_thirdbtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        
    }
    else
    {
        [_thirdbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        
    }

}

- (IBAction)confirmbtn:(id)sender {
    btnclck++;
    if (btnclck%2!=0) {
        [_confirmcheckbtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
       
    }
    else
    {
        [_confirmcheckbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        
    }

}

- (IBAction)savebtn:(id)sender {
}

- (IBAction)confirm1btnlbl:(id)sender {
    btnclck2++;
    if (btnclck2%2!=0) {
        [_confirmlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        
    }
    else
    {
        [_confirmlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        
    }

}

- (IBAction)save1btn:(id)sender {
}

- (IBAction)closebtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
