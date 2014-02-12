//
//  DetailproHrViewController.m
//  Newproject
//
//  Created by GMSIndia 2 on 10/02/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "DetailproHrViewController.h"

@interface DetailproHrViewController ()

@end

@implementation DetailproHrViewController

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
    _detailsaddview.hidden=NO;;
    _detailstabletitleview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
   _documentlisttable.layer.borderColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _doctabletitleview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _documentlisttable.layer.borderWidth=2.0f;

    _maritalarray=[[NSMutableArray alloc]initWithObjects:@"SINGLE",@"MARRIED",@"DIVORCED", nil];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)DetailsBtnAction:(id)sender
{
    _detailsaddview.hidden=NO;
    _w4detailview.hidden=YES;
    _paymentdetailview.hidden=YES;
    _dcmntdetailview.hidden=YES;
}

- (IBAction)DcmntBtnAction:(id)sender
{
    _dcmntdetailview.hidden=NO;
    _w4detailview.hidden=YES;
    _detailsaddview.hidden=YES;
    _paymentdetailview.hidden=YES;
}

- (IBAction)w4BtnAction:(id)sender
{
    _w4detailview.hidden=NO;
     _detailsaddview.hidden=YES;
    _paymentdetailview.hidden=YES;
    _dcmntdetailview.hidden=YES;

}

- (IBAction)paymentbtnaction:(id)sender
{
    _paymentdetailview.hidden=NO;
    _w4detailview.hidden=YES;
    _detailsaddview.hidden=YES;
    _dcmntdetailview.hidden=YES;

}
-(IBAction)editdetails:(id)sender
{
    _editview.hidden=NO;
}
-(IBAction)closeeditview:(id)sender
{
    _editview.hidden=YES;
}


#pragma mark-tableview datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if(tableView==_detailstablview)
    {
         return 5;
    }
    if(tableView==_documentlisttable)
    {
        return 5;
    }
    if (tableView==_popOverTableView) {
        return [_maritalarray count];
    }
    return YES;
   
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        if(tableView==_detailstablview)
        {
            [[NSBundle mainBundle]loadNibNamed:@"proHRDetailcell" owner:self options:nil];
            cell=_detailscell;
        }
        if(tableView==_documentlisttable)
        {
            [[NSBundle mainBundle]loadNibNamed:@"customdoccell" owner:self options:nil];
            cell=_doccell;
        }
    
    if (tableView==_popOverTableView) {
        cell.textLabel.font = [UIFont fontWithName:@"Helvetica Neue Light" size:12];
        cell.textLabel.font = [UIFont systemFontOfSize:12.0];
        cell.textLabel.text=[_maritalarray objectAtIndex:indexPath.row];
    }
    }
    
    return cell;
}

#pragma mark - Table View delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //    if (!self.jbdetailVCtrl) {
    //        self.jbdetailVCtrl=[[jobdetailsViewController alloc]initWithNibName:@"jobdetailsViewController" bundle:nil];
    //    }
    //    _jbdetailVCtrl.modalPresentationStyle = UIModalPresentationPageSheet;
    //    [self presentViewController:_jbdetailVCtrl
    //                       animated:YES completion:NULL];
    
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle==UITableViewCellEditingStyleDelete) {
//        path=indexPath.row;
//        
//        [self DeleteJobSites];
//        [_jobsitelistarray removeObject:indexPath];
        
        
        
        
        
    }
    
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //alternating cell back ground color
    if(tableView==_detailstablview||tableView==_documentlisttable)
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
#pragma mark-Button Action
-(IBAction)selectmaritalstatus:(id)sender
{
    poptype=1;
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 160, 90)];
    
    popoverView.backgroundColor = [UIColor whiteColor];
    _popOverTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 160, 90)];
    
    _popOverTableView.delegate=(id)self;
    _popOverTableView.dataSource=(id)self;
    _popOverTableView.rowHeight= 32;
    _popOverTableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    
    
    [popoverView addSubview:_popOverTableView];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(160, 90);
    
    //create a popover controller
    
    self.popOverController = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    
    
        
    
    
    [self.popOverController presentPopoverFromRect:_maritalbtn.frame
                                            inView:self.w4detailview
                          permittedArrowDirections:UIPopoverArrowDirectionUp
                                          animated:YES];
    

}
-(IBAction)selectpaymenttype:(id)sender
{
    poptype=2;
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 160, 90)];
    
    popoverView.backgroundColor = [UIColor whiteColor];
    _popOverTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 160, 90)];
    
    _popOverTableView.delegate=(id)self;
    _popOverTableView.dataSource=(id)self;
    _popOverTableView.rowHeight= 32;
    _popOverTableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    
    
    [popoverView addSubview:_popOverTableView];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(160, 90);
    
    //create a popover controller
    
    self.popOverController = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    
    
    
    
    
    [self.popOverController presentPopoverFromRect:_paymenttypebtn.frame
                                            inView:self.paymentdetailview
                          permittedArrowDirections:UIPopoverArrowDirectionUp
                                          animated:YES];

}

- (IBAction)detailclsebtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(IBAction)selectfileaction:(id)sender{
    
}
-(IBAction)updatedoc:(id)sender{
    
}
@end
