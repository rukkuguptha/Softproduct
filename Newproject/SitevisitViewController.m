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
    
    [[UIToolbar appearance] setTintColor:[UIColor redColor]];
    _prdunratetble.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _prdunratetble.layer.borderWidth=3.0;
    _documenttable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _documenttable.layer.borderWidth=3.0;
  
    _tabletitleview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _jobsitetable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _jobsitetable.layer.borderWidth=3.0;
    _jobsitetitleview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _safteytitleview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _safetytableview.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _safetytableview.layer.borderWidth=3.0;
    _neweqmnttitile.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _newequipmenttable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _newequipmenttable.layer.borderWidth=3.0;
    _worktitleview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _workscdletable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _workscdletable.layer.borderWidth=3.0;
    _meetingtitleview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _meetingtable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _meetingtable.layer.borderWidth=3.0;
    _bidderstitle.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _bidderstable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _bidderstable.layer.borderWidth=3.0;

    _weathertitle.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _weathertable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _weathertable.layer.borderWidth=3.0;

    _notestitle.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _notestable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _notestable.layer.borderWidth=3.0;
    

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
            
             cell=_ratecell;
        }
        if (tableView==_documenttable) {
                 [[NSBundle mainBundle]loadNibNamed:@"cellfordocumnt" owner:self options:nil];
            
            cell=_docucell;
            
        }

        
        if (tableView==_jobsitetable) {
            [[NSBundle mainBundle]loadNibNamed:@"Jobsitecellview" owner:self options:nil];
            
            cell=_jobsitecell;
            
        }
        

       
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
    _gernalbtnlbl.tintColor=[UIColor whiteColor];
    _pratebtnlbl.tintColor=[UIColor blackColor];
    _documntbtnlbl.tintColor=[UIColor blackColor];
    _accesbltybtnlbl.tintColor=[UIColor blackColor];
    _EstggAreabtnlbl.tintColor=[UIColor blackColor];
    _jobsitebtnlbl.tintColor=[UIColor blackColor];
    _saftybtnlbl.tintColor=[UIColor blackColor];
    _equpmntslbl.tintColor=[UIColor blackColor];
    _workbtnlbl.tintColor=[UIColor blackColor];
    _meetingnotesbtnlbl.tintColor=[UIColor blackColor];
    _biddersbtnlbl.tintColor=[UIColor blackColor];
    _weatherbtnlbl.tintColor=[UIColor blackColor];
    _notesbtnlbl.tintColor=[UIColor blackColor];

    
    

    
    
    _gernalview.hidden=NO;
     _rateview.hidden=YES;
    _docmntview.hidden=YES;
     _accblitytxtview.hidden=YES;
    _equipmentview.hidden=YES;
      _jobsiteview.hidden=YES;
    _safetyview.hidden=YES;
   _neweqmntview.hidden=YES;
    _workschdleview.hidden=YES;
    _meetingview.hidden=YES;
    _biddersview.hidden=YES;
    _weatherview.hidden=YES;
    _notesview.hidden=YES;


}

- (IBAction)prductnbtn:(id)sender {
    _gernalbtnlbl.tintColor=[UIColor blackColor];
    _pratebtnlbl.tintColor=[UIColor whiteColor];
    _documntbtnlbl.tintColor=[UIColor blackColor];
    _accesbltybtnlbl.tintColor=[UIColor blackColor];
    _EstggAreabtnlbl.tintColor=[UIColor blackColor];
    _jobsitebtnlbl.tintColor=[UIColor blackColor];
    _saftybtnlbl.tintColor=[UIColor blackColor];
    _equpmntslbl.tintColor=[UIColor blackColor];
    _workbtnlbl.tintColor=[UIColor blackColor];
    _meetingnotesbtnlbl.tintColor=[UIColor blackColor];
    _biddersbtnlbl.tintColor=[UIColor blackColor];
    _weatherbtnlbl.tintColor=[UIColor blackColor];
    _notesbtnlbl.tintColor=[UIColor blackColor];
    
     _gernalview.hidden=YES;
    _rateview.hidden=NO;
    _docmntview.hidden=YES;
     _accblitytxtview.hidden=YES;
    _equipmentview.hidden=YES;
      _jobsiteview.hidden=YES;
    _safetyview.hidden=YES;
   _neweqmntview.hidden=YES;
    _workschdleview.hidden=YES;
    _meetingview.hidden=YES;
    _biddersview.hidden=YES;
    _weatherview.hidden=YES;
    _notesview.hidden=YES;


}

- (IBAction)documntbtn:(id)sender {
    _gernalbtnlbl.tintColor=[UIColor blackColor];
    _pratebtnlbl.tintColor=[UIColor blackColor];
    _documntbtnlbl.tintColor=[UIColor whiteColor];
    _accesbltybtnlbl.tintColor=[UIColor blackColor];
    _EstggAreabtnlbl.tintColor=[UIColor blackColor];
    _jobsitebtnlbl.tintColor=[UIColor blackColor];
    _saftybtnlbl.tintColor=[UIColor blackColor];
    _equpmntslbl.tintColor=[UIColor blackColor];
    _workbtnlbl.tintColor=[UIColor blackColor];
    _meetingnotesbtnlbl.tintColor=[UIColor blackColor];
    _biddersbtnlbl.tintColor=[UIColor blackColor];
    _weatherbtnlbl.tintColor=[UIColor blackColor];
    _notesbtnlbl.tintColor=[UIColor blackColor];

    
    
    _gernalview.hidden=YES;
    _rateview.hidden=YES;
    _docmntview.hidden=NO;
    _accblitytxtview.hidden=YES;
    _equipmentview.hidden=YES;
      _jobsiteview.hidden=YES;
    _safetyview.hidden=YES;
       _neweqmntview.hidden=YES;
    _workschdleview.hidden=YES;
    _meetingview.hidden=YES;
    _biddersview.hidden=YES;
    _weatherview.hidden=YES;
    _notesview.hidden=YES;


}

- (IBAction)acceblitybtn:(id)sender {
    
    _gernalbtnlbl.tintColor=[UIColor blackColor];
    _pratebtnlbl.tintColor=[UIColor blackColor];
    _documntbtnlbl.tintColor=[UIColor blackColor];
    _accesbltybtnlbl.tintColor=[UIColor whiteColor];
    _EstggAreabtnlbl.tintColor=[UIColor blackColor];
    _jobsitebtnlbl.tintColor=[UIColor blackColor];
    _saftybtnlbl.tintColor=[UIColor blackColor];
    _equpmntslbl.tintColor=[UIColor blackColor];
    _workbtnlbl.tintColor=[UIColor blackColor];
    _meetingnotesbtnlbl.tintColor=[UIColor blackColor];
    _biddersbtnlbl.tintColor=[UIColor blackColor];
    _weatherbtnlbl.tintColor=[UIColor blackColor];
    _notesbtnlbl.tintColor=[UIColor blackColor];

    
    
    
    _gernalview.hidden=YES;
    _rateview.hidden=YES;
    _docmntview.hidden=YES;
    _accessview.hidden=NO;
      _equipmentview.hidden=YES;
      _jobsiteview.hidden=YES;
    _safetyview.hidden=YES;
       _neweqmntview.hidden=YES;
    _workschdleview.hidden=YES;
    _meetingview.hidden=YES;
    _biddersview.hidden=YES;
    _weatherview.hidden=YES;
    _notesview.hidden=YES;


}

- (IBAction)Equmntstgareabtn:(id)sender {
    
    _gernalbtnlbl.tintColor=[UIColor blackColor];
    _pratebtnlbl.tintColor=[UIColor blackColor];
    _documntbtnlbl.tintColor=[UIColor blackColor];
    _accesbltybtnlbl.tintColor=[UIColor blackColor];
    _EstggAreabtnlbl.tintColor=[UIColor whiteColor];
    _jobsitebtnlbl.tintColor=[UIColor blackColor];
    _saftybtnlbl.tintColor=[UIColor blackColor];
    _equpmntslbl.tintColor=[UIColor blackColor];
    _workbtnlbl.tintColor=[UIColor blackColor];
    _meetingnotesbtnlbl.tintColor=[UIColor blackColor];
    _biddersbtnlbl.tintColor=[UIColor blackColor];
    _weatherbtnlbl.tintColor=[UIColor blackColor];
    _notesbtnlbl.tintColor=[UIColor blackColor];

    
    _gernalview.hidden=YES;
    _rateview.hidden=YES;
    _docmntview.hidden=YES;
    _accessview.hidden=YES;
    _equipmentview.hidden=NO;
     _jobsiteview.hidden=YES;
    _safetyview.hidden=YES;
       _neweqmntview.hidden=YES;
    _workschdleview.hidden=YES;

    _meetingview.hidden=YES;
    _biddersview.hidden=YES;
    _weatherview.hidden=YES;
    _notesview.hidden=YES;


}

- (IBAction)jobsitebtn:(id)sender {
    
    _gernalbtnlbl.tintColor=[UIColor blackColor];
    _pratebtnlbl.tintColor=[UIColor blackColor];
    _documntbtnlbl.tintColor=[UIColor blackColor];
    _accesbltybtnlbl.tintColor=[UIColor blackColor];
    _EstggAreabtnlbl.tintColor=[UIColor blackColor];
    _jobsitebtnlbl.tintColor=[UIColor whiteColor];
    _saftybtnlbl.tintColor=[UIColor blackColor];
    _equpmntslbl.tintColor=[UIColor blackColor];
    _workbtnlbl.tintColor=[UIColor blackColor];
    _meetingnotesbtnlbl.tintColor=[UIColor blackColor];
    _biddersbtnlbl.tintColor=[UIColor blackColor];
    _weatherbtnlbl.tintColor=[UIColor blackColor];
    _notesbtnlbl.tintColor=[UIColor blackColor];

    _gernalview.hidden=YES;
    _rateview.hidden=YES;
    _docmntview.hidden=YES;
    _accessview.hidden=YES;
    _equipmentview.hidden=YES;
    _jobsiteview.hidden=NO;
     _safetyview.hidden=YES;
       _neweqmntview.hidden=YES;
    _workschdleview.hidden=YES;
    _meetingview.hidden=YES;
    _biddersview.hidden=YES;
    _weatherview.hidden=YES;
    _notesview.hidden=YES;

    
}

- (IBAction)safetybtn:(id)sender {
    
    _gernalbtnlbl.tintColor=[UIColor blackColor];
    _pratebtnlbl.tintColor=[UIColor blackColor];
    _documntbtnlbl.tintColor=[UIColor blackColor];
    _accesbltybtnlbl.tintColor=[UIColor blackColor];
    _EstggAreabtnlbl.tintColor=[UIColor blackColor];
    _jobsitebtnlbl.tintColor=[UIColor blackColor];
    _saftybtnlbl.tintColor=[UIColor whiteColor];
    _equpmntslbl.tintColor=[UIColor blackColor];
    _workbtnlbl.tintColor=[UIColor blackColor];
    _meetingnotesbtnlbl.tintColor=[UIColor blackColor];
    _biddersbtnlbl.tintColor=[UIColor blackColor];
    _weatherbtnlbl.tintColor=[UIColor blackColor];
    _notesbtnlbl.tintColor=[UIColor blackColor];

    _gernalview.hidden=YES;
    _rateview.hidden=YES;
    _docmntview.hidden=YES;
    _accessview.hidden=YES;
    _equipmentview.hidden=YES;
    _jobsiteview.hidden=YES;
    _safetyview.hidden=NO;
       _neweqmntview.hidden=YES;
    _workschdleview.hidden=YES;
    _meetingview.hidden=YES;
    _biddersview.hidden=YES;
    _weatherview.hidden=YES;
    _notesview.hidden=YES;

    
}

- (IBAction)newequipmentbtn:(id)sender {
    _gernalbtnlbl.tintColor=[UIColor blackColor];
    _pratebtnlbl.tintColor=[UIColor blackColor];
    _documntbtnlbl.tintColor=[UIColor blackColor];
    _accesbltybtnlbl.tintColor=[UIColor blackColor];
    _EstggAreabtnlbl.tintColor=[UIColor blackColor];
    _jobsitebtnlbl.tintColor=[UIColor blackColor];
    _saftybtnlbl.tintColor=[UIColor blackColor];
    _equpmntslbl.tintColor=[UIColor whiteColor];
    _workbtnlbl.tintColor=[UIColor blackColor];
    _meetingnotesbtnlbl.tintColor=[UIColor blackColor];
    _biddersbtnlbl.tintColor=[UIColor blackColor];
    _weatherbtnlbl.tintColor=[UIColor blackColor];
    _notesbtnlbl.tintColor=[UIColor blackColor];

    _gernalview.hidden=YES;
    _rateview.hidden=YES;
    _docmntview.hidden=YES;
    _accessview.hidden=YES;
    _equipmentview.hidden=YES;
    _jobsiteview.hidden=YES;
    _safetyview.hidden=YES;
    
    _neweqmntview.hidden=NO;
      _workschdleview.hidden=YES;
    _meetingview.hidden=YES;
    _biddersview.hidden=YES;
    _weatherview.hidden=YES;
    _notesview.hidden=YES;


    
}

- (IBAction)workschedulebtn:(id)sender {
    _gernalbtnlbl.tintColor=[UIColor blackColor];
    _pratebtnlbl.tintColor=[UIColor blackColor];
    _documntbtnlbl.tintColor=[UIColor blackColor];
    _accesbltybtnlbl.tintColor=[UIColor blackColor];
    _EstggAreabtnlbl.tintColor=[UIColor blackColor];
    _jobsitebtnlbl.tintColor=[UIColor blackColor];
    _saftybtnlbl.tintColor=[UIColor blackColor];
    _equpmntslbl.tintColor=[UIColor blackColor];
    _workbtnlbl.tintColor=[UIColor whiteColor];
    _meetingnotesbtnlbl.tintColor=[UIColor blackColor];
    _biddersbtnlbl.tintColor=[UIColor blackColor];
    _weatherbtnlbl.tintColor=[UIColor blackColor];
    _notesbtnlbl.tintColor=[UIColor blackColor];

    _gernalview.hidden=YES;
    _rateview.hidden=YES;
    _docmntview.hidden=YES;
    _accessview.hidden=YES;
    _equipmentview.hidden=YES;
    _jobsiteview.hidden=YES;
    _safetyview.hidden=YES;
    _neweqmntview.hidden=YES;
    _workschdleview.hidden=NO;
    _meetingview.hidden=YES;
    _biddersview.hidden=YES;
    _weatherview.hidden=YES;
    _notesview.hidden=YES;

    

    
}

- (IBAction)meetingnotesbtn:(id)sender {
    _gernalbtnlbl.tintColor=[UIColor blackColor];
    _pratebtnlbl.tintColor=[UIColor blackColor];
    _documntbtnlbl.tintColor=[UIColor blackColor];
    _accesbltybtnlbl.tintColor=[UIColor blackColor];
    _EstggAreabtnlbl.tintColor=[UIColor blackColor];
    _jobsitebtnlbl.tintColor=[UIColor blackColor];
    _saftybtnlbl.tintColor=[UIColor blackColor];
    _equpmntslbl.tintColor=[UIColor blackColor];
    _workbtnlbl.tintColor=[UIColor blackColor];
    _meetingnotesbtnlbl.tintColor=[UIColor whiteColor];
    _biddersbtnlbl.tintColor=[UIColor blackColor];
    _weatherbtnlbl.tintColor=[UIColor blackColor];
    _notesbtnlbl.tintColor=[UIColor blackColor];

    _gernalview.hidden=YES;
    _rateview.hidden=YES;
    _docmntview.hidden=YES;
    _accessview.hidden=YES;
    _equipmentview.hidden=YES;
    _jobsiteview.hidden=YES;
    _safetyview.hidden=YES;
    _neweqmntview.hidden=YES;
    _workschdleview.hidden=YES;
    _meetingview.hidden=NO;
    _biddersview.hidden=YES;
    _weatherview.hidden=YES;
    _notesview.hidden=YES;
    


}

- (IBAction)otherbiddersbtn:(id)sender {
    _gernalbtnlbl.tintColor=[UIColor blackColor];
    _pratebtnlbl.tintColor=[UIColor blackColor];
    _documntbtnlbl.tintColor=[UIColor blackColor];
    _accesbltybtnlbl.tintColor=[UIColor blackColor];
    _EstggAreabtnlbl.tintColor=[UIColor blackColor];
    _jobsitebtnlbl.tintColor=[UIColor blackColor];
    _saftybtnlbl.tintColor=[UIColor blackColor];
    _equpmntslbl.tintColor=[UIColor blackColor];
    _workbtnlbl.tintColor=[UIColor blackColor];
    _meetingnotesbtnlbl.tintColor=[UIColor blackColor];
    _biddersbtnlbl.tintColor=[UIColor whiteColor];
    _weatherbtnlbl.tintColor=[UIColor blackColor];
    _notesbtnlbl.tintColor=[UIColor blackColor];

    _gernalview.hidden=YES;
    _rateview.hidden=YES;
    _docmntview.hidden=YES;
    _accessview.hidden=YES;
    _equipmentview.hidden=YES;
    _jobsiteview.hidden=YES;
    _safetyview.hidden=YES;
    _neweqmntview.hidden=YES;
    _workschdleview.hidden=YES;
    _meetingview.hidden=YES;
      _biddersview.hidden=NO;
    _weatherview.hidden=YES;
    _notesview.hidden=YES;

}

- (IBAction)weatheroutlookbtn:(id)sender {
    _gernalbtnlbl.tintColor=[UIColor blackColor];
    _pratebtnlbl.tintColor=[UIColor blackColor];
    _documntbtnlbl.tintColor=[UIColor blackColor];
    _accesbltybtnlbl.tintColor=[UIColor blackColor];
    _EstggAreabtnlbl.tintColor=[UIColor blackColor];
    _jobsitebtnlbl.tintColor=[UIColor blackColor];
    _saftybtnlbl.tintColor=[UIColor blackColor];
    _equpmntslbl.tintColor=[UIColor blackColor];
    _workbtnlbl.tintColor=[UIColor blackColor];
    _meetingnotesbtnlbl.tintColor=[UIColor blackColor];
    _biddersbtnlbl.tintColor=[UIColor blackColor];
    _weatherbtnlbl.tintColor=[UIColor whiteColor];
    _notesbtnlbl.tintColor=[UIColor blackColor];

    _gernalview.hidden=YES;
    _rateview.hidden=YES;
    _docmntview.hidden=YES;
    _accessview.hidden=YES;
    _equipmentview.hidden=YES;
    _jobsiteview.hidden=YES;
    _safetyview.hidden=YES;
    _neweqmntview.hidden=YES;
    _workschdleview.hidden=YES;
    _meetingview.hidden=YES;
    _biddersview.hidden=YES;

    _weatherview.hidden=NO;
    _notesview.hidden=YES;

}

- (IBAction)notesbtn:(id)sender {
    
    _gernalbtnlbl.tintColor=[UIColor blackColor];
    _pratebtnlbl.tintColor=[UIColor blackColor];
    _documntbtnlbl.tintColor=[UIColor blackColor];
    _accesbltybtnlbl.tintColor=[UIColor blackColor];
    _EstggAreabtnlbl.tintColor=[UIColor blackColor];
    _jobsitebtnlbl.tintColor=[UIColor blackColor];
    _saftybtnlbl.tintColor=[UIColor blackColor];
    _equpmntslbl.tintColor=[UIColor blackColor];
    _workbtnlbl.tintColor=[UIColor blackColor];
    _meetingnotesbtnlbl.tintColor=[UIColor blackColor];
    _biddersbtnlbl.tintColor=[UIColor blackColor];
    _weatherbtnlbl.tintColor=[UIColor blackColor];
    _notesbtnlbl.tintColor=[UIColor whiteColor];

    _gernalview.hidden=YES;
    _rateview.hidden=YES;
    _docmntview.hidden=YES;
    _accessview.hidden=YES;
    _equipmentview.hidden=YES;
    _jobsiteview.hidden=YES;
    _safetyview.hidden=YES;
    _neweqmntview.hidden=YES;
    _workschdleview.hidden=YES;
    _meetingview.hidden=YES;
    _weatherview.hidden=YES;
    _notesview.hidden=NO;
    _biddersview.hidden=YES;



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
- (IBAction)accebilityupdate:(id)sender {
}
- (IBAction)equpmntupdatebtn:(id)sender {
}
- (IBAction)addnewjobsite:(id)sender {
}
- (IBAction)addsafetyrules:(id)sender {
}
- (IBAction)addnewequipment:(id)sender {
}
- (IBAction)addworkscdle:(id)sender {
}
- (IBAction)addmeetgnots:(id)sender {
}
- (IBAction)addbidder:(id)sender {
}
- (IBAction)addweather:(id)sender {
}
- (IBAction)addnotesbtn:(id)sender {
}
@end
