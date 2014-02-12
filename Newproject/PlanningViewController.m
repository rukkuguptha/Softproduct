//
//  PlanningViewController.m
//  Newproject
//
//  Created by GMSIndia1 on 2/12/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "PlanningViewController.h"

@interface PlanningViewController ()

@end

@implementation PlanningViewController

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
     _titleview.backgroundColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _tabletitleview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _plangtable.layer.borderWidth=2.0f;
    _plangtable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark-Tableview
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(tableView==_plangtable)
    {
    return 5;
    }
    if(tableView==_popovertableview)
    {
        switch (poptype) {
            case 1:
                [_customerlistarray count];
                break;
                case 2:
                [_leadlistarray count];
                break;
                
            default:
                break;
        }
    }
    return YES;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellidentifier=@"mycell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellidentifier];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellidentifier];
    }
    if(tableView==_popovertableview)
    {
        switch (poptype) {
            case 1:
                cell.textLabel.text=[_customerlistarray objectAtIndex:indexPath.row];
                break;
            case 2:
                cell.textLabel.text=[_leadlistarray objectAtIndex:indexPath.row];
            default:
                break;
        }
    }
    cell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12];
    
    cell.textLabel.text=[NSString stringWithFormat:@"\t\t\tcompany"];
    return cell;
    
}





#pragma mark-Button Actions
- (IBAction)clseVCtrlbtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)addplan:(id)sender {
    _addplanview.hidden=NO;
}
-(IBAction)closeaddview:(id)sender
{
    _addplanview.hidden=YES;
    
}
-(IBAction)checkleadaction:(id)sender
{
    if(leadcheck==0)
    {
        [_leadcheckbtn setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        leadcheck=1;
        _customerselectionBtn.enabled=NO;
        
    }
    else
    {
        [_leadcheckbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        leadcheck=0;
        _customerselectionBtn.enabled=YES;
    }
    
}
-(IBAction)checkcustomeraction:(id)sender
{
    if(customercheck==0)
    {
        [_custcheckbtn setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        customercheck=1;
        _leadselectionBtn.enabled=NO;
    }
    else
    {
        [_custcheckbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        customercheck=0;
        _leadselectionBtn.enabled=YES;
    }
    
}
-(IBAction)selectcustomer:(id)sender
{
    poptype=1;
    UIViewController *popovercontent=[[UIViewController alloc]init];
    UIView *popoverview=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 160, 90)];
    popoverview.backgroundColor=[UIColor whiteColor];
    _popovertableview=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 160, 90)];
    _popovertableview.delegate=(id)self;
    _popovertableview.dataSource=(id)self;
    _popovertableview.rowHeight=32;
    _popovertableview.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    [popoverview addSubview:_popovertableview];
    popovercontent.view=popoverview;
    popovercontent.contentSizeForViewInPopover=CGSizeMake(160, 90);
    self.popovercontroller=[[UIPopoverController alloc]initWithContentViewController:popovercontent];
    [self.popovercontroller presentPopoverFromRect:_customerselectionBtn.frame inView:_addplanview permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
    
    
    
}
-(IBAction)selectlead:(id)sender
{
    poptype=2;
    UIViewController *popovercontent=[[UIViewController alloc]init];
    UIView *popoverview=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 160, 90)];
    popoverview.backgroundColor=[UIColor whiteColor];
    _popovertableview=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 160, 90)];
    _popovertableview.delegate=(id)self;
    _popovertableview.dataSource=(id)self;
    _popovertableview.rowHeight=32;
    _popovertableview.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    [popoverview addSubview:_popovertableview];
    popovercontent.view=popoverview;
    popovercontent.contentSizeForViewInPopover=CGSizeMake(160, 90);
    self.popovercontroller=[[UIPopoverController alloc]initWithContentViewController:popovercontent];
    [self.popovercontroller presentPopoverFromRect:_leadselectionBtn.frame inView:_addplanview permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
    
    
    
}



@end
