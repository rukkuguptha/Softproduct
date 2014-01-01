//
//  SmalltoolsViewController.m
//  Newproject
//
//  Created by GMSIndia1 on 1/1/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "SmalltoolsViewController.h"

@interface SmalltoolsViewController ()

@end

@implementation SmalltoolsViewController

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
    _Tooltable.layer.borderWidth = 2.0;
   _Tooltable.layer.borderColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _view1.backgroundColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    /*searchbar*/
    _searchbar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 220, 44)];
    _searchbar.delegate = (id)self;
  _searchbar.tintColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    
    self.Tooltable.tableHeaderView =_searchbar;
    
    UISearchDisplayController* searchController = [[UISearchDisplayController alloc] initWithSearchBar:_searchbar contentsController:self];
    searchController.searchResultsDataSource = (id)self;
    searchController.searchResultsDelegate =(id)self;
    searchController.delegate = (id)self;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Table View datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    if (tableView==_materialTable) {
//        return [_materialarray count];
//        
//    }
//    if (tableView==_popOverTableView) {
//        return [_subtypearray count];
//    }
    return 5;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.textLabel.font = [UIFont fontWithName:@"Helvetica Neue Light" size:12];
        
        //if (tableView==_materialTable) {
            [[NSBundle mainBundle]loadNibNamed:@"Smalltoolcell" owner:self options:nil];
            cell=_toolcell;
        //}
    }
//    if (tableView==_popOverTableView) {
//        cell.textLabel.text=[_subtypearray objectAtIndex:indexPath.row];
//    }
//    if (tableView==_materialTable) {
//        Manpwr*materaialmdl=(Manpwr *)[_materialarray objectAtIndex:indexPath.row];
//        _codelbl=(UILabel *)[cell viewWithTag:1];
//        _codelbl.text=materaialmdl.itemcode;
//        _deslbl=(UILabel *)[cell viewWithTag:2];
//        _deslbl.text=materaialmdl.itemdescptn;
//        _typelbl=(UILabel *)[cell viewWithTag:3];
//        _typelbl.text=materaialmdl.subtype;
//        _costlbl=(UILabel *)[cell viewWithTag:4];
//        _costlbl.text=materaialmdl.unitcost;
//        
//    }
    return cell;
}

#pragma mark - Table View delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
//    if(tableView==_popOverTableView){
//        
//        _//subtyptxtfld.text=[_subtypearray objectAtIndex:indexPath.row];
//    }
    
    
    
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle==UITableViewCellEditingStyleDelete) {
        //path=indexPath.row;
     //   [self DeleteMaterials];
       // [_materialarray removeObject:indexPath];
        
        
    }
    
    
}


- (IBAction)addtoolbtn:(id)sender {
    _addview.hidden=NO;
    _navtitle.title=@"ADD";


}

- (IBAction)deletetoolbtn:(id)sender {
}

- (IBAction)closebtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)updatebtn:(id)sender {
}

- (IBAction)cancelbtn:(id)sender {
}

- (IBAction)subsearchbtn:(id)sender {
}

- (IBAction)closeaddbtn:(id)sender {
    _addview.hidden=YES;
    
}

- (IBAction)editbtn:(id)sender {
    _addview.hidden=NO;
    _navtitle.title=@"EDIT";
}
@end
