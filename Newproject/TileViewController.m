//
//  TileViewController.m
//  Newproject
//
//  Created by GMSIndia1 on 12/13/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import "TileViewController.h"

@interface TileViewController ()

@end

@implementation TileViewController

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
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc]
                                         initWithTarget:self
                                         action:@selector(companyPage)];
    doubleTap.numberOfTapsRequired=1;
    doubleTap.delegate=(id)self;
    [self.companyinfoview addGestureRecognizer:doubleTap];
    
    UITapGestureRecognizer *doubleTap1 = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(documentPage)];
    doubleTap1.numberOfTapsRequired=1;
    doubleTap1.delegate=(id)self;
    [self.Documentsview addGestureRecognizer:doubleTap1];
    UITapGestureRecognizer *doubleTap2 = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(servicesPage)];
    doubleTap2.numberOfTapsRequired=1;
    doubleTap2.delegate=(id)self;
    [self.servicesview addGestureRecognizer:doubleTap2];
    
    
    UITapGestureRecognizer *doubleTap3 = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(foldersPage)];
    doubleTap3.numberOfTapsRequired=1;
    doubleTap3.delegate=(id)self;
    [self.foldersview addGestureRecognizer:doubleTap3];
    
    UITapGestureRecognizer *doubleTap4 = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(usersPage)];
    doubleTap4.numberOfTapsRequired=1;
    doubleTap4.delegate=(id)self;
    [self.usersview addGestureRecognizer:doubleTap4];
    
    UITapGestureRecognizer *doubleTap5 = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(workProcedurePage)];
    doubleTap5.numberOfTapsRequired=1;
    doubleTap5.delegate=(id)self;
    [self.workprocedureview addGestureRecognizer:doubleTap5];

    UITapGestureRecognizer *doubleTap6 = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(employeebenefitPage)];
    doubleTap6.numberOfTapsRequired=1;
    doubleTap6.delegate=(id)self;
    [self.employeebenefitview addGestureRecognizer:doubleTap6];
    

}

-(void)companyPage
{
    if (!self.compVCtrl) {
        self.compVCtrl=[[CompanyViewController alloc]initWithNibName:@"CompanyViewController" bundle:nil];
    }
    _compVCtrl.modalPresentationStyle = UIModalPresentationPageSheet;
    [self presentViewController:_compVCtrl
                       animated:YES completion:NULL];
}
-(void)documentPage
{
    if (!self.docVCtrl) {
        self.docVCtrl=[[DocmntViewController alloc]initWithNibName:@"DocmntViewController" bundle:nil];
    }
    _docVCtrl.modalPresentationStyle = UIModalPresentationPageSheet;
    [self presentViewController:_docVCtrl
                       animated:YES completion:NULL];
}
-(void)servicesPage
{
    if (!self.serviceVCtrl) {
        self.serviceVCtrl=[[ServiceViewController alloc]initWithNibName:@"ServiceViewController" bundle:nil];
    }
    _serviceVCtrl.modalPresentationStyle = UIModalPresentationPageSheet;
    [self presentViewController:_serviceVCtrl
                       animated:YES completion:NULL];
}
-(void)foldersPage
{
    
}
-(void)usersPage
{
    
}
-(void)workProcedurePage
{
    
}
-(void)employeebenefitPage
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)closethetile:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
