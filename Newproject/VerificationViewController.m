//
//  VerificationViewController.m
//  Newproject
//
//  Created by GMSIndia1 on 9/24/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import "VerificationViewController.h"

@interface VerificationViewController ()

@end

@implementation VerificationViewController

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
    self.navigationController.navigationBar.tintColor=[UIColor blackColor];
    //_view1.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    //_tabbar.tintColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
       [_tabbar setSelectedItem:[_tabbar.items objectAtIndex:0]];
    _requirementtable.layer.borderWidth = 2.0;
    _requirementtable.layer.borderColor = [UIColor colorWithRed:0/255.0f green:191/255.0f blue:255.0/255.0f alpha:1.0f].CGColor;
    
    /*scroll*/
    
    _scroll.frame=CGRectMake(0, 0, 1004,768);
    [_scroll setContentSize:CGSizeMake(1004,1000)];
    NSLog(@"Applicnt %d",_applicantid);

    }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    
    if (item.tag==1) {
     __requirmentview.hidden=NO;
        _I9view.hidden=YES;
       
        
    }
    if (item.tag==2) {
        _I9view.hidden=NO;
        
        __requirmentview.hidden=YES;
        
    }
    if (item.tag==3) {
        _I9view.hidden=NO;
        
        __requirmentview.hidden=YES;
        
    }

    if (item.tag==4) {
        
        _I9view.hidden=NO;
        
        __requirmentview.hidden=YES;

    }

    
    NSLog(@"view");
}

- (IBAction)requrmntactn:(id)sender {
}

- (IBAction)i9action:(id)sender {
}

- (IBAction)bgaction:(id)sender {
}

- (IBAction)ssnaction:(id)sender {
}
- (IBAction)savebtn:(id)sender {
}

- (IBAction)cancelbtn:(id)sender {
}

- (IBAction)uploadbtn:(id)sender {
    
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 120, 100)];
    
    popoverView.backgroundColor = [UIColor whiteColor];
    _popOverTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 120, 100)];
    
    _popOverTableView.delegate=(id)self;
    _popOverTableView.dataSource=(id)self;
    _popOverTableView.rowHeight= 32;
    _popOverTableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    
    
    [popoverView addSubview:_popOverTableView];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(120, 100);
    
    //create a popover controller
    
    self.popOverController = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    
    
//    UIButton *button = (UIButton *)sender;
//    
//    UITableViewCell *cell = (UITableViewCell *)[[button superview] superview];
//    UITableView *table = (UITableView *)[cell superview];
//    NSIndexPath *IndexPath = [table indexPathForCell:cell];
    
    
    
    
    [self.popOverController presentPopoverFromRect:_uploadbtnlbl.frame
                                            inView:_I9view
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
  
        // Return the number of rows in the section.
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
      
            
            
                 
        cell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12.0f];
    }
            return cell;
}

#pragma mark - Table View delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
       
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //alternating cell back ground color
           if (indexPath.row%2 == 0) {
            [cell setBackgroundColor:[UIColor whiteColor]];
            
        }else
        {
            
            //[cell setBackgroundColor:[UIColor colorWithRed:247.0/255.0f green:247.0/255.0f blue:247.0/255.0f alpha:1.0f]];
            [cell setBackgroundColor:[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f]];
            
            
        }
    }


- (IBAction)Rsavebtn:(id)sender {
}

- (IBAction)Rcancelbtn:(id)sender {
}
- (void)viewDidUnload {
    [self setReqiuremntnamelbl:nil];
    [super viewDidUnload];
}






@end
