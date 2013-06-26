//
//  FollowupViewController.m
//  Newproject
//
//  Created by GMSIndia1 on 6/17/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import "FollowupViewController.h"

@interface FollowupViewController ()

@end

@implementation FollowupViewController

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
    _view2.hidden=YES;
    // Do any additional setup after loading the view from its nib.
    
    _view1.backgroundColor=[UIColor colorWithRed:210.0/255.0f green:230.0/255.0f blue:450.0/255.0f alpha:1.0f];
    _scrollview.frame=CGRectMake(0, 0,1004, 768);
    [_scrollview setContentSize:CGSizeMake(1004,850)];
    _view1.backgroundColor=[UIColor colorWithRed:210.0/255.0f green:230.0/255.0f blue:450.0/255.0f alpha:1.0f];
    
    
    
    _followuptable.layer.borderWidth = 2.0;
    _followuptable.layer.borderColor = [UIColor colorWithRed:210.0/255.0f green:230.0/255.0f blue:450.0/255.0f alpha:1.0f].CGColor;
      _navigationbar.tintColor=[UIColor colorWithRed:210.0/255.0f green:230.0/255.0f blue:450.0/255.0f alpha:1.0f];
     _btnArray=[[NSMutableArray alloc]initWithObjects:@"New FollowUP",@"Edit FollowUP",@"Delete FollowUP" ,nil];
    _communctiontypeArray=[[NSMutableArray alloc]initWithObjects:@"Email Follow UP",@"Phone Follow UP",@"Launch Appointment",@"Golf Game", nil];
    
    [self getActivityFollowup];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    
    
    UIBarButtonItem*addbtn=[[UIBarButtonItem alloc]initWithTitle:@"Add" style:UIBarButtonItemStylePlain target:self action:@selector(addaction)];
    UIBarButtonItem*editbtn=[[UIBarButtonItem alloc]initWithTitle:@"Delete" style:UIBarButtonItemStylePlain target:self action:@selector(editaction)];
    NSArray*barbutns=[[NSArray alloc]initWithObjects:addbtn,editbtn, nil];
    [self.navigationItem setRightBarButtonItems:barbutns animated:YES];
    
}
-(void)editaction{
    
    if ([self.followuptable isEditing]) {
        // If the tableView is already in edit mode, turn it off. Also change the title of the button to reflect the intended verb (‘Edit’, in this case).
        
        [self.followuptable setEditing:NO animated:YES];
        //[_Editbtn setTitle:@"Edit"forState:UIControlStateNormal];
    }
    else {
        // [_Editbtn setTitle:@"Done"forState:UIControlStateNormal];
        
        // Turn on edit mode
        
        [self.followuptable setEditing:YES animated:YES];
    }
}




-(void)butnaction{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"EDIT"
                                                             delegate:self
                                                    cancelButtonTitle:nil
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:nil];
    for (NSString *actionString in self.btnArray) {
        [actionSheet addButtonWithTitle:actionString];
    }
    actionSheet.cancelButtonIndex = [actionSheet addButtonWithTitle:@"Cancel"];
    [actionSheet showInView:self.view];
    
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSString *buttonTitle = [actionSheet buttonTitleAtIndex:buttonIndex];
    if  ([buttonTitle isEqualToString:@"Edit Leads"]) {
        NSLog(@"Destructive pressed --> Delete Something");
    }
    if ([buttonTitle isEqualToString:@"New FollowUP"]) {
       _view2 .hidden=NO;
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
    if(tableView==_popOverTableView) {
        return [_communctiontypeArray count];
    }
    else if(tableView==_followuptable) {
    
        return [_FollowupArray count];
    }
        return YES;

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        [[NSBundle mainBundle]loadNibNamed:@"FollowupCell" owner:self options:nil];
        cell=_followcell;
        
        
    }
    //cell.textLabel.text=@"Customer Name";
    if(tableView==_popOverTableView)
    {
     cell.textLabel.font = [UIFont fontWithName:@"Helvetica Neue Light" size:12];
    cell.textLabel.font = [UIFont systemFontOfSize:12.0];
     cell.textLabel.text=[_communctiontypeArray objectAtIndex:indexPath.row];
    }
    if(tableView==_followuptable){
        
        
        
        
    }
    
    return cell;
    
    
}


#pragma mark - Table View delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tableView==_popOverTableView)
    {
        [_communictntypeBtn setTitle:[_communctiontypeArray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
    }
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    if(tableView==_followuptable)
    {
    //alternating cell back ground color
    if (indexPath.row%2 == 0) {
        [cell setBackgroundColor:[UIColor whiteColor]];
        
        
    }else
    {
        
        //[cell setBackgroundColor:[UIColor colorWithRed:247.0/255.0f green:247.0/255.0f blue:247.0/255.0f alpha:1.0f]];
        [cell setBackgroundColor:[UIColor colorWithRed:210.0/255.0f green:230.0/255.0f blue:450.0/255.0f alpha:1.0f]];
        
    }
    }
}


-(void)addaction {
    _view2.hidden=NO;
}
- (IBAction)closebtn:(id)sender {
    _view2.hidden=YES;

    
    
}
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
    
    //    self.dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(calendar.frame) + 4, self.view.bounds.size.width, 24)];
    //    [self.view addSubview:self.dateLabel];
    
    //  self.view.backgroundColor = [UIColor whiteColor];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(localeDidChange) name:NSCurrentLocaleDidChangeNotification object:nil];
    
    
    //create a popover controller
    self.popOverController = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    [self.popOverController presentPopoverFromRect:_dateBtn.frame
                                            inView:self.view2
                          permittedArrowDirections:UIPopoverArrowDirectionUp
                                          animated:YES];
    
}
//     if([_datecheckstring isEqualToString:@"iphone"])
//     {
//         [self.popOverController presentPopoverFromRect:_dateiphonebtn.frame
//                                                 inView:self.view
//                               permittedArrowDirections:UIPopoverArrowDirectionUp
//                                               animated:YES];




- (void)localeDidChange {
    [self.calendar setLocale:[NSLocale currentLocale]];
}



#pragma mark - CKCalendarDelegate

- (void)calendar:(CKCalendarView *)calendar didSelectDate:(NSDate *)date {
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
    [dateFormat setDateFormat:@"MM/dd/YYYY"];
    
    NSString *dateString = [dateFormat stringFromDate:date];
    [_dateBtn setTitle:dateString forState:UIControlStateNormal];
    
}
-(IBAction)selectDate:(id)sender
{
    [self createCalenderPopover];
}

-(void)createPopover
{
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 200, 250)];
    
    popoverView.backgroundColor = [UIColor lightTextColor];
    _popOverTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 200, 250)];
    _popOverTableView.delegate=(id)self;
    _popOverTableView.dataSource=(id)self;
    _popOverTableView.rowHeight= 32;
    _popOverTableView.separatorColor=[UIColor cyanColor];
    [popoverView addSubview:_popOverTableView];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(200, 250);
    
    //create a popover controller
    self.popOverController = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
            [self.popOverController presentPopoverFromRect:_communictntypeBtn.frame
                                                inView:self.view2
                              permittedArrowDirections:UIPopoverArrowDirectionUp
                                              animated:YES];
        
        
 
}
-(IBAction)selectCommunicationType:(id)sender
{
    [self createPopover];
}

- (IBAction)updatebtn:(id)sender {
}

- (IBAction)cancelbtn:(id)sender {
}

- (IBAction)editcellbtn:(id)sender
{
    _view2.hidden=NO;
}

- (IBAction)namebtn:(id)sender {
    NSLog(@"Name.......");
}

#pragma mark - Webservice
/*webservices*/

-(void)getActivityFollowup{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<GetActivityFollowup xmlns=\"http://webserv.kontract360.com/\">\n"
                     "<activityid>%d</activityid>\n"
                   "</GetActivityFollowup>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_ActivityId];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://webserv.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://webserv.kontract360.com/GetActivityFollowup" forHTTPHeaderField:@"Soapaction"];
    
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

-(void)Addfollowup{
    NSString*datestring=_dateBtn.titleLabel.text;

     NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];

    recordResults = FALSE;
    NSString *soapMessage;
    NSString *leadlink=@"";

    NSInteger followupID=0;
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SaveFollowup xmlns=\"http://webserv.kontract360.com/\">\n"
                   "<HeadLine>%@</HeadLine>\n"
                   "<LeadLink>%d</LeadLink>\n"
                   "<OrgContact>%@</OrgContact>\n"
                   "<CommunicationType>%@</CommunicationType>\n"
                   "<DateContact>%@</DateContact>\n"
                   "<TimeContact>%@</TimeContact>\n"
                   "<Summary>%@</Summary>\n"
                   "<activityId>%d</activityId>\n"
                   "<followupid>%d</followupid>\n"
                   "</SaveFollowup>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_summarytxtfld.text,leadlink,_contacttxtfld.text,_communictntypeBtn.titleLabel.text,_detailtxtview.text
                   ,_ActivityId,followupID];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://webserv.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://webserv.kontract360.com/SaveFollowup" forHTTPHeaderField:@"Soapaction"];
    
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


//-(void)Editfollowup{
//    recordResults = FALSE;
//    NSString *soapMessage;
//  //  NSInteger followupID=0;
//    soapMessage = [NSString stringWithFormat:
//                   
//                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
//                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
//                   
//                   
//                   "<soap:Body>\n"
//                   
//                   "<SaveFollowup xmlns=\"http://webserv.kontract360.com/\">\n"
//                   "<HeadLine>%@</HeadLine>\n"
//                   "<LeadLink>%d</LeadLink>\n"
//                   "<OrgContact>%@</OrgContact>\n"
//                   "<CommunicationType>%@</CommunicationType>\n"
//                   "<DateContact>%@</DateContact>\n"
//                   "<TimeContact>%@</TimeContact>\n"
//                   "<Summary>%@</Summary>\n"
//                   "<activityId>%d</activityId>\n"
//                   "<followupid>%d</followupid>\n"
//                   "</SaveFollowup>\n"
//                   "</soap:Body>\n"
//                   "</soap:Envelope>\n",,_ActivityId,followupID];
//    NSLog(@"soapmsg%@",soapMessage);
//    
//    
//    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
//    NSURL *url = [NSURL URLWithString:@"http://webserv.kontract360.com/service.asmx"];
//    
//    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
//    
//    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
//    
//    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
//    
//    [theRequest addValue: @"http://webserv.kontract360.com/SaveFollowup" forHTTPHeaderField:@"Soapaction"];
//    
//    [theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];
//    [theRequest setHTTPMethod:@"POST"];
//    [theRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
//    
//    
//    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
//    
//    if( theConnection )
//    {
//        _webData = [NSMutableData data];
//    }
//    else
//    {
//        ////NSLog(@"theConnection is NULL");
//    }
//    
//    
//}
//

#pragma mark - Connection
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
    [_followuptable reloadData];
    
}


#pragma mark - XMLParser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"GetActivityFollowupResult"])
    {
        _FollowupArray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"ComId"])
    {
       
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"HeadLine"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"LeadLink"])
    {
               if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"OrgContact"])
    {
       
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"DateContact"])
    {
       
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    

    if([elementName isEqualToString:@"TimeContact"])
    {
               if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    

    
    if([elementName isEqualToString:@"Summary"])
    {
      
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"activityId"])
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
    
    
    if([elementName isEqualToString:@"ComId"])
    {
        _followupmdl=[[followupmodel alloc]init];
        recordResults = FALSE;
        _followupmdl.ComId=[_soapResults integerValue];
        _soapResults = nil;

    }
    
    if([elementName isEqualToString:@"HeadLine"])
    {
        recordResults = FALSE;
        _followupmdl.headline=_soapResults;
        _soapResults = nil;

    }
    if([elementName isEqualToString:@"LeadLink"])
    {
        recordResults = FALSE;
        _followupmdl.LeadLink=_soapResults;
        _soapResults = nil;
        
    }
    
    if([elementName isEqualToString:@"OrgContact"])
    {
        recordResults = FALSE;
        _followupmdl.OrgContact=_soapResults;
        _soapResults = nil;
        
    }
    
    if([elementName isEqualToString:@"DateContact"])
    {
        recordResults = FALSE;
        _followupmdl.DateContact=_soapResults;
        _soapResults = nil;

    }
    
    
    
    if([elementName isEqualToString:@"TimeContact"])
    {
        recordResults = FALSE;
        _followupmdl.TimeContact=_soapResults;
        _soapResults = nil;
    }
    
    
    
    
    if([elementName isEqualToString:@"Summary"])
    {
        recordResults = FALSE;
        _followupmdl.Summary=_soapResults;
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"activityId"])
    {
        recordResults = FALSE;
        _followupmdl.activityId=[_soapResults integerValue] ;
        [_FollowupArray addObject:_followupmdl];
        _soapResults = nil;
    }
    
    

}











@end
