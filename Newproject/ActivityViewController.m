//
//  ActivityViewController.m
//  Newproject
//
//  Created by GMSIndia1 on 6/17/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import "ActivityViewController.h"

@interface ActivityViewController ()

@end

@implementation ActivityViewController



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
    _activityTable.layer.borderWidth = 2.0;
    _activityTable.layer.borderColor = [UIColor colorWithRed:210.0/255.0f green:230.0/255.0f blue:450.0/255.0f alpha:1.0f].CGColor;
    self.navigationController.navigationBar.tintColor=[UIColor blackColor];
    self.newviewactivity.hidden=YES;
    _activityNav.tintColor=[UIColor colorWithRed:210.0/255.0f green:230.0/255.0f blue:450.0/255.0f alpha:1.0f];

       // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    // Return the number of rows in the section.
    
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        [[NSBundle mainBundle]loadNibNamed:@"ActivityCustomCell" owner:self options:nil];
        cell=_actvityCell;
        
    }
    //cell.textLabel.text=@"Leads";
    
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

-(IBAction)addNewActivity:(id)sender
{
    self.newviewactivity.hidden=NO;
}
-(IBAction)closetheView:(id)sender
{
    self.newviewactivity.hidden=YES;
}



@end
