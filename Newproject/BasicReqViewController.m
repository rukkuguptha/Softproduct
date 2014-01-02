//
//  BasicReqViewController.m
//  Newproject
//
//  Created by GMSIndia 2 on 16/12/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import "BasicReqViewController.h"

@interface BasicReqViewController ()

@end

@implementation BasicReqViewController

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
    _basicreqtable.layer.borderWidth = 2.0;
    _basicreqtable.layer.borderColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _titleview.backgroundColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    /*searchbar*/
    _searchbar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 220, 44)];
    _searchbar.delegate = (id)self;
    _searchbar.tintColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    
    self.basicreqtable.tableHeaderView =_searchbar;
    
    UISearchDisplayController* searchController = [[UISearchDisplayController alloc] initWithSearchBar:_searchbar contentsController:self];
    searchController.searchResultsDataSource = (id)self;
    searchController.searchResultsDelegate =(id)self;
    searchController.delegate = (id)self;

    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{ if(tableView==_basicreqtable)
{
    return 5;
}
    if(tableView==_popOverTableView)
    {
        switch (poptype) {
            case 1:
                return 5;
                break;
            case 2:
                return 5;
                break;
            default:
                break;
        }
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
        if(tableView==_basicreqtable)
        {
            [[NSBundle mainBundle]loadNibNamed:@"custombasicreqcell" owner:self options:nil];
            cell=_reqcell;
        }
    }
        if(tableView==_popOverTableView)
        {
            switch (poptype) {
                case 1:
                    cell.textLabel.text=@"";
                    break;
                case 2:
                    cell.textLabel.text=@"";
                    break;
                default:
                    break;
            }
           
        }
        
    
    
    return cell;
}

#pragma mark - Table View delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
}

-(IBAction)closetheBASicreqview:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}
-(IBAction)addbasicreq:(id)sender
{
    _addreqview.hidden=NO;
    _navItem.title=@"ADD";
}
-(IBAction)editBasicreq:(id)sender
{
    _addreqview.hidden=NO;
    _navItem.title=@"EDIT";
}
-(IBAction)closeeditBasicreqview:(id)sender
{
    _addreqview.hidden=YES;
}
-(IBAction)expirycheckaction:(id)sender
{
    if (expiry==0) {
        [_expirycheckbtn setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        expiry=1;
        
    }
    
    else{
        [_expirycheckbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        expiry=0;
        
    }

}
-(IBAction)defaultcheckaction:(id)sender
{
    if (defaultcheck==0) {
        [_defaultcheckbtn setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        defaultcheck=1;
        
    }
    
    else{
        [_defaultcheckbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        defaultcheck=0;
        
    }

}
-(IBAction)inhousecheckaction:(id)sender
{
    if (inhouse==0) {
        [_inhousecheckbtn setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        inhouse=1;
        
    }
    
    else{
        [_inhousecheckbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        inhouse=0;
        
    }

}
-(IBAction)craftcheckaction:(id)sender
{
    
    if (craft==0) {
        [_craftcheckbtn setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        craft=1;
        
    }
    
    else{
        [_craftcheckbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        craft=0;
        
    }

}
#pragma mark-popover
-(IBAction)selectjobs:(id)sender
{   poptype=1;
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
    [self.popOverController presentPopoverFromRect:_jobbtn.frame
                                            inView:self.addreqview
                          permittedArrowDirections:UIPopoverArrowDirectionDown
                                          animated:YES];
    
    
}
-(IBAction)selectcraft:(id)sender
{   poptype=2;
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
                                            inView:self.addreqview
                          permittedArrowDirections:UIPopoverArrowDirectionUp
                                          animated:YES];
    
    
}




@end
