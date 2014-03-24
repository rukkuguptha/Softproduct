//
//  TypeViewController.m
//  Newproject
//
//  Created by GMSIndia1 on 3/24/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "TypeViewController.h"

@interface TypeViewController ()

@end

@implementation TypeViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark-Tableview
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    // Return the number of rows in the section.
    return [_typelistarray count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
       // [[NSBundle mainBundle]loadNibNamed:@"Addresscell" owner:self options:nil];
        //cell=_addrscell;
    }
    
    
//    Mdladdress *addmdl=(Mdladdress *)[_addesslistarray objectAtIndex:indexPath.row];
//    _headerlbl=(UILabel *)[cell viewWithTag:1];
//    _headerlbl.text=addmdl.header;
//    _addresslbl=(UILabel *)[cell viewWithTag:2];
//    _addresslbl.text=addmdl.address;
    
    
    return cell;
    
    
}
#pragma mark - tabledelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle==UITableViewCellEditingStyleDelete) {
       // deletepath=indexPath.row;
        
       // [self AdressMasterDelete];
       // [_addesslistarray removeObject:indexPath];
        
        
        
        
        
    }
    
}

- (IBAction)clsebtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)updatebtn:(id)sender {
}
- (IBAction)deltebtn:(id)sender {
    if (self.editing) {
        [super setEditing:NO animated:NO];
        [_typetable setEditing:NO animated:NO];
        [_typetable reloadData];
        
        
        
    }
    
    else{
        [super setEditing:YES animated:YES];
        [_typetable setEditing:YES animated:YES];
        [_typetable reloadData];
        
        
        
        
    }

}

- (IBAction)addbtn:(id)sender {
    _addview.hidden=NO;
}

@end
