//
//  ActivityViewController.m
//  Newproject
//
//  Created by GMSIndia1 on 6/17/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import "ActivityViewController.h"

@interface ActivityViewController ()

@end

@implementation ActivityViewController



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
    NSLog(@"%d",_leadid);
    _scroll.frame=CGRectMake(0, 0, 1024,708);
    [_scroll setContentSize:CGSizeMake(1024,760)];
    _activityTable.layer.borderWidth = 2.0;
    _activityTable.layer.borderColor = [UIColor colorWithRed:210.0/255.0f green:230.0/255.0f blue:450.0/255.0f alpha:1.0f].CGColor;
    self.navigationController.navigationBar.tintColor=[UIColor blackColor];
   // self.newviewactivity.hidden=YES;
     _view2.backgroundColor=[UIColor colorWithRed:227.0/255.0f green:240.0/255.0f blue:247.0/255.0f alpha:1.0f];
    _activityNav.tintColor=[UIColor colorWithRed:227.0/255.0f green:240.0/255.0f blue:247.0/255.0f alpha:1.0f];
   _btnArray=[[NSMutableArray alloc]initWithObjects:@"New Activity",@"Edit Activity",@"Delete Activity" ,nil];
    _popoverArray=[[NSMutableArray alloc]initWithObjects:@"Follow Up",@"Comments" ,nil];
    self.navigationController.navigationBar.tintColor=[UIColor grayColor];
       // Do any additional setup after loading the view from its nib.
    [self getLeadActivity];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
   
    
    
    UIBarButtonItem*addbtn=[[UIBarButtonItem alloc]initWithTitle:@"Add" style:UIBarButtonItemStylePlain target:self action:@selector(addaction)];
    UIBarButtonItem*editbtn=[[UIBarButtonItem alloc]initWithTitle:@"Delete" style:UIBarButtonItemStylePlain target:self action:@selector(editaction)];
    NSArray*barbutns=[[NSArray alloc]initWithObjects:addbtn,editbtn, nil];
    [self.navigationItem setRightBarButtonItems:barbutns animated:YES];

    
    
}
-(void)editaction{
    
    if ([self.activityTable isEditing]) {
        // If the tableView is already in edit mode, turn it off. Also change the title of the button to reflect the intended verb (‘Edit’, in this case).
        
        [self.activityTable setEditing:NO animated:YES];
        //[_Editbtn setTitle:@"Edit"forState:UIControlStateNormal];
    }
    else {
        // [_Editbtn setTitle:@"Done"forState:UIControlStateNormal];
        
        // Turn on edit mode
        
        [self.activityTable setEditing:YES animated:YES];
    }
}




-(void)butnaction{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"EDIT"
                                                             delegate:self
                                                    cancelButtonTitle:nil
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:nil];
    for (NSString *fruit in self.btnArray) {
        [actionSheet addButtonWithTitle:fruit];
    }
    actionSheet.cancelButtonIndex = [actionSheet addButtonWithTitle:@"Cancel"];
    [actionSheet showInView:self.view];
    
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSString *buttonTitle = [actionSheet buttonTitleAtIndex:buttonIndex];
    if  ([buttonTitle isEqualToString:@"Edit Leads"]) {
        NSLog(@"Destructive pressed --> Delete Something");
    }
    if ([buttonTitle isEqualToString:@"New Activity"]) {
        _newviewactivity.hidden=NO;
        // self.leadTable.userInteractionEnabled=NO;
    }
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    // Return the number of rows in the section.
    if (tableView==_popOverTableView) {
        return [_popoverArray count];
        
    }
    if (tableView==_activityTable)
    {
    return [_activityArray count];
    }
    return YES;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        if (tableView==_activityTable) {

        [[NSBundle mainBundle]loadNibNamed:@"ActivityCustomCell" owner:self options:nil];
        cell=_actvityCell;
        }
        
    }
    //cell.textLabel.text=@"Leads";
      if (tableView==_popOverTableView) {
          cell.textLabel.font = [UIFont fontWithName:@"Helvetica Neue Light" size:12];
          cell.textLabel.font = [UIFont systemFontOfSize:12.0];

          cell.textLabel.text=[_popoverArray objectAtIndex:indexPath.row];
      }
    if(tableView==_activityTable)
    {
        activityInfo*info=(activityInfo*)[_activityArray objectAtIndex:indexPath.row];
        _activityname=(UILabel*)[cell viewWithTag:1];
        _activityname.text=info.activity;
        
        _datetext=(UILabel*)[cell viewWithTag:2];
        NSArray *dateArray=[[NSArray alloc]init];
        dateArray=[info.datest componentsSeparatedByString:@"T"];
        NSString *date1 =[dateArray objectAtIndex:0];
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"yyyy-MM-dd"];
        NSDate *dates = [dateFormat dateFromString:date1];
        [dateFormat setDateFormat:@"MM-dd-yyy"];
        NSString *myFormattedDate = [dateFormat stringFromDate:dates];
        
        _datetext.text=myFormattedDate;
        
        _employee=(UILabel*)[cell viewWithTag:3];
        _employee.text=info.employer;
        
        _description=(UILabel*)[cell viewWithTag:4];
        _description.text=info.description;
        
        _status=(UILabel*)[cell viewWithTag:5];
        _status.text=info.status;

    }
    return cell;
    
    
}

#pragma mark - Table View delegate
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //alternating cell back ground color
    if (indexPath.row%2 == 0) {
        [cell setBackgroundColor:[UIColor whiteColor]];
    }else
    {
        
        //[cell setBackgroundColor:[UIColor colorWithRed:247.0/255.0f green:247.0/255.0f blue:247.0/255.0f alpha:1.0f]];
        
        [cell setBackgroundColor:[UIColor colorWithRed:227.0/255.0f green:240.0/255.0f blue:247.0/255.0f alpha:1.0f]];

            }
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle==UITableViewCellEditingStyleDelete)
    {
       _selectedpath =indexPath.row;
//        UIButton *button = (UIButton *)sender;
//        UITableViewCell *cell = (UITableViewCell *)[[button superview] superview];
//        UITableView *table = (UITableView *)[cell superview];
//        _Path = [table indexPathForCell:cell];
        
       
        
        [self deleteActivity];
        
        [_activityArray removeObject:indexPath];
        
        [self getLeadActivity];
        
        
        
    }
    
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView==_popOverTableView) {
        
        if (indexPath.row==0) {
            
            if (!self.followupVCtrl) {
                self.followupVCtrl=[[FollowupViewController alloc]initWithNibName:@"FollowupViewController" bundle:nil];
            }
            _followupVCtrl.ActivityId=_activityid;
            NSLog(@"%d", _followupVCtrl.ActivityId);
            [self.navigationController pushViewController:self.followupVCtrl animated:YES];
            
        }
        

        

    }
    
       [self.popOverController dismissPopoverAnimated:YES];
    
}




#pragma mark - Calendar
-(void)createCalenderPopover
{
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 315, 330)];
    
    popoverView.backgroundColor = [UIColor lightTextColor];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(315, 330);
    
    CKCalendarView *calendar = [[CKCalendarView alloc] initWithStartDay:startMonday];
    self.calendar = calendar;
    calendar.delegate = self;
    
    
    NSDate *date = [NSDate date];
    
    // format it
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
    [dateFormat setDateFormat:@"dd/MM/YYYY"];
    
    // convert it to a string
    NSString *dateString = [dateFormat stringFromDate:date];
    //NSLog(@"datestring%@",dateString);
    
    self.dateFormatter = [[NSDateFormatter alloc] init];
    [self.dateFormatter setDateFormat:@"dd/MM/yyyy"];
    
    calendar.selectedDate = [self.dateFormatter dateFromString:dateString];
    
    calendar.minimumDate = [self.dateFormatter dateFromString:@"09/07/2011"];
    calendar.maximumDate = [self.dateFormatter dateFromString:@"1/07/2013"];
    calendar.shouldFillCalendar = YES;
    calendar.adaptHeightToNumberOfWeeksInMonth = NO;
    
    calendar.frame = CGRectMake(10, 10, 300, 320);
    [popoverView addSubview:calendar];
    
       
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(localeDidChange) name:NSCurrentLocaleDidChangeNotification object:nil];
    
    
    //create a popover controller
    self.popOverController = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    [self.popOverController presentPopoverFromRect:_dateBtn.frame
                                            inView:self.newviewactivity
                          permittedArrowDirections:UIPopoverArrowDirectionUp
                                          animated:YES];
    
}
  


- (void)localeDidChange {
    [self.calendar setLocale:[NSLocale currentLocale]];
}



#pragma mark - CKCalendarDelegate

- (void)calendar:(CKCalendarView *)calendar didSelectDate:(NSDate *)date {
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
    [dateFormat setDateFormat:@"MM/dd/YYYY"];
    
    NSString *dateString = [dateFormat stringFromDate:date];
    [_dateBtn setTitle:dateString forState:UIControlStateNormal];}



#pragma mark - Buttons

-(IBAction)addNewActivity:(id)sender
{
    self.newviewactivity.hidden=NO;
}
-(IBAction)closetheView:(id)sender
{
    butnidtfr=0;
   // self.newviewactivity.hidden=YES;
    _newviewactivity.frame = CGRectMake(195, 60, 663, 492);
    //    CGPoint origin = _hidenview.frame.origin;
    [UIView animateWithDuration: 1.0f animations:^{
        _newviewactivity.frame = CGRectMake(510, 346, 0, 0);
        //        _hidenview.center = origin;
        _newviewactivity.alpha = 0;
        
    }];

}



-(IBAction)selectDate:(id)sender
{
    [self createCalenderPopover];
}


-(void)addaction {
    butnidtfr=1;
    //_newviewactivity.hidden=NO;
    //_view2.hidden=NO;
    _newviewactivity.frame = CGRectMake(510, 346, 0, 0);
    //    CGPoint origin = _hidenview.frame.origin;
    [UIView animateWithDuration: 1.0f animations:^{
        _newviewactivity.frame = CGRectMake(195, 60, 663, 492);
        //        _hidenview.center = origin;
        _newviewactivity.alpha = 1.0;
        
    }];

}

- (IBAction)editcellbtn:(id)sender
{
    _newviewactivity.frame = CGRectMake(510, 346, 0, 0);
    //    CGPoint origin = _hidenview.frame.origin;
    [UIView animateWithDuration: 1.0f animations:^{
        _newviewactivity.frame = CGRectMake(195, 60, 663, 492);
        //        _hidenview.center = origin;
        _newviewactivity.alpha = 1.0;
        
    }];
    UIButton *button = (UIButton *)sender;
    
    UITableViewCell *cell = (UITableViewCell *)[[button superview] superview];
    UITableView *table = (UITableView *)[cell superview];
    _Path = [table indexPathForCell:cell];
    
    NSLog(@"indexpath%d",_Path.row);
    activityInfo*info1=(activityInfo*)[_activityArray objectAtIndex:_Path.row];
    
    NSArray *dateArray=[[NSArray alloc]init];
    dateArray=[info1.datest componentsSeparatedByString:@"T"];
    NSString *date1 =[dateArray objectAtIndex:0];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    NSDate *dates = [dateFormat dateFromString:date1];
    [dateFormat setDateFormat:@"MM-dd-yyy"];
    NSString *myFormattedDate = [dateFormat stringFromDate:dates];
    
    
    

   [_dateBtn setTitle:myFormattedDate forState:UIControlStateNormal];
    _employerTxtfld.text=info1.employer;
    _statusTxtFld.text=info1.status;
    _activityTxtFld.text=info1.activity;
    _descptionTextview.text=info1.description;

}
-(IBAction)cancelaction:(id)sender
{
    [_dateBtn setTitle:@"" forState:UIControlStateNormal];
    
    
    _employerTxtfld.text=@"";
    
    _statusTxtFld.text=@"";
    
    _descptionTextview.text=@"";
    _activityTxtFld.text=@"";
 
}

- (IBAction)disbtn:(id)sender {
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 120, 70)];
    
    popoverView.backgroundColor = [UIColor whiteColor];
    _popOverTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 120, 70)];
    
    _popOverTableView.delegate=(id)self;
    _popOverTableView.dataSource=(id)self;
    _popOverTableView.rowHeight= 32;
    _popOverTableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    
    
       [popoverView addSubview:_popOverTableView];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(120, 70);
    
    //create a popover controller
    
    self.popOverController = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    
       
    UIButton *button = (UIButton *)sender;
    
    UITableViewCell *cell = (UITableViewCell *)[[button superview] superview];
    UITableView *table = (UITableView *)[cell superview];
    NSIndexPath *IndexPath = [table indexPathForCell:cell];
    
    activityInfo*info=(activityInfo*)[_activityArray objectAtIndex:IndexPath.row];
    _activityid=info.activityId;
    
    
    [self.popOverController presentPopoverFromRect:_disbtnlbl.frame
                                            inView:cell
                          permittedArrowDirections:UIPopoverArrowDirectionLeft
                                          animated:YES];
    

    
    
}
-(void)getLeadActivity
{
    recordResults = FALSE;
    NSString *soapMessage;
    NSLog(@"%d",_leadid);
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   "<soap:Body>\n"
                   "<GetLeadActivity xmlns=\"http://webserv.kontract360.com/\">\n"
                   "<leadid>%d</leadid>\n"
                   "</GetLeadActivity>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_leadid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://webserv.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://webserv.kontract360.com/GetLeadActivity" forHTTPHeaderField:@"Soapaction"];
    
    [theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    
    if( theConnection )
    {
        _webData = [NSMutableData data];
    }
    else
    {
        ////NSLog(@"theConnection is NULL");
    }
    
 
}
-(void)saveActivity
{
    recordResults = FALSE;
    NSString *soapMessage;
    NSLog(@"%d",_leadid);
    NSInteger activityId=0;
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
    [dateFormat setDateFormat: @"MM/dd/yyyy"];
    
    NSDate *dateString = [dateFormat dateFromString:_dateBtn.titleLabel.text];
    NSDateFormatter *dateFormat1 = [[NSDateFormatter alloc]init];
    [dateFormat1 setDateFormat:@"yyyy-MM-dd"];
    NSString* sqldate=[dateFormat1 stringFromDate:dateString];

   
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   "<soap:Body>\n"
                   "<SaveActivity xmlns=\"http://webserv.kontract360.com/\">\n"
                   "<LeadId>%d</LeadId>\n"
                   "<Date>%@</Date>\n"
                   "<Activity>%@</Activity>\n"
                   "<Employer>%@</Employer>\n"
                   "<Description>%@</Description>\n"
                   "<Status>%@</Status>\n"
                   "<activityid>%d</activityid>\n"
                   "</SaveActivity>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_leadid,sqldate,_activityTxtFld.text,_employerTxtfld.text,_descptionTextview.text,_statusTxtFld.text,activityId];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://webserv.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://webserv.kontract360.com/SaveActivity" forHTTPHeaderField:@"Soapaction"];
    
    [theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    
    if( theConnection )
    {
        _webData = [NSMutableData data];
    }
    else
    {
        ////NSLog(@"theConnection is NULL");
    }
    

}
-(void)updateActivity
{
    recordResults = FALSE;
    NSString *soapMessage;
    NSLog(@"%d",_leadid);
    activityInfo*info2=(activityInfo*)[_activityArray objectAtIndex:_Path.row];
    NSLog(@"%@",info2.LeadId);
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
    [dateFormat setDateFormat: @"MM-dd-yyyy"];
      NSLog(@"%@",_dateBtn.titleLabel.text);
    
    NSDate *dateString = [dateFormat dateFromString:_dateBtn.titleLabel.text];
      NSLog(@"%@",dateString);
    NSDateFormatter *dateFormat1 = [[NSDateFormatter alloc]init];
    [dateFormat1 setDateFormat:@"yyyy-MM-dd"];
    NSString* sqldate=[dateFormat1 stringFromDate:dateString];
    

    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   "<soap:Body>\n"
                   "<SaveActivity xmlns=\"http://webserv.kontract360.com/\">\n"
                   "<LeadId>%d</LeadId>\n"
                   "<Date>%@</Date>\n"
                   "<Activity>%@</Activity>\n"
                   "<Employer>%@</Employer>\n"
                   "<Description>%@</Description>\n"
                   "<Status>%@</Status>\n"
                   "<activityid>%d</activityid>\n"
                   "</SaveActivity>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_leadid,sqldate,_activityTxtFld.text,_employerTxtfld.text,_descptionTextview.text,_statusTxtFld.text,info2.activityId];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://webserv.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://webserv.kontract360.com/SaveActivity" forHTTPHeaderField:@"Soapaction"];
    
    [theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    
    if( theConnection )
    {
        _webData = [NSMutableData data];
    }
    else
    {
        ////NSLog(@"theConnection is NULL");
    }
    
    
 
}
-(void)deleteActivity
{
    
    recordResults = FALSE;
    NSString *soapMessage;
     activityInfo*info2=(activityInfo*)[_activityArray objectAtIndex:_selectedpath];
    NSLog(@"%d",info2.activityId);
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   "<soap:Body>\n"
                   "<DeleteActivity xmlns=\"http://webserv.kontract360.com/\">\n"
                   "<activityid>%d</activityid>\n"
                   "</DeleteActivity>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",info2.activityId];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://webserv.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://webserv.kontract360.com/DeleteActivity" forHTTPHeaderField:@"Soapaction"];
    
    [theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    
    if( theConnection )
    {
        _webData = [NSMutableData data];
    }
    else
    {
        ////NSLog(@"theConnection is NULL");
    }
    
    

}
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
	[_webData setLength: 0];
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
   	[_webData appendData:data];
}
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    UIAlertView *  Alert=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"ERROR with theConenction" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    
    [Alert show];
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"DONE. Received Bytes: %d", [_webData length]);
	NSString *theXML = [[NSString alloc] initWithBytes: [_webData mutableBytes] length:[_webData length] encoding:NSUTF8StringEncoding];
	NSLog(@"xml===== %@",theXML);
	
	
	if( _xmlParser )
	{
		
	}
	
	_xmlParser = [[NSXMLParser alloc] initWithData: _webData];
	[_xmlParser setDelegate:(id)self];
	[_xmlParser setShouldResolveExternalEntities: YES];
	[_xmlParser parse];
    [_activityTable reloadData];
    
}
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict
{
    if([elementName isEqualToString:@"GetLeadActivityResult"])
    {
        _activityArray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"ID"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"LeadId"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Date"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Activity"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Employer"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Description"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Status"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if ([elementName isEqualToString:@"SaveActivityResult"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
        
    }
    if ([elementName isEqualToString:@"result"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
        
    }
    if([elementName isEqualToString:@"DeleteActivityResult"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;

    }

    
    if([elementName isEqualToString:@"msg"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }

    
    
 
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    
    
    
	if( recordResults )
        
	{
        
        
		[_soapResults appendString: string];
    }
}
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
  
    if([elementName isEqualToString:@"GetLeadsResult"])
    {
        
        recordResults = FALSE;
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"ID"])
    {
        _act=[[activityInfo alloc]init];
        recordResults = FALSE;
        _act.activityId=[_soapResults integerValue];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"LeadId"])
    {
        
        recordResults = FALSE;
        _act.LeadId=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Date"])
    {
        
        recordResults = FALSE;
        _act.datest=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Activity"])
    {
        
        recordResults = FALSE;
        _act.activity=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Employer"])
    {
        
        recordResults = FALSE;
        _act.employer=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Description"])
    {
        
        recordResults = FALSE;
        _act.description=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Status"])
    {
        
        recordResults = FALSE;
        _act.status=_soapResults;
        [_activityArray addObject:_act];
        _soapResults = nil;
    }
    if ([elementName isEqualToString:@"SaveActivityResult"])
    {
        
       
        recordResults = FALSE;
        _soapResults = nil;
        

    }
    if([elementName isEqualToString:@"result"])
    {
        recordResults = FALSE;
        UIAlertView*alert=[[UIAlertView alloc]initWithTitle:nil message:_soapResults delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [alert show];
        _soapResults = nil;
    }
    

    if([elementName isEqualToString:@"msg"])
    {
        recordResults = FALSE;
        UIAlertView*alert=[[UIAlertView alloc]initWithTitle:nil message:_soapResults delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [alert show];
        _soapResults = nil;
    }


    


    



    

}
-(IBAction)saveActivity:(id)sender
{
    if(butnidtfr==1)
{
    [self saveActivity];
}
else
    {
         [self updateActivity];
    }
    [self getLeadActivity];
}


@end
