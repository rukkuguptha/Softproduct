//
//  jobdetailsViewController.m
//  Newproject
//
//  Created by GMSIndia 2 on 02/01/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "jobdetailsViewController.h"

@interface jobdetailsViewController ()

@end

@implementation jobdetailsViewController

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
    _jobdetailstable.layer.borderWidth = 2.0;
    _jobdetailstable.layer.borderColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _titleview.backgroundColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    

    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)closejobdetails:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}
-(IBAction)editjobdetails:(id)sender
{
    _editview.hidden=NO;
}
-(IBAction)closeeditview:(id)sender
{
    _editview.hidden=YES;
}
-(IBAction)deletejobdetails:(id)sender
{
    if(self.editing)
    {
        [super setEditing:NO animated:NO];
        [_jobdetailstable setEditing:NO animated:NO];
        [_jobdetailstable reloadData];
    }
    else
    {
        [super setEditing:YES animated:YES];
        [_jobdetailstable setEditing:YES animated:YES];
        [_jobdetailstable reloadData];
    }
}
-(IBAction)craftcheckaction:(id)sender
{
    if (craft==0) {
        [_checkcraftbtn setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        craft=1;
        
    }
    
    else{
        [_checkcraftbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
         craft=0;
        
    }
}
-(IBAction)selectcraft:(id)sender
{

    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 150, 200)];
    
    popoverView.backgroundColor = [UIColor lightTextColor];
    _popOverTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 150, 200)];
    _popOverTableView.delegate=(id)self;
    _popOverTableView.dataSource=(id)self;
    _popOverTableView.rowHeight= 32;
    _popOverTableView.separatorColor=[UIColor cyanColor];
    
    [popoverView addSubview:_popOverTableView];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(150, 200);
    
    //create a popover controller
    self.popOverController = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    [self.popOverController presentPopoverFromRect:_craftbtn.frame
                                            inView:self.editview
                          permittedArrowDirections:UIPopoverArrowDirectionDown
                                          animated:YES];

}

#pragma mark-tableview datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        [[NSBundle mainBundle]loadNibNamed:@"customdetlcell" owner:self options:nil];
        cell=_jobdetailscell;
       
    }
    
    return cell;
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle==UITableViewCellEditingStyleDelete) {
        path=indexPath.row;
        
        //        [self DeleteServices];
        //        [_servicelistarray removeObject:indexPath];
        
        
        
        
        
    }
    
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //alternating cell back ground color
    if(tableView==_jobdetailstable)
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
