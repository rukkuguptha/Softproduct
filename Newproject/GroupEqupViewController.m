//
//  GroupEqupViewController.m
//  Newproject
//
//  Created by GMSIndia1 on 5/23/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "GroupEqupViewController.h"

@interface GroupEqupViewController ()

@end

@implementation GroupEqupViewController

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
    
    self.view.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    _touchview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    _navbar.tintColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _equpmenttable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f].CGColor;
    _equpmenttable.layer.borderWidth=3.0f;
    _crewtable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _crewtable.layer.borderWidth=2.0f;
    UIPanGestureRecognizer* panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanning:)];
    panGesture.delegate=self;
    [self.touchview addGestureRecognizer:panGesture];

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
   // [self setupSourceTableWithFrame:CGRectMake(0, 0, 266,610)];
  //  [self setupDestinationTableWithFrame:CGRectMake(0, 0, 460, 533)];
    
    
  //  [self AllSkills];
    
}
#pragma mark-Popover
-(void)createpopover{
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 200, 120)];
    
    popoverView.backgroundColor = [UIColor whiteColor];
    _popOverTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 200, 120)];
    
    _popOverTableView.delegate=(id)self;
    _popOverTableView.dataSource=(id)self;
    _popOverTableView.rowHeight= 32;
    _popOverTableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    
    
    // CGRect rect = frame;
    [popoverView addSubview:_popOverTableView];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(200, 120);
    
    //create a popover controller
    
    self.popOverController = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    
    //
    //    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    //    CGRect rect=CGRectMake(cell.bounds.origin.x+90, cell.bounds.origin.y+10, 50, 30);
    //    [self.popOverController presentPopoverFromRect:_disclsurelbl.bounds inView:self.view permittedArrowDirections:nil animated:YES];
    
    
    
    
    
    
    [self.popOverController presentPopoverFromRect:_servicebtnlbl.frame
                                            inView:self.view
                          permittedArrowDirections:UIPopoverArrowDirectionUp
                                          animated:YES];
    
    
}
-(void)createcrewpopover{
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 200, 120)];
    
    popoverView.backgroundColor = [UIColor whiteColor];
    _popOverTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 200, 120)];
    
    _popOverTableView.delegate=(id)self;
    _popOverTableView.dataSource=(id)self;
    _popOverTableView.rowHeight= 32;
    _popOverTableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    
    
    // CGRect rect = frame;
    [popoverView addSubview:_popOverTableView];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(200, 120);
    
    //create a popover controller
    
    self.popOverController = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    
    //
    //    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    //    CGRect rect=CGRectMake(cell.bounds.origin.x+90, cell.bounds.origin.y+10, 50, 30);
    //    [self.popOverController presentPopoverFromRect:_disclsurelbl.bounds inView:self.view permittedArrowDirections:nil animated:YES];
    
    
    
    
    
    
    [self.popOverController presentPopoverFromRect:_crewbtnlbl.frame
                                            inView:self.view
                          permittedArrowDirections:UIPopoverArrowDirectionUp
                                          animated:YES];
    
    
}

#pragma mark-tableview datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if (tableView==_popOverTableView) {
        switch (poptype) {
            case 1:
                return [_skillarray count];
                break;
            case 2:
                return [_crenamearray count];
                break;
                
            default:
                break;
        }
        
        
        
        
    }
    
    if (tableView==_equpmenttable) {
        return [_equipmentarray count];
        
        
    }
    if (tableView==_crewtable) {
        
        return [_crewmembersarray count];
        
    }
    
    return YES;
    
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
        if (tableView==_equpmenttable) {
            [[NSBundle mainBundle]loadNibNamed:@"Cmanpwrcell" owner:self options:nil];
            //cell=_manpwrcell;
            
        }
        if (tableView==_crewtable) {
            [[NSBundle mainBundle]loadNibNamed:@"Namecrewcell" owner:self options:nil];
            
            //cell=_crewnamecell;
        }
        
        cell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12];
        
    }
    
    
    if (tableView==_popOverTableView) {
        switch (poptype) {
            case 1:
                cell.textLabel.text = [_skillarray objectAtIndex:indexPath.row];
                break;
            case 2:
                cell.textLabel.text = [_crenamearray objectAtIndex:indexPath.row];
                break;
            default:
                break;
        }
        
        
        
        
    }
    
    
    if (tableView==_equpmenttable) {
//        Manpwr *manpwr=(Manpwr *)[_manpwrarray objectAtIndex:indexPath.row];
//        _manpwritmlbl=(UILabel *)[cell viewWithTag:1];
//        _manpwritmlbl.text=manpwr.itemcode;
//        _manpwrdeslbl=(UILabel *)[cell viewWithTag:2];
//        _manpwrdeslbl.text=manpwr.itemdescptn;
//        _hurlyratelbl=(UILabel *)[cell viewWithTag:3];
//        _hurlyratelbl.text=manpwr.unitcost;
        
    }
    
    if (tableView==_crewtable) {
        
//        Crewmodel *crewmdl1=(Crewmodel *)[_crewmembersarray objectAtIndex:indexPath.row];
//        _crwmanpwrlbl=(UILabel *)[cell viewWithTag:1];
//        _crwmanpwrlbl.text=crewmdl1.manpower;
//        _crwdeslbl1=(UILabel *)[cell viewWithTag:2];
//        _crwdeslbl1.text=crewmdl1.mandescptn;
//        _crwdeslbl2=(UILabel *)[cell viewWithTag:3];
//        
//        
//        _crwdeslbl2.text=[_revcrewdict objectForKey:crewmdl1.crewname];
        
        
    }
    return cell;
}
#pragma mark UITableViewDelegate methods
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle==UITableViewCellEditingStyleDelete) {
        Deletepath=indexPath.row;
        
        if (tableView==_crewtable) {
            //[self Crewdelete];
            // [_crewmembersarray removeObject:indexPath];
            
        }
        
    }
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (tableView==_popOverTableView) {
        switch (poptype) {
            case 1:
                
                [_servicebtnlbl setTitle:[_skillarray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
                //[self CrewManPowerSelect];
                break;
            case 2:
                
                [_crewbtnlbl setTitle:[_crenamearray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
               // [self Selectcrewname];
                break;
                
            default:
                break;
        }
        
        [self.popOverController dismissPopoverAnimated:YES];
        
        
        
    }
    
    
}

@end
