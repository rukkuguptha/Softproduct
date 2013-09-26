//
//  HRViewController.m
//  Newproject
//
//  Created by GMSIndia1 on 9/24/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import "HRViewController.h"

@interface HRViewController ()

@end

@implementation HRViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title=NSLocalizedString(@"Registered Employees", @"Registered Employees");
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    /*tablewidth*/
    
    _employeestable.layer.borderWidth = 2.0;
    _employeestable.layer.borderColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    
    
    
    /*searchbar*/
    _SearchingBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 220, 44)];
    _SearchingBar.delegate = (id)self;
    _SearchingBar.tintColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    
    self.employeestable.tableHeaderView =_SearchingBar;
    
    UISearchDisplayController* searchController = [[UISearchDisplayController alloc] initWithSearchBar:_SearchingBar contentsController:self];
    searchController.searchResultsDataSource = (id)self;
    searchController.searchResultsDelegate =(id)self;
    searchController.delegate = (id)self;
    
    
    
   /*scroll*/
    
    _scroll.frame=CGRectMake(0, 0, 1004,768);
    [_scroll setContentSize:CGSizeMake(1500,768)];
    
    
    
    
    /*Arrays*/
    _listarray=[[NSMutableArray alloc]initWithObjects:@"vaification details",@"Upload Documents", nil];
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - ButtonActions

- (IBAction)disclurebtn:(id)sender {
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 120, 70)];
    
    popoverView.backgroundColor = [UIColor whiteColor];
    _popOverTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 120, 70)];
    
    _popOverTableView.delegate=(id)self;
    _popOverTableView.dataSource=(id)self;
    _popOverTableView.rowHeight= 32;
    _popOverTableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    
    
    [popoverView addSubview:_popOverTableView];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(120, 70);
    
    //create a popover controller
    
    self.popOverController = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    
       
    UIButton *button = (UIButton *)sender;
    
    UITableViewCell *cell = (UITableViewCell *)[[button superview] superview];
    UITableView *table = (UITableView *)[cell superview];
    NSIndexPath *IndexPath = [table indexPathForCell:cell];
    
   
    
    
    [self.popOverController presentPopoverFromRect:__disclyrebtnlbl.frame
                                            inView:cell
                          permittedArrowDirections:UIPopoverArrowDirectionLeft
                                          animated:YES];
    

}



#pragma mark - Table View
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView==_popOverTableView) {
        return [_listarray count];
    }
    else{
         return 3;
    }
    // Return the number of rows in the section.
    return YES;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
   
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        if (tableView==_employeestable) {
            
        
        [[NSBundle mainBundle]loadNibNamed:@"HRcellview" owner:self options:nil];
        cell=_employeecell;
        }
    }

    if (tableView==_popOverTableView) {
        
        cell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12.0f];

        cell.textLabel.text=[_listarray objectAtIndex:indexPath.row];
    }
    return cell;
}

#pragma mark - Table View delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (tableView==_popOverTableView) {
        
        if (indexPath.row==0) {
            if (!self.verifctnVCtrl) {
                _verifctnVCtrl=[[VerificationViewController alloc]initWithNibName:@"VerificationViewController" bundle:nil];
            }
            [self.popOverController dismissPopoverAnimated:YES];
            [self.navigationController pushViewController:_verifctnVCtrl animated:YES];
            
        }
        if (indexPath.row==1) {
            if (!self.uploadVCtrl) {
                _uploadVCtrl=[[UploadDocViewController alloc]initWithNibName:@"UploadDocViewController" bundle:nil];
            }
            [self.popOverController dismissPopoverAnimated:YES];
            [self.navigationController pushViewController:_uploadVCtrl animated:YES];
            
        }

    }
    
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //alternating cell back ground color
    if(tableView==_employeestable)
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


#pragma mark - SearchBar

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    
}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    
}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    if ([_SearchingBar.text length]==0) {
        
             [searchBar resignFirstResponder];
        
        
    }
    else  if ([_SearchingBar.text length]>0) {
        
        
        
        
        _searchstring=_SearchingBar.text;
        
        
        }
    
    }



@end
