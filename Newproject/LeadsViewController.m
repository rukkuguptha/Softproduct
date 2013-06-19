//
//  LeadsViewController.m
//  Newproject
//
//  Created by GMSIndia1 on 6/14/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import "LeadsViewController.h"

@interface LeadsViewController ()

@end

@implementation LeadsViewController

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
    _scroll.frame=CGRectMake(0, 0, 768,1004);
    [_scroll setContentSize:CGSizeMake(768,1500)];
    _leadTable.layer.borderWidth = 2.0;
    _leadTable.layer.borderColor = [UIColor colorWithRed:210.0/255.0f green:230.0/255.0f blue:450.0/255.0f alpha:1.0f].CGColor;
    self.navigationController.navigationBar.tintColor=[UIColor blackColor];
    self.navbar.tintColor=[UIColor colorWithRed:210.0/255.0f green:230.0/255.0f blue:450.0/255.0f alpha:1.0f];
    _popoverArray=[[NSMutableArray alloc]initWithObjects:@"Activity",@"Follow Up" ,nil];
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(MenuAction)];
//    [_leadName addGestureRecognizer:tap];
    // Do any additional setup after loading the view from its nib.
}






- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    // Return the number of rows in the section.
    if (tableView==_popOverTableView) {
        return [_popoverArray count];
    }
    if (tableView==_leadTable) {
         return 20;
    }
    return YES;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        if (tableView==_leadTable) {
         [[NSBundle mainBundle]loadNibNamed:@"CustomLeadCell" owner:self options:nil];
        
        cell=_leadsTablecell;
        }
        
    }
     //cell.textLabel.text=@"Leads";
    if (tableView==_leadTable) {
    _leadName=(UILabel*)[cell viewWithTag:1];
    

    _leadName.text=@"Valero";
    _imgview=(UIImageView *)[cell viewWithTag:2];
       
    }
    
    if (tableView==_popOverTableView) {
        cell.textLabel.text=[_popoverArray objectAtIndex:indexPath.row];
    }
    return cell;
    
    
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //alternating cell back ground color
    if (indexPath.row%2 == 0) {
        
        [cell setBackgroundColor:[UIColor colorWithRed:210.0/255.0f green:230.0/255.0f blue:450.0/255.0f alpha:1.0f]];
    }else
    {
        
        //[cell setBackgroundColor:[UIColor colorWithRed:247.0/255.0f green:247.0/255.0f blue:247.0/255.0f alpha:1.0f]];
        
        [cell setBackgroundColor:[UIColor whiteColor]];
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
      if (tableView==_leadTable) {
    // CGRect frame = [_popOverTableView cellForRowAtIndexPath:indexPath].frame;
    
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
          
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 120, 70)];
    
    popoverView.backgroundColor = [UIColor whiteColor];
    _popOverTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 120, 70)];
    
    _popOverTableView.delegate=(id)self;
    _popOverTableView.dataSource=(id)self;
    _popOverTableView.rowHeight= 32;
    _popOverTableView.separatorStyle=UITableViewCellSeparatorStyleSingleLineEtched;
   

   // CGRect rect = frame;
    [popoverView addSubview:_popOverTableView];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(120, 70);
    
    //create a popover controller
          
          self.popOverController = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    
  
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    CGRect rect=CGRectMake(cell.bounds.origin.x+90, cell.bounds.origin.y+10, 50, 30);
    [self.popOverController presentPopoverFromRect:rect inView:cell permittedArrowDirections:nil animated:YES];
  
//    [self.popOverController presentPopoverFromRect:rect
//                                            inView:self.leadTable
//                          permittedArrowDirections:UIPopoverArrowDirectionLeft
//                                          animated:YES];
//
  //  [self MenuAction];
      }
    
     if (tableView==_popOverTableView) {
         if (indexPath.row==0) {
             if (!self.activityVCtrl) {
                 self.activityVCtrl=[[ActivityViewController alloc]initWithNibName:@"ActivityViewController" bundle:nil];
             }
             [self.navigationController pushViewController:self.activityVCtrl animated:YES];
             
         }
         
         if (indexPath.row==1) {
             
             if (!self.followupVCtrl) {
                 self.followupVCtrl=[[FollowupViewController alloc]initWithNibName:@"FollowupViewController" bundle:nil];
             }
             [self.navigationController pushViewController:self.followupVCtrl animated:YES];
             
         

         }
         
         [self.popOverController dismissPopoverAnimated:YES];

         
         
     }
    
}
-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
      
    
}


- (IBAction)Addbtn:(id)sender {
    _view2.hidden=NO;
    
}
- (IBAction)clsebtn:(id)sender {
    _view2.hidden=YES;
}
@end
