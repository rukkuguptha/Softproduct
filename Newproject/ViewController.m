//
//  ViewController.m
//  Newproject
//
//  Created by GMSIndia1 on 6/14/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSString*newstring=@"newname";
      NSString*astring=@"kontract360.com/service.asmx";


   NSString*one=[NSString stringWithFormat:@"%@.%@", newstring , astring];
    NSLog(@"%@",one);
    // self.navigationController.navigationBar.tintColor=[UIColor blackColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginbtn:(id)sender {
    if (!self.hmeVCtrl) {
        self.hmeVCtrl=[[HomeViewController alloc]initWithNibName:@"HomeViewController" bundle:nil];
    }
    [self.navigationController pushViewController:_hmeVCtrl animated:YES];
}
@end
