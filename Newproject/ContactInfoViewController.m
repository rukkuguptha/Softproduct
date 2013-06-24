//
//  ContactInfoViewController.m
//  Newproject
//
//  Created by GMSIndia 2 on 20/06/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import "ContactInfoViewController.h"

@interface ContactInfoViewController ()

@end

@implementation ContactInfoViewController

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
    _scroll.frame=CGRectMake(0, 0, 1024,708);
    [_scroll setContentSize:CGSizeMake(1024,760)];
    _infoview.backgroundColor=[UIColor colorWithRed:227.0/255.0f green:240.0/255.0f blue:247.0/255.0f alpha:1.0f];
     self.navbar.tintColor=[UIColor colorWithRed:227.0/255.0f green:240.0/255.0f blue:247.0/255.0f alpha:1.0f];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    
    
    UIBarButtonItem*addbtn=[[UIBarButtonItem alloc]initWithTitle:@"Add" style:UIBarButtonItemStylePlain target:self action:@selector(addaction)];
    UIBarButtonItem*editbtn=[[UIBarButtonItem alloc]initWithTitle:@"Delete" style:UIBarButtonItemStylePlain target:self action:@selector(editaction)];
    NSArray*barbutns=[[NSArray alloc]initWithObjects:addbtn,editbtn, nil];
    [self.navigationItem setRightBarButtonItems:barbutns animated:YES];
    _addview.hidden=YES;
    
    
}
-(void)editaction
{
    if ([self.contactinfoTable isEditing]) {
        // If the tableView is already in edit mode, turn it off. Also change the title of the button to reflect the intended verb (‘Edit’, in this case).
        
        [self.contactinfoTable setEditing:NO animated:YES];
        //[_Editbtn setTitle:@"Edit"forState:UIControlStateNormal];
    }
    else {
        // [_Editbtn setTitle:@"Done"forState:UIControlStateNormal];
        
        // Turn on edit mode
        
        [self.contactinfoTable setEditing:YES animated:YES];
    }
    
}

-(void)addaction
{
    _addview.hidden=NO;
}
- (IBAction)editcellbtn:(id)sender
{
    _addview.hidden=NO;
}
-(IBAction)closetheView:(id)sender
{
    self.addview.hidden=YES;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
    // Return the number of rows in the section.
   }
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
//        if(tableView==_customertable)
//        {
//            [[NSBundle mainBundle]loadNibNamed:@"Customercell" owner:self options:nil];
//            cell=_customercell;
//            
//            
//        }
    }
    //cell.textLabel.text=@"Customer Name";
//    if(tableView==_popOverTableView)
//    {  cell.textLabel.font = [UIFont fontWithName:@"Helvetica Neue Light" size:12];
//        cell.textLabel.font = [UIFont systemFontOfSize:12.0];
//        cell.textLabel.text=[_popoverArry objectAtIndex:indexPath.row];
//    }
//    if(tableView==_customertable)
//    {
//        
//    }
    
    
    
    
    
    return cell;
    
    
}
-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    
    
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //alternating cell back ground color
    if (indexPath.row%2 == 0) {
        [cell setBackgroundColor:[UIColor whiteColor]];
        
        
    }else
    {
        
        //[cell setBackgroundColor:[UIColor colorWithRed:247.0/255.0f green:247.0/255.0f blue:247.0/255.0f alpha:1.0f]];
        [cell setBackgroundColor:[UIColor colorWithRed:227.0/255.0f green:240.0/255.0f blue:247.0/255.0f alpha:1.0f]];
    }
}
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if (tableView==_customertable) {
//        // CGRect frame = [_popOverTableView cellForRowAtIndexPath:indexPath].frame;
//        // poptype=5;
//        UIViewController* popoverContent = [[UIViewController alloc]
//                                            init];
//        
//        UIView* popoverView = [[UIView alloc]
//                               initWithFrame:CGRectMake(0, 0, 120, 70)];
//        
//        popoverView.backgroundColor = [UIColor whiteColor];
//        _popOverTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 120, 70)];
//        
//        _popOverTableView.delegate=(id)self;
//        _popOverTableView.dataSource=(id)self;
//        _popOverTableView.rowHeight= 32;
//        _popOverTableView.separatorStyle=UITableViewCellSeparatorStyleSingleLineEtched;
//        
//        
//        // CGRect rect = frame;
//        [popoverView addSubview:_popOverTableView];
//        popoverContent.view = popoverView;
//        
//        //resize the popover view shown
//        //in the current view to the view's size
//        popoverContent.contentSizeForViewInPopover = CGSizeMake(120, 70);
//        
//        //create a popover controller
//        
//        self.popOverController = [[UIPopoverController alloc]
//                                  initWithContentViewController:popoverContent];
//        
//        
//        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//        CGRect rect=CGRectMake(cell.bounds.origin.x+90, cell.bounds.origin.y+10, 50, 30);
//        [self.popOverController presentPopoverFromRect:rect inView:cell permittedArrowDirections:nil animated:YES];
//        
//        //    [self.popOverController presentPopoverFromRect:rect
//        //                                            inView:self.leadTable
//        //                          permittedArrowDirections:UIPopoverArrowDirectionLeft
//        //                                          animated:YES];
//        //
//        //  [self MenuAction];
//    }
//    
//    if (tableView==_popOverTableView) {
//        if (indexPath.row==0) {
//            if (!self.cntctVctrl) {
//                self.cntctVctrl=[[ContactInfoViewController alloc]initWithNibName:@"ContactInfoViewController" bundle:nil];
//            }
//            [self.navigationController pushViewController:self.cntctVctrl animated:YES];
//            
//        }
//        
//        if (indexPath.row==1) {
//            
//            if (!self.salesVCtrl) {
//                self.salesVCtrl=[[SalesRepInfoViewController alloc]initWithNibName:@"SalesRepInfoViewController" bundle:nil];
//            }
//            [self.navigationController pushViewController:self.salesVCtrl animated:YES];
//            
//            
//            
//        }
//        
//        [self.popOverController dismissPopoverAnimated:YES];
//        
//        
//        
//    }
//    
//}


@end
