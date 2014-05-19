//
//  DrawingViewController.m
//  Newproject
//
//  Created by GMSIndia1 on 5/19/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "DrawingViewController.h"

@interface DrawingViewController ()

@end

@implementation DrawingViewController

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
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    
    
    
    
    
    
    
    btnclick=0;
    
    // Do any additional setup after loading the view from its nib.
    red = 0.0/255.0;
    green = 0.0/255.0;
    blue = 0.0/255.0;
    brush = 15.0;
    opacity = 1.0;
    
    _mylineview = [[MyLineDrawingView alloc] initWithFrame:CGRectMake(0, 0, 768, 954)];
    _mylineview.backgroundColor=[UIColor clearColor];
    _mylineview.delegate = self;
    _mylineview.brushPattern=[UIColor colorWithRed:102.0/255.0 green:255.0/255.0 blue:0.0/255.0 alpha:1];
    [self.newview addSubview:_mylineview];

}
-(void)viewDidLayoutSubviews{
    myPath=[[UIBezierPath alloc]init];
    myPath.lineCapStyle=kCGLineCapRound;
    myPath.miterLimit=0;
    myPath.lineWidth=6;
    
    
    
}
- (void)viewDidUnload
{
    [self setMainimg:nil];
    [self setTempimg:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clsebtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)deletebtn:(id)sender {
    [self.mylineview removeFromSuperview];
    _mylineview = [[MyLineDrawingView alloc] initWithFrame:CGRectMake(0, 0, 768, 954)];
    _mylineview.backgroundColor=[UIColor clearColor];
    [self.newview addSubview:_mylineview];

}
@end
