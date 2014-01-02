//
//  UsersViewController.m
//  Newproject
//
//  Created by GMSIndia 2 on 16/12/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import "UsersViewController.h"

@interface UsersViewController ()

@end

@implementation UsersViewController

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
    _usertable.layer.borderWidth = 2.0;
    _usertable.layer.borderColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _titleview.backgroundColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
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
{
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        [[NSBundle mainBundle]loadNibNamed:@"usercell" owner:self options:nil];
        cell=_usercell;
    }
    
    return cell;
}

#pragma mark - Table View delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle==UITableViewCellEditingStyleDelete) {
        path=indexPath.row;
        
//        [self DeletePhases];
//        [_workphasesarray removeObject:indexPath];
        
        
        
        
        
    }
    
}


-(IBAction)closeuser:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}
-(IBAction)adduserview:(id)sender
{    optionIdentifier=1;
    _addview.hidden=NO;
    _navitem.title=@"ADD";
}
-(IBAction)edituserview:(id)sender
{
    optionIdentifier=2;
    _addview.hidden=NO;
    _navitem.title=@"EDIT";
    button = (UIButton *)sender;
    CGPoint center= button.center;
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.usertable];
    NSIndexPath *textFieldIndexPath = [self.usertable indexPathForRowAtPoint:rootViewPoint];
    NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
    btnindex=textFieldIndexPath.row;

}
-(IBAction)closeuserview:(id)sender
{
    _addview.hidden=YES;
}
-(IBAction)deleteusers:(id)sender
{
    if (self.editing) {
        [super setEditing:NO animated:NO];
        [_usertable setEditing:NO animated:NO];
        [_usertable reloadData];
        
        
        
    }
    
    else{
        [super setEditing:YES animated:YES];
        [_usertable setEditing:YES animated:YES];
        [_usertable reloadData];
        
    }
    
}




@end
