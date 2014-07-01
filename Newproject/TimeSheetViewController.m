//
//  TimeSheetViewController.m
//  Newproject
//
//  Created by Riya on 6/30/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "TimeSheetViewController.h"

@interface TimeSheetViewController ()

@end

@implementation TimeSheetViewController

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
    self.view.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
     self.view1.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
     self.view2.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];

}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    barbtntype=1;
    _view1.hidden=NO;
    _view2.hidden=YES;
    _timesheettable.rowHeight=60;
    _timesheettable.layer.borderWidth=3.0;
    _timesheettable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f].CGColor;
    _equipmnttableview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f];
    _materialstableview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f];
    _otherstableview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f];
    _labortableview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f];
    
    
    
    _labrbarbtn.tintColor=[UIColor whiteColor];
    _equpbarbtn.tintColor=[UIColor blackColor];
    _fleetbarbtn.tintColor=[UIColor blackColor];
    _tpebarbtn.tintColor=[UIColor blackColor];
    _thirpfleetbarbtn.tintColor=[UIColor blackColor];
    _materialbarbtn.tintColor=[UIColor blackColor];
    _consumblebarbtn.tintColor=[UIColor blackColor];
    _othrsbarbtn.tintColor=[UIColor blackColor];
   

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
    if(tableView==_timesheettable){
        return 5;
    }
      return YES;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  //  if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12];
        if(tableView==_timesheettable){
            switch (barbtntype) {
                case 1:
                      [[NSBundle mainBundle]loadNibNamed:@"Tlaborcell" owner:self options:nil];
                     cell=_laborcell;
                    break;
                case 2:
                    [[NSBundle mainBundle]loadNibNamed:@"TEqupcell" owner:self options:nil];
                    cell=_labrequpcell;
                    break;
                case 4:
                    [[NSBundle mainBundle]loadNibNamed:@"TOtherscell" owner:self options:nil];
                    cell=_labrothrcell;
                    break;
                    


                    
                default:
                    break;
            }
          
           
        }
        
  //  }
    
    
    
    
    
    return cell;
    
    
}
#pragma mark-Button Action
- (IBAction)allemplysbtn:(id)sender {
}

- (IBAction)foremanbtn:(id)sender {
}

- (IBAction)formanselctn:(id)sender {
}

- (IBAction)time1btn:(id)sender {
}

- (IBAction)time2btn:(id)sender {
}

- (IBAction)phase1btn:(id)sender {
}

- (IBAction)sequence1btn:(id)sender {
}

- (IBAction)tagnumber1btn:(id)sender {
}

- (IBAction)phase2btn:(id)sender {
}

- (IBAction)sequence2btn:(id)sender {
}

- (IBAction)tagnumber2btn:(id)sender {
}


#pragma mark-Barbutton Actions

- (IBAction)laborbtn:(id)sender {
    barbtntype=1;
     [_timesheettable reloadData];
    _view1.hidden=NO;
     _view2.hidden=YES;
    _labortableview.hidden=NO;
    _equipmnttableview.hidden=YES;
    _materialstableview.hidden=YES;
    _otherstableview.hidden=YES;
    
    _labrbarbtn.tintColor=[UIColor whiteColor];
    _equpbarbtn.tintColor=[UIColor blackColor];
    _fleetbarbtn.tintColor=[UIColor blackColor];
    _tpebarbtn.tintColor=[UIColor blackColor];
    _thirpfleetbarbtn.tintColor=[UIColor blackColor];
    _materialbarbtn.tintColor=[UIColor blackColor];
    _consumblebarbtn.tintColor=[UIColor blackColor];
    _othrsbarbtn.tintColor=[UIColor blackColor];

    
}

- (IBAction)equpbtn:(id)sender {
      barbtntype=2;
    [_timesheettable reloadData];
    _view1.hidden=NO;
    _view2.hidden=YES;
    _labortableview.hidden=YES;
    _equipmnttableview.hidden=NO;
    _materialstableview.hidden=YES;
    _otherstableview.hidden=YES;
    _labrbarbtn.tintColor=[UIColor blackColor];
    _equpbarbtn.tintColor=[UIColor whiteColor];
    _fleetbarbtn.tintColor=[UIColor blackColor];
    _tpebarbtn.tintColor=[UIColor blackColor];
    _thirpfleetbarbtn.tintColor=[UIColor blackColor];
    _materialbarbtn.tintColor=[UIColor blackColor];
    _consumblebarbtn.tintColor=[UIColor blackColor];
    _othrsbarbtn.tintColor=[UIColor blackColor];

}

- (IBAction)fleetbtn:(id)sender {
       barbtntype=2;
     [_timesheettable reloadData];
    _view1.hidden=NO;
    _view2.hidden=YES;
    _labortableview.hidden=YES;
    _equipmnttableview.hidden=NO;
    _materialstableview.hidden=YES;
    _otherstableview.hidden=YES;
    
    _labrbarbtn.tintColor=[UIColor blackColor];
    _equpbarbtn.tintColor=[UIColor blackColor];
    _fleetbarbtn.tintColor=[UIColor whiteColor];
    _tpebarbtn.tintColor=[UIColor blackColor];
    _thirpfleetbarbtn.tintColor=[UIColor blackColor];
    _materialbarbtn.tintColor=[UIColor blackColor];
    _consumblebarbtn.tintColor=[UIColor blackColor];
    _othrsbarbtn.tintColor=[UIColor blackColor];


}

- (IBAction)tpfbtn:(id)sender {
       barbtntype=2;
     [_timesheettable reloadData];
    _view1.hidden=NO;
    _view2.hidden=YES;
    _labortableview.hidden=YES;
    _equipmnttableview.hidden=NO;
    _materialstableview.hidden=YES;
    _otherstableview.hidden=YES;
    
    _labrbarbtn.tintColor=[UIColor blackColor];
    _equpbarbtn.tintColor=[UIColor blackColor];
    _fleetbarbtn.tintColor=[UIColor blackColor];
    _tpebarbtn.tintColor=[UIColor blackColor];
    _thirpfleetbarbtn.tintColor=[UIColor whiteColor];
    _materialbarbtn.tintColor=[UIColor blackColor];
    _consumblebarbtn.tintColor=[UIColor blackColor];
    _othrsbarbtn.tintColor=[UIColor blackColor];



}

- (IBAction)tpebtn:(id)sender {
       barbtntype=2;
     [_timesheettable reloadData];
    _view1.hidden=NO;
    _view2.hidden=YES;
    _labortableview.hidden=YES;
    _equipmnttableview.hidden=NO;
    _materialstableview.hidden=YES;
    _otherstableview.hidden=YES;
    
    _labrbarbtn.tintColor=[UIColor blackColor];
    _equpbarbtn.tintColor=[UIColor blackColor];
    _fleetbarbtn.tintColor=[UIColor blackColor];
    _tpebarbtn.tintColor=[UIColor whiteColor];
    _thirpfleetbarbtn.tintColor=[UIColor blackColor];
    _materialbarbtn.tintColor=[UIColor blackColor];
    _consumblebarbtn.tintColor=[UIColor blackColor];
    _othrsbarbtn.tintColor=[UIColor blackColor];


}

- (IBAction)materialsbtn:(id)sender {
    barbtntype=2;
 [_timesheettable reloadData];
    _view2.hidden=NO;
    _view1.hidden=YES;
    _labortableview.hidden=YES;
    _equipmnttableview.hidden=YES;
    _materialstableview.hidden=NO;
    _otherstableview.hidden=YES;

    _labrbarbtn.tintColor=[UIColor blackColor];
    _equpbarbtn.tintColor=[UIColor blackColor];
    _fleetbarbtn.tintColor=[UIColor blackColor];
    _tpebarbtn.tintColor=[UIColor blackColor];
    _thirpfleetbarbtn.tintColor=[UIColor blackColor];
    _materialbarbtn.tintColor=[UIColor whiteColor];
    _consumblebarbtn.tintColor=[UIColor blackColor];
    _othrsbarbtn.tintColor=[UIColor blackColor];

}

- (IBAction)consumblesbtn:(id)sender {
     barbtntype=2;
     [_timesheettable reloadData];
    _view2.hidden=NO;
    _view1.hidden=YES;
    _labortableview.hidden=YES;
    _equipmnttableview.hidden=YES;
    _materialstableview.hidden=NO;
    _otherstableview.hidden=YES;
    
    _labrbarbtn.tintColor=[UIColor blackColor];
    _equpbarbtn.tintColor=[UIColor blackColor];
    _fleetbarbtn.tintColor=[UIColor blackColor];
    _tpebarbtn.tintColor=[UIColor blackColor];
    _thirpfleetbarbtn.tintColor=[UIColor blackColor];
    _materialbarbtn.tintColor=[UIColor blackColor];
    _consumblebarbtn.tintColor=[UIColor whiteColor];
    _othrsbarbtn.tintColor=[UIColor blackColor];


}

- (IBAction)othrsbtn:(id)sender {
    barbtntype=4;
    [_timesheettable reloadData];

    _view2.hidden=NO;
    _view1.hidden=YES;
    _labortableview.hidden=YES;
    _equipmnttableview.hidden=YES;
    _materialstableview.hidden=YES;
    _otherstableview.hidden=NO;
    
    _labrbarbtn.tintColor=[UIColor blackColor];
    _equpbarbtn.tintColor=[UIColor blackColor];
    _fleetbarbtn.tintColor=[UIColor blackColor];
    _tpebarbtn.tintColor=[UIColor blackColor];
    _thirpfleetbarbtn.tintColor=[UIColor blackColor];
    _materialbarbtn.tintColor=[UIColor blackColor];
    _consumblebarbtn.tintColor=[UIColor blackColor];
    _othrsbarbtn.tintColor=[UIColor whiteColor];


}

- (IBAction)wobt:(id)sender {
    
}

- (IBAction)PO2btn:(id)sender {
}

- (IBAction)applybtn:(id)sender {
    _view2.hidden=NO;
    _view1.hidden=YES;
}

- (IBAction)clsebtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
@end
