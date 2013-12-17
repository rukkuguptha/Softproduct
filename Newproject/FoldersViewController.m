//
//  FoldersViewController.m
//  Newproject
//
//  Created by GMSIndia 2 on 16/12/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import "FoldersViewController.h"

@interface FoldersViewController ()

@end

@implementation FoldersViewController

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
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc]
                                         initWithTarget:self
                                         action:@selector(allfolderPage)];
    doubleTap.numberOfTapsRequired=1;
    doubleTap.delegate=(id)self;
    [self.allfolderview addGestureRecognizer:doubleTap];
    
    UITapGestureRecognizer *doubleTap1 = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(folderrightsPage)];
    doubleTap1.numberOfTapsRequired=1;
    doubleTap1.delegate=(id)self;
    [self.folderrightsview addGestureRecognizer:doubleTap1];
}
-(void)allfolderPage
{
    if (!self.allfolderVctrl) {
        self.allfolderVctrl=[[AllfolderViewController alloc]initWithNibName:@"AllfolderViewController" bundle:nil];
    }
    _allfolderVctrl.modalPresentationStyle = UIModalPresentationFormSheet;
    [self presentViewController:_allfolderVctrl
                       animated:YES completion:NULL];
}
-(void)folderrightsPage
{
    
    if (!self.folderrightVCtrl) {
        self.folderrightVCtrl=[[folderrightsViewController alloc]initWithNibName:@"folderrightsViewController" bundle:nil];
    }
    _folderrightVCtrl.modalPresentationStyle = UIModalPresentationFormSheet;
    [self presentViewController:_folderrightVCtrl
                       animated:YES completion:NULL];
}
-(IBAction)closefolderview:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

@end
