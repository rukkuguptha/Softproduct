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
    
    
    _allemplyescheckbtnlbl.hidden=NO;
    _allemployeeslbl.hidden=NO;
    _foremanbtnlbl.hidden=NO;
    _foremancheckbtnlbl.hidden=NO;
    _foremanlbl.hidden=NO;

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
    if (tableView==_popOverTableView) {
        return [_jobarray count];
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
    
    if (tableView==_popOverTableView) {
        cell.textLabel.text=[_jobarray objectAtIndex:indexPath.row];
    }
        
  //  }
    
    
    
    
    
    return cell;
    
    
}
#pragma mark-Tableview datasouce
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tableView==_popOverTableView){
        
    [_jobnumberbtnlbl setTitle:[_jobarray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
        
        
    }
    
    
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //alternating cell back ground color
    if(tableView==_timesheettable)
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
    calendar.maximumDate = [self.dateFormatter dateFromString:@"1/07/2050"];
    calendar.shouldFillCalendar = YES;
    calendar.adaptHeightToNumberOfWeeksInMonth = NO;
    
    calendar.frame = CGRectMake(10, 10, 300, 320);
    [popoverView addSubview:calendar];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(localeDidChange) name:NSCurrentLocaleDidChangeNotification object:nil];
    
    
    //create a popover controller
    self.popOverController = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    [self.popOverController presentPopoverFromRect:_datebtnlbl.frame
                                            inView:self.scroll
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
     [_datebtnlbl setTitle:dateString forState:UIControlStateNormal];
   ;
}
#pragma mark-Popover
-(void)createpopover{
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 200, 120)];
    
    popoverView.backgroundColor = [UIColor whiteColor];
    _popOverTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 200, 120)];
    
    _popOverTableView.delegate=(id)self;
    _popOverTableView.dataSource=(id)self;
    _popOverTableView.rowHeight= 32;
    _popOverTableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    
    
    // CGRect rect = frame;
    [popoverView addSubview:_popOverTableView];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(200, 120);
    
    //create a popover controller
    self.popOverController = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    
    //
    //    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    //    CGRect rect=CGRectMake(cell.bounds.origin.x+90, cell.bounds.origin.y+10, 50, 30);
    //    [self.popOverController presentPopoverFromRect:_disclsurelbl.bounds inView:self.view permittedArrowDirections:nil animated:YES];
    
    [self.popOverController presentPopoverFromRect:_jobnumberbtnlbl.frame
                                            inView:self.scroll
                          permittedArrowDirections:UIPopoverArrowDirectionUp
                                          animated:YES];

    }

#pragma mark-Webservice
-(void)JobsSelect{
    recordResults=FALSE;
    NSString *soapMessage;
    
    
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<JobsSelect xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   
                   "</JobsSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.100/service.asmx"];;
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/JobsSelect" forHTTPHeaderField:@"Soapaction"];
    
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
    UIAlertView *  Alert=[[UIAlertView alloc]initWithTitle:nil message:@"ERROR with the Connection" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    
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
    //NSDictionary *dictionary=[_xmlParser dictionaryWithValuesForKeys:[[NSArray alloc]initWithObjects:@"JobNumber", nil]];
    
    //  NSLog(@"dictioanry is %@",dictionary);
    
    
	[_xmlParser parse];
   
    [_popOverTableView reloadData];
    
}
#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"JobsSelectResponse"])
    {
        _jobarray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"JobNumber"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"JobDescDetail"])
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
    if([elementName isEqualToString:@"id"])
   {
      recordResults = FALSE;
       _soapResults = nil;
    }

    if([elementName isEqualToString:@"JobNumber"])
    {
        recordResults = FALSE;
        jobnumber=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"JobDescDetail"])
    {
        recordResults = FALSE;
        [_jobarray addObject:[NSString stringWithFormat:@"%@-%@",jobnumber,_soapResults]];
        _soapResults = nil;
    }

}
#pragma mark-picker method
-(void)dateChanged1{
    
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"hh:mm a"];
    NSString *currentTime = [dateFormatter stringFromDate:timePick.date];
    NSLog(@"%@", currentTime);
    _time1txtfld.text=currentTime;
 
    
}

- (IBAction)time2btn:(id)sender {
    UIViewController *viewCon = [[UIViewController alloc] init];
    timePick = [[UIDatePicker alloc]initWithFrame:CGRectMake(5, 0, 0, 0)];
    timePick.datePickerMode =UIDatePickerModeTime;
    [timePick addTarget:self action:@selector(dateChanged2) forControlEvents:UIControlEventValueChanged];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"HH:mm dd MMM yyyy"];
    [viewCon.view addSubview:timePick];
    viewCon.preferredContentSize = timePick.bounds.size ; // Set the content size
    
    _popOverController = [[UIPopoverController alloc] initWithContentViewController:viewCon];
    
    
    [_popOverController presentPopoverFromRect:_time2checkbtnlbl.frame
                             inView:self.view2
           permittedArrowDirections:UIPopoverArrowDirectionUp | UIPopoverArrowDirectionDown
                           animated:YES];
    

}
-(void)dateChanged2{
    
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"hh:mm a"];
    NSString *currentTime = [dateFormatter stringFromDate:timePick.date];
    NSLog(@"%@", currentTime);
    _time2txtfld.text=currentTime;
    
    
}

#pragma mark-Button Actions

- (IBAction)allemplysbtn:(id)sender {
    btnclck++;
    if (btnclck%2!=0) {
        [_allemplyescheckbtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        _foremancheckbtnlbl.enabled=NO;
    }
    
    else{
        [_allemplyescheckbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        _foremancheckbtnlbl.enabled=YES;
    }
    
}

- (IBAction)foremanbtn:(id)sender {
    btnclck1++;
    if (btnclck1%2!=0) {
        [_foremancheckbtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        _allemplyescheckbtnlbl.enabled=NO;
        _foremanbtnlbl.enabled=YES;
        
    }
    
    else{
        [_foremancheckbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        _allemplyescheckbtnlbl.enabled=YES;
        _foremanbtnlbl.enabled=NO;;
        
    }
    
}


- (IBAction)time1btn:(id)sender {
    UIViewController *viewCon = [[UIViewController alloc] init];
    timePick = [[UIDatePicker alloc]initWithFrame:CGRectMake(5, 0, 0, 0)];
    timePick.datePickerMode =UIDatePickerModeTime;
    [timePick addTarget:self action:@selector(dateChanged1) forControlEvents:UIControlEventValueChanged];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"HH:mm dd MMM yyyy"];
    [viewCon.view addSubview:timePick];
    viewCon.preferredContentSize = timePick.bounds.size ; // Set the content size
    
    _popOverController = [[UIPopoverController alloc] initWithContentViewController:viewCon];
    
    
    [_popOverController presentPopoverFromRect:_time1checkbtnlbl.frame
                                        inView:self.view1
                      permittedArrowDirections:UIPopoverArrowDirectionUp | UIPopoverArrowDirectionDown
                                      animated:YES];
    
    
}

- (IBAction)formanselctn:(id)sender {
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
- (IBAction)wobt:(id)sender {
    
}

- (IBAction)PO2btn:(id)sender {
}

- (IBAction)applybtn:(id)sender {
    _view2.hidden=NO;
    _view1.hidden=YES;
}

- (IBAction)jobnumbrbtn:(id)sender {
    [self createpopover];
    [self JobsSelect];
}

- (IBAction)clsebtn:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (IBAction)datebtn:(id)sender {
    [self createCalenderPopover];
    
}
- (IBAction)servicebtn:(id)sender {
    
}


#pragma mark-Barbutton Actions

- (IBAction)laborbtn:(id)sender {
    barbtntype=1;
     [_timesheettable reloadData];
    
    _allemplyescheckbtnlbl.hidden=NO;
    _allemployeeslbl.hidden=NO;
    _foremanbtnlbl.hidden=NO;
    _foremancheckbtnlbl.hidden=NO;
    _foremanlbl.hidden=NO;
    
    
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
    _allemplyescheckbtnlbl.hidden=YES;
    _allemployeeslbl.hidden=YES;
    _foremanbtnlbl.hidden=YES;
    _foremancheckbtnlbl.hidden=YES;
    _foremanlbl.hidden=YES;

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
    _allemplyescheckbtnlbl.hidden=YES;
    _allemployeeslbl.hidden=YES;
    _foremanbtnlbl.hidden=YES;
    _foremancheckbtnlbl.hidden=YES;
    _foremanlbl.hidden=YES;
    
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
    _allemplyescheckbtnlbl.hidden=YES;
    _allemployeeslbl.hidden=YES;
    _foremanbtnlbl.hidden=YES;
    _foremancheckbtnlbl.hidden=YES;
    _foremanlbl.hidden=YES;
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
    _allemplyescheckbtnlbl.hidden=YES;
    _allemployeeslbl.hidden=YES;
    _foremanbtnlbl.hidden=YES;
    _foremancheckbtnlbl.hidden=YES;
    _foremanlbl.hidden=YES;

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

@end
