//
//  SitevisitViewController.m
//  Newproject
//
//  Created by GMSIndia 2 on 13/02/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "SitevisitViewController.h"

@interface SitevisitViewController ()

@end

@implementation SitevisitViewController

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
    
    [[UITabBar appearance] setTintColor:[UIColor redColor]];
    _prdunratetble.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _prdunratetble.layer.borderWidth=3.0;
    _documenttable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _documenttable.layer.borderWidth=3.0;
    NSArray*newarray=[[NSArray alloc]initWithObjects:_genralitm,_rateitm,_docuitm, nil];
    [self.firsttabbar setItems:newarray animated:YES];
    _tabletitleview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark-tableview datasource
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
        if (tableView==_prdunratetble) {
             [[NSBundle mainBundle]loadNibNamed:@"Ratecellview" owner:self options:nil];
        }
        if (tableView==_documenttable) {
                 [[NSBundle mainBundle]loadNibNamed:@"Ratecellview" owner:self options:nil];
        }

        cell=_ratecell;
    }
     // cell.textLabel.text=[_serviceaddedarray objectAtIndex:indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //alternating cell back ground color
    if(tableView==_documenttable||tableView==_prdunratetble)
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


    


-(IBAction)closesitevisit:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (IBAction)generalbtn:(id)sender {
    
    _gernalview.hidden=NO;
     _rateview.hidden=YES;
    _docmntview.hidden=YES;
}

- (IBAction)prductnbtn:(id)sender {
     _gernalview.hidden=YES;
    _rateview.hidden=NO;
    _docmntview.hidden=YES;
}

- (IBAction)documntbtn:(id)sender {
    _gernalview.hidden=YES;
    _rateview.hidden=YES;
    _docmntview.hidden=NO;
}

- (IBAction)cmpxtyofwrkbtn:(id)sender {
    
    
}

- (IBAction)updatebtn:(id)sender {
}
- (IBAction)ratedeletebtn:(id)sender {
}

- (IBAction)Rateaddbtn:(id)sender {
}

- (IBAction)celleditbtn:(id)sender {
}
- (IBAction)takepicturebtn:(id)sender {
}

- (IBAction)upadtepicturebtn:(id)sender {
}

- (IBAction)docutypebtn:(id)sender {
}
@end
