//
//  CalEventDetailViewController.m
//  Newproject
//
//  Created by GMSIndia 2 on 28/05/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "CalEventDetailViewController.h"

@interface CalEventDetailViewController ()

@end

@implementation CalEventDetailViewController

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
    _mattitleview.backgroundColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _mantitleview.backgroundColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _summarytitleview.backgroundColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _calmanpwrtable.layer.borderWidth = 2.0;
    _calmanpwrtable.layer.borderColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _sumtable.layer.borderWidth = 2.0;
    _sumtable.layer.borderColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    tooltype=1;
    _mantitleview.hidden=NO;
    _mattitleview.hidden=YES;
    _summarytitleview.hidden=YES;
    _sumtable.hidden=YES;

    // Do any additional setup after loading the view from its nib.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    tooltype=1;
    _mantitleview.hidden=NO;
    _mattitleview.hidden=YES;
    _summarytitleview.hidden=YES;
      _sumtable.hidden=YES;
    [_calmanpwrtable reloadData];
    _calmanpwrtable.hidden=NO;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)clsebtn:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}
- (IBAction)manpoweraction:(id)sender
{
    tooltype=1;
    _mantitleview.hidden=NO;
    _mattitleview.hidden=YES;
    _summarytitleview.hidden=YES;
    _sumtable.hidden=YES;
    [_calmanpwrtable reloadData];
    _calmanpwrtable.hidden=NO;
    
}
- (IBAction)equipmentaction:(id)sender
{
    tooltype=2;
    _mantitleview.hidden=YES;
    _summarytitleview.hidden=YES;
    _mattitleview.hidden=NO;
    _sumtable.hidden=YES;
    _calmanpwrtable.hidden=NO;
    [_calmanpwrtable reloadData];
}
- (IBAction)materialaction:(id)sender
{
    tooltype=3;
    _mantitleview.hidden=YES;
    _summarytitleview.hidden=YES;
    _mattitleview.hidden=NO;
    _sumtable.hidden=YES;
    _calmanpwrtable.hidden=NO;
    [_calmanpwrtable reloadData];
}
- (IBAction)summaryaction:(id)sender
{
    tooltype=4;
    _mantitleview.hidden=YES;
    _mattitleview.hidden=YES;
    _summarytitleview.hidden=NO;
    _calmanpwrtable.hidden=YES;
    _sumtable.hidden=NO;
}

#pragma mark-tableview datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView==_calmanpwrtable) {
        if (tooltype==1) {
            
            return 5;
           }
        if (tooltype==2) {
            
            return 1;
        }
        if (tooltype==3) {
            
            return 3;
        }
    }
    if (tableView==_sumtable) {
      //  if (tooltype==4) {
            
            return 5;
       // }
    }
    
    return YES;
    
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
        if (tableView==_calmanpwrtable) {
            if (tooltype==1) {
                [[NSBundle mainBundle]loadNibNamed:@"Eventcalcell" owner:self options:nil];
                cell=_calmanpwrcell;
            }
            if (tooltype==2) {
                [[NSBundle mainBundle]loadNibNamed:@"Matcalevecell" owner:self options:nil];
                cell=_calmaterialcell;
            }
            if (tooltype==3) {
                [[NSBundle mainBundle]loadNibNamed:@"Matcalevecell" owner:self options:nil];
                cell=_calmaterialcell;
            }
           
            
        }
        if (tableView==_sumtable)
        {
           // if (tooltype==4) {
                [[NSBundle mainBundle]loadNibNamed:@"Sumcell" owner:self options:nil];
                cell=_sumcell;
            //}
        }
        
        cell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12];
        
    }
    
    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //alternating cell back ground color
    if(tableView==_calmanpwrtable||(tableView==_sumtable))
    {
        if (indexPath.row%2 == 0) {
            [cell setBackgroundColor:[UIColor whiteColor]];
            
        }else
        {
            
            //[cell setBackgroundColor:[UIColor colorWithRed:247.0/255.0f green:247.0/255.0f blue:247.0/255.0f alpha:1.0f]];
            [cell setBackgroundColor:[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f]];
            
            
        }
    }
}



@end
