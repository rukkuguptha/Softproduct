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
    _titleview.backgroundColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    
    _biddistable.layer.borderWidth = 2.0;
    _biddistable.layer.borderColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;

    self.openviewindex=NSNotFound;
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
#pragma mark-tableview datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
        [[NSBundle mainBundle]loadNibNamed:@"Tblebidcell" owner:self options:nil];
        cell=_tcell;
        
    }
    
    cell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12];
    
    carbutton=[UIButton buttonWithType:UIButtonTypeCustom];
    [carbutton setImage:[UIImage imageNamed:@"carat"] forState:UIControlStateNormal];
    carbutton.tag=indexPath.row;
    [carbutton addTarget:self action:@selector(showactions:) forControlEvents:UIControlEventTouchUpInside];
    carbutton.frame = CGRectMake(120.0, 1.0, 50.0, 40.0);
    [cell.contentView addSubview:carbutton];

    
    
    return cell;
}
-(void)showactions:(UIButton*)sender{
    button = (UIButton *)sender;
    // UITableViewCell *cell = (UITableViewCell *)[[button superview] superview];
    CGPoint center= button.center;
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.biddistable];
    NSIndexPath *textFieldIndexPath = [self.biddistable indexPathForRowAtPoint:rootViewPoint];
    NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
    btnindex=textFieldIndexPath.row;
    if (!self.subvctrl) {
        self.subvctrl=[[SubdetailViewController alloc]initWithNibName:@"SubdetailViewController" bundle:nil];
    }
    
    [self presentViewController:_subvctrl
                       animated:YES completion:NULL];
    
}
-(void)opendetailpage
{
    if (!self.subvctrl) {
        self.subvctrl=[[SubdetailViewController alloc]initWithNibName:@"SubdetailViewController" bundle:nil];
    }
   
    [self presentViewController:_subvctrl
                       animated:YES completion:NULL];

}



- (IBAction)colsethispage:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
