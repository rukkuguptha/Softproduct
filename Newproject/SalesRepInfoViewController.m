//
//  SalesRepInfoViewController.m
//  Newproject
//
//  Created by GMSIndia 2 on 20/06/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import "SalesRepInfoViewController.h"

@interface SalesRepInfoViewController ()

@end

@implementation SalesRepInfoViewController

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
   // self.navbar.tintColor=[UIColor colorWithRed:227.0/255.0f green:240.0/255.0f blue:247.0/255.0f alpha:1.0f];
    _salesRepTable.layer.borderWidth=2;
    _salesRepTable.layer.borderColor= [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    
    
//    UIBarButtonItem*addbtn=[[UIBarButtonItem alloc]initWithTitle:@"Add" style:UIBarButtonItemStylePlain target:self action:@selector(addaction)];
//    UIBarButtonItem*editbtn=[[UIBarButtonItem alloc]initWithTitle:@"Delete" style:UIBarButtonItemStylePlain target:self action:@selector(editaction)];
//    NSArray*barbutns=[[NSArray alloc]initWithObjects:addbtn,editbtn, nil];
//    [self.navigationItem setRightBarButtonItems:barbutns animated:YES];
//    _addView.hidden=YES;
    
    
}
-(void)editaction
{
    if ([self.salesRepTable isEditing]) {
        // If the tableView is already in edit mode, turn it off. Also change the title of the button to reflect the intended verb (‘Edit’, in this case).
        
        [self.salesRepTable setEditing:NO animated:YES];
        //[_Editbtn setTitle:@"Edit"forState:UIControlStateNormal];
    }
    else {
        // [_Editbtn setTitle:@"Done"forState:UIControlStateNormal];
        
        // Turn on edit mode
        
        [self.salesRepTable setEditing:YES animated:YES];
    }
    
}

//-(void)addaction
//{
//    _addView.hidden=NO;
//}
//- (IBAction)editcellbtn:(id)sender
//{
//    _addView.hidden=NO;
//}
-(IBAction)closetheView:(id)sender
{
    self.addView.hidden=YES;
   
}
- (IBAction)editsalesaction:(id)sender
{
    _addView.hidden=NO;
    _navbar.title=@"EDIT";
    optionidentifier=2;
}
- (IBAction)addsalesaction:(id)sender
{
    _addView.hidden=NO;
     _navbar.title=@"ADD";
    optionidentifier=1;
}
- (IBAction)deletesalesaction:(id)sender
{
    if ([self.salesRepTable isEditing]) {
        // If the tableView is already in edit mode, turn it off. Also change the title of the button to reflect the intended verb (‘Edit’, in this case).
        
        [self.salesRepTable setEditing:NO animated:YES];
        //[_Editbtn setTitle:@"Edit"forState:UIControlStateNormal];
    }
    else {
        // [_Editbtn setTitle:@"Done"forState:UIControlStateNormal];
        
        // Turn on edit mode
        
        [self.salesRepTable setEditing:YES animated:YES];
    }
 
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


- (IBAction)closesalesreppage:(id)sender {
    [self dismissViewControllerAnimated:YES completion:NULL];
}
@end
