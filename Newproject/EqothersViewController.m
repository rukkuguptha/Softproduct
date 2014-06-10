//
//  EqothersViewController.m
//  Newproject
//
//  Created by GMSIndia1 on 6/9/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "EqothersViewController.h"

@interface EqothersViewController ()

@end

@implementation EqothersViewController

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
    _eqtable.layer.borderWidth=3.0;
    _eqtable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f].CGColor;
    _titleview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f];

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
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
        [[NSBundle mainBundle]loadNibNamed:@"Eqotherscell" owner:self options:nil];
        cell=_eqcell;
    }
    
    
//    Mdladdress *addmdl=(Mdladdress *)[_addesslistarray objectAtIndex:indexPath.row];
//    _headerlbl=(UILabel *)[cell viewWithTag:1];
//    _headerlbl.text=addmdl.header;
//    _addresslbl=(UILabel *)[cell viewWithTag:2];
//    _addresslbl.text=addmdl.address;
    
    
    return cell;
    
    
}

- (IBAction)clsebtn:(id)sender {
   
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
