//
//  InOutSiteViewController.m
//  Newproject
//
//  Created by GMSIndia 2 on 12/06/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "InOutSiteViewController.h"

@interface InOutSiteViewController ()

@end

@implementation InOutSiteViewController

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
    [[self.notetextview layer] setBorderColor:[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor];
    [[self.notetextview layer] setBorderWidth:2];
    [[self.notetextview layer] setCornerRadius:10];
    
    [[self.outnotetextview layer] setBorderColor:[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor];
    [[self.outnotetextview layer] setBorderWidth:2];
    [[self.outnotetextview layer] setCornerRadius:10];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)closethepage:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}
-(IBAction)confirmcheckaction:(id)sender
{
    if(confirmcheck==0)
    {
        
        [_cnfrmbtn setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        
        
        confirmcheck=1;
        
        
    }
    else
    {
        [_cnfrmbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        confirmcheck=0;
        
    }

}
-(IBAction)tojobsiteaction:(id)sender
{
    UIViewController *popovercontent=[[UIViewController alloc]init];
    UIView *popoverview=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 210, 120)];
    popoverview.backgroundColor=[UIColor whiteColor];
    _popovertableview=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 210, 120)];
    _popovertableview.delegate=(id)self;
    _popovertableview.dataSource=(id)self;
    _popovertableview.rowHeight=32;
    _popovertableview.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    [popoverview addSubview:_popovertableview];
    popovercontent.view=popoverview;
    popovercontent.contentSizeForViewInPopover=CGSizeMake(210, 120);
    self.popovercontroller=[[UIPopoverController alloc]initWithContentViewController:popovercontent];
    [self.popovercontroller presentPopoverFromRect:_tojobbtn.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
    
    
 
}
-(IBAction)outconfirmcheckaction:(id)sender
{
    if(outconfirmcheck==0)
    {
        
        [_outcnfrmbtn setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        
        
        outconfirmcheck=1;
        
        
    }
    else
    {
        [_outcnfrmbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        outconfirmcheck=0;
        
    }

}
#pragma mark-Tableview
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    // Return the number of rows in the section.
    if(tableView==_popovertableview)
        
    {
        return 5;
    }
    
    return YES;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    if(tableView==_popovertableview)
    {  cell.textLabel.font = [UIFont fontWithName:@"Helvetica Neue Light" size:12];
        cell.textLabel.font = [UIFont systemFontOfSize:12.0];
      
                //cell.textLabel.text=[_statearray objectAtIndex:indexPath.row];
        
                
        
        }
    
    
    
    
    
    
    
    
    
    return cell;
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (tableView==_popovertableview) {
        
        
       
        
        
        
    }
    [self.popovercontroller dismissPopoverAnimated:YES];
    
}





@end
