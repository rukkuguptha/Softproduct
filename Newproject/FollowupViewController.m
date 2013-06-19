//
//  FollowupViewController.m
//  Newproject
//
//  Created by GMSIndia1 on 6/17/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import "FollowupViewController.h"

@interface FollowupViewController ()

@end

@implementation FollowupViewController

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
    
    _view1.backgroundColor=[UIColor colorWithRed:210.0/255.0f green:230.0/255.0f blue:450.0/255.0f alpha:1.0f];
    _scrollview.frame=CGRectMake(0, 0,1004, 768);
    [_scrollview setContentSize:CGSizeMake(1004,850)];
    _view1.backgroundColor=[UIColor colorWithRed:210.0/255.0f green:230.0/255.0f blue:450.0/255.0f alpha:1.0f];
    
    
    
    _followuptable.layer.borderWidth = 2.0;
    _followuptable.layer.borderColor = [UIColor colorWithRed:210.0/255.0f green:230.0/255.0f blue:450.0/255.0f alpha:1.0f].CGColor;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
//        [[NSBundle mainBundle]loadNibNamed:@"Customercell" owner:self options:nil];
//        cell=_customercell;
//        
        
    }
    //cell.textLabel.text=@"Customer Name";
    
    
    
    return cell;
    
    
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //alternating cell back ground color
    if (indexPath.row%2 == 0) {
        [cell setBackgroundColor:[UIColor whiteColor]];
        
        
    }else
    {
        
        //[cell setBackgroundColor:[UIColor colorWithRed:247.0/255.0f green:247.0/255.0f blue:247.0/255.0f alpha:1.0f]];
        [cell setBackgroundColor:[UIColor colorWithRed:210.0/255.0f green:230.0/255.0f blue:450.0/255.0f alpha:1.0f]];
        
    }
}


- (IBAction)addbtn:(id)sender {
    _view2.hidden=NO;
}
- (IBAction)closebtn:(id)sender {
    _view2.hidden=YES;

    
    
}
@end
