//
//  folderrightsViewController.m
//  Newproject
//
//  Created by GMSIndia 2 on 17/12/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import "folderrightsViewController.h"

@interface folderrightsViewController ()

@end

@implementation folderrightsViewController

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
    _folderrighttable.layer.borderWidth = 2.0;
    _folderrighttable.layer.borderColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
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
        [[NSBundle mainBundle]loadNibNamed:@"custonfldrrigtscell" owner:self options:nil];
        cell=_folderrightscell;
    }
    
    return cell;
}

#pragma mark - Table View delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
}

-(IBAction)closefolderrightsview:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}
-(IBAction)editfolderrights:(id)sender
{
    _createcheckbtn.enabled=YES;
    _upldcheckbtn.enabled=YES;
    _dwnldcheckbtn.enabled=YES;
}

@end
