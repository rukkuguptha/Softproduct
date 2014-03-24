//
//  DetailproHrViewController.m
//  Newproject
//
//  Created by GMSIndia 2 on 10/02/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "DetailproHrViewController.h"

@interface DetailproHrViewController ()

@end

@implementation DetailproHrViewController

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
    _detailsaddview.hidden=NO;;
     _detailbtnlbl.tintColor=[UIColor whiteColor];
    _detailstabletitleview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
   _documentlisttable.layer.borderColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _doctabletitleview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _documentlisttable.layer.borderWidth=3.0f;
      _maritalarray=[[NSMutableArray alloc]initWithObjects:@"SINGLE",@"MARRIED",@"DIVORCED", nil];
    _maritalkeyarray=[[NSMutableArray alloc]initWithObjects:@"1",@"2",@"3", nil];
    _maritaldict=[[NSMutableDictionary alloc]initWithObjects:_maritalarray forKeys:_maritalkeyarray];
    _payementtypearray=[[NSMutableArray alloc]initWithObjects:@"Check",@"Direct Deposit",@"Paysource Card", nil];
     _maritalkeyarray=[[NSMutableArray alloc]initWithObjects:@"1",@"2",@"3", nil];
    _paymenttypedict=[[NSMutableDictionary alloc]initWithObjects:_payementtypearray forKeys:_maritalkeyarray];

   
    // Do any additional setup after loading the view from its nib.
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
    
    if(tableView==_detailstablview)
    {
         return 5;
    }
    if(tableView==_documentlisttable)
    {
        return [_docmntdict count];
    }
    if (tableView==_popOverTableView) {
        if (poptype==1) {
              return [_maritalarray count];
        }
      
        if (poptype==2) {
            return [_payementtypearray count];
        }
    }
    return YES;
   
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.textLabel.font = [UIFont fontWithName:@"Helvetica Neue Light" size:12];
        cell.textLabel.font = [UIFont systemFontOfSize:12.0];

        if(tableView==_detailstablview)
        {
            [[NSBundle mainBundle]loadNibNamed:@"proHRDetailcell" owner:self options:nil];
            cell=_detailscell;
        }
        if(tableView==_documentlisttable)
        {
            [[NSBundle mainBundle]loadNibNamed:@"customdoccell" owner:self options:nil];
            cell=_doccell;
        }
    
    if (tableView==_popOverTableView) {
        if (poptype==1) {
            cell.textLabel.font = [UIFont fontWithName:@"Helvetica Neue Light" size:12];
            cell.textLabel.font = [UIFont systemFontOfSize:12.0];
            cell.textLabel.text=[_maritalarray objectAtIndex:indexPath.row];

            
                    }
        
        if (poptype==2) {
            
            
            cell.textLabel.text=[_payementtypearray objectAtIndex:indexPath.row];

                   }

           }
    }
    if(tableView==_documentlisttable){
        NSArray*namearry=[_docmntdict allKeys];
        _docnamelbl=(UILabel *)[cell viewWithTag:1];
        _docnamelbl.text=[namearry objectAtIndex:indexPath.row];
           button=(UIButton *)[cell viewWithTag:4];
        
        
    }

    
    return cell;
}

#pragma mark - Table View delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tableView==_popOverTableView){
         if (poptype==1) {
        
        //_maritalbtn.titleLabel.text=[_maritalarray objectAtIndex:indexPath.row];
             [ _maritalbtn  setTitle:[_maritalarray objectAtIndex:indexPath.row] forState:UIControlStateNormal];

             
         }
        
        if (poptype==2) {
            
            
           // _paymenttypebtn.titleLabel.text=[_payementtypearray objectAtIndex:indexPath.row];
            [_paymenttypebtn  setTitle:[_payementtypearray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
            
            switch (indexPath.row) {
                case 0:
                    _instnname.enabled=NO;
                    _Accuntnumbr.enabled=NO;
                    _typesegmntlbl.enabled=NO;
                    _rontgnumbr.enabled=NO;
                    _citytxt.enabled=NO;
                    _statelbl.enabled=NO;
                    _cardnumbtxtfld.enabled=NO;
                    _cardroutdno.enabled=NO;
                    _expbtn.enabled=NO;
                    break;
                case 1:
                    _instnname.enabled=YES;
                    _Accuntnumbr.enabled=YES;
                    _typesegmntlbl.enabled=YES;
                    _rontgnumbr.enabled=YES;
                    _citytxt.enabled=YES;
                    _statelbl.enabled=YES;
                    _cardnumbtxtfld.enabled=NO;
                    _cardroutdno.enabled=NO;
                    _expbtn.enabled=NO;
                    break;

                case 2:
                    _instnname.enabled=NO;
                    _Accuntnumbr.enabled=NO;
                    _typesegmntlbl.enabled=NO;
                    _rontgnumbr.enabled=NO;
                    _citytxt.enabled=NO;
                    _statelbl.enabled=NO;
                    _cardnumbtxtfld.enabled=YES;
                    _cardroutdno.enabled=YES;
                    _expbtn.enabled=YES;
                    break;

                    
                default:
                    break;
            }
            
        }
        

    }
        
        
    
    
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle==UITableViewCellEditingStyleDelete) {
        }
    
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //alternating cell back ground color
    if(tableView==_detailstablview||tableView==_documentlisttable)
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

#pragma mark-Webservice

-(void)UpdateW4{
    recordResults=FALSE;
    NSString *soapMessage;
    
    Empdetails *empdmdl=(Empdetails *)[_Applicantarray objectAtIndex:0];
    NSInteger martid=[[_maritaldict objectForKey:_maritalbtn.titleLabel.text]integerValue];
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UpdateW4 xmlns=\"http://test2.kontract360.com/\">\n"
                   "<appid>%d</appid>\n"
                   "<dependent>%d</dependent>\n"
                   "<mart>%d</mart>\n"
                   "</UpdateW4>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",empdmdl.applicantid,[_Dependentstexffld.text integerValue],martid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    NSURL *url = [NSURL URLWithString:@"http://test2.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test2.kontract360.com/UpdateW4" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)UpdateDirectDeposit{
    
    recordResults=FALSE;
    Empdetails *empdmdl=(Empdetails *)[_Applicantarray objectAtIndex:0];
    NSInteger paymnt=[[_paymenttypedict objectForKey:_paymenttypebtn.titleLabel.text]integerValue];
    NSInteger type = 0;

    if (_typesegmntlbl.selectedSegmentIndex==0) {
        type=1;
        
    }
    else{
        type=2;
    }
    
    NSString *date1 =_expbtn.titleLabel.text;
    NSLog(@"s%@",date1);
    if ([date1 isEqualToString:@"select"]) {
         date1 =@"01/01/1900";
        
    }

    NSDateFormatter *dateFormat1 = [[NSDateFormatter alloc] init];
    [dateFormat1 setDateFormat:@"MM/dd/yyyy"];
    NSDate *dates = [dateFormat1 dateFromString:date1];
    NSLog(@"s%@",dates);
    NSDateFormatter *dateFormat2 = [[NSDateFormatter alloc]init];
    [dateFormat2 setDateFormat: @"yyyy-MM-dd"];
    
    dateString = [dateFormat2 stringFromDate:dates];
    
    NSString *soapMessage;
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UpdateDirectDeposit xmlns=\"http://test2.kontract360.com/\">\n"
                   "<appid>%d</appid>\n"
                   "<payment>%d</payment>\n"
                   "<fname>%@</fname>\n"
                   "<fac>%@</fac>\n"
                   "<type1>%d</type1>\n"
                   "<froute>%@</froute>\n"
                   "<card>%@</card>\n"
                   "<croute>%@</croute>\n"
                   "<exp>%@</exp>\n"
                   "</UpdateDirectDeposit>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",empdmdl.applicantid,paymnt,_instnname.text,_Accuntnumbr.text,type,_rontgnumbr.text,_cardnumbtxtfld.text,_cardroutdno.text,dateString];
        NSLog(@"soapmsg%@",soapMessage);
    
    
    NSURL *url = [NSURL URLWithString:@"http://test2.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test2.kontract360.com/UpdateDirectDeposit" forHTTPHeaderField:@"Soapaction"];
    
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

-(void)UploadHRDocsImage{
    recordResults=FALSE;
    NSString *soapMessage;
    
    Empdetails *empdmdl=(Empdetails *)[_Applicantarray objectAtIndex:0];
    
    NSString *imagename;
    imagename=[NSString stringWithFormat:@"Photo_%@.jpg",_documentnametextfld.text];
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UploadHRDocsImage xmlns=\"http://test2.kontract360.com/\">\n"
                   "<f>%@</f>\n"
                   "<fileName>%@</fileName>\n"
                   "<appid>%d</appid>\n"
                   "<doctitle>%@</doctitle>\n"
                   "</UploadHRDocsImage>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_encodedString,imagename,empdmdl.applicantid,_documentnametextfld.text];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    NSURL *url = [NSURL URLWithString:@"http://test2.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test2.kontract360.com/UploadHRDocsImage" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)SelectHRDocs{
    recordResults=FALSE;
    NSString *soapMessage;
    
    Empdetails *empdmdl=(Empdetails *)[_Applicantarray objectAtIndex:0];
    
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SelectHRDocs xmlns=\"http://test2.kontract360.com/\">\n"
              
                   "<appid>%d</appid>\n"
                  "</SelectHRDocs>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",empdmdl.applicantid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    NSURL *url = [NSURL URLWithString:@"http://test2.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test2.kontract360.com/SelectHRDocs" forHTTPHeaderField:@"Soapaction"];
    
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
    
    [_popOverTableView reloadData];
    [_documentlisttable reloadData];
    
}
#pragma mark - XMLParser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"SelectHRDocsResult"])
    {
        _docmntdict=[[NSMutableDictionary alloc]init];           
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"DocumentTitle"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"DocumentName"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }

    if([elementName isEqualToString:@"url"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"UploadHRDocsImageResult"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"result"])
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
    if([elementName isEqualToString:@"DocumentTitle"])
    {
       
        recordResults = FALSE;
        _docname=_soapResults;
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"DocumentName"])
    {
        recordResults = FALSE;
      _soapResults = nil;
    }
    if([elementName isEqualToString:@"url"])
    {
        recordResults = FALSE;
        [_docmntdict setObject:_soapResults forKey:_docname];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"result"])
    {
        
        recordResults = FALSE;
        UIAlertView *alertview=[[UIAlertView alloc]initWithTitle:nil message:_soapResults delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [alertview show];
        _documentnametextfld.text=@"";
        [self SelectHRDocs];
        _soapResults = nil;
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
    calendar.delegate =(id) self;
    
    
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
    calendar.maximumDate = [self.dateFormatter dateFromString:@"1/07/2019"];
    calendar.shouldFillCalendar = YES;
    calendar.adaptHeightToNumberOfWeeksInMonth = NO;
    
    calendar.frame = CGRectMake(10, 10, 300, 320);
    [popoverView addSubview:calendar];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(localeDidChange) name:NSCurrentLocaleDidChangeNotification object:nil];
    
    
    //create a popover controller
    self.popOverController = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    [self.popOverController presentPopoverFromRect:_expbtn.frame
                                            inView:self.paymentdetailview
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
[_expbtn setTitle:dateString forState:UIControlStateNormal];}




#pragma mark-Button Action
-(IBAction)selectmaritalstatus:(id)sender
{
    poptype=1;
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 160, 90)];
    
    popoverView.backgroundColor = [UIColor whiteColor];
    _popOverTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 160, 90)];
    
    _popOverTableView.delegate=(id)self;
    _popOverTableView.dataSource=(id)self;
    _popOverTableView.rowHeight= 32;
    _popOverTableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    
    
    [popoverView addSubview:_popOverTableView];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(160, 90);
    
    //create a popover controller
    
    self.popOverController = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    
    
        
    
    
    [self.popOverController presentPopoverFromRect:_maritalbtn.frame
                                            inView:self.w4detailview
                          permittedArrowDirections:UIPopoverArrowDirectionUp
                                          animated:YES];
    

}


- (IBAction)expbtn:(id)sender {
    dateString=@"01/01/1900";
    [self createCalenderPopover];
}

- (IBAction)statebtn:(id)sender {
}

- (IBAction)typesegmnt:(id)sender {
}

-(IBAction)selectpaymenttype:(id)sender
{
    poptype=2;
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 160, 90)];
    
    popoverView.backgroundColor = [UIColor whiteColor];
    _popOverTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 160, 90)];
    
    _popOverTableView.delegate=(id)self;
    _popOverTableView.dataSource=(id)self;
    _popOverTableView.rowHeight= 32;
    _popOverTableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    
    
    [popoverView addSubview:_popOverTableView];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(160, 90);
    
    //create a popover controller
    
    self.popOverController = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    
    
    
    
    
    [self.popOverController presentPopoverFromRect:_paymenttypebtn.frame
                                            inView:self.paymentdetailview
                          permittedArrowDirections:UIPopoverArrowDirectionUp
                                          animated:YES];

}

- (IBAction)savebtn:(id)sender {
    [self UpdateDirectDeposit];
}

- (IBAction)detailclsebtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(IBAction)selectfileaction:(id)sender{
    if ([UIImagePickerController isSourceTypeAvailable:
         UIImagePickerControllerSourceTypeCamera])
    {
        
        
        UIImagePickerController *imagePicker =
        [[UIImagePickerController alloc] init];
        imagePicker.delegate =(id) self;
        imagePicker.sourceType =
        UIImagePickerControllerSourceTypeCamera;
        imagePicker.showsCameraControls=YES;
        
        imagePicker.mediaTypes = [NSArray arrayWithObjects:
                                  (NSString *) kUTTypeImage,
                                  nil];
        imagePicker.allowsEditing = NO;
        // imagePicker.cameraCaptureMode=YES;
        [self presentViewController:imagePicker animated:YES completion:nil];
        _newMedia = YES;
    }
}
#pragma mark-ImagePicker
-(void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    // [self.popoverController dismissPopoverAnimated:true];
    NSString *mediaType = [info
                           objectForKey:UIImagePickerControllerMediaType];
    
    
    
    
    if ([mediaType isEqualToString:(NSString *)kUTTypeImage]) {
        UIImage *image = [info
                          objectForKey:UIImagePickerControllerOriginalImage];
        NSLog(@"dict%@",info);
    
        
        _previewimg.image=nil;
        _previewimg.image=image;
      
        [self dismissViewControllerAnimated:YES completion:nil];
        if (_newMedia)
            UIImageWriteToSavedPhotosAlbum(image,
                                           self,
                                           @selector(image:finishedSavingWithError:contextInfo:),
                                           nil);
    }
    
    
    
}

-(void)image:(UIImage *)image
finishedSavingWithError:(NSError *)error
 contextInfo:(void *)contextInfo
{
    if (error) {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle: @"Save failed"
                              message: @"Failed to save image"
                              delegate: nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
        [alert show];
    }
    
    else{
        
        [self dismissViewControllerAnimated:YES completion:nil];
        
    }
}
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

    
    
    
    

-(IBAction)updatedoc:(id)sender{
    UIImage *imagename =_previewimg.image;
    NSData *data = UIImageJPEGRepresentation(imagename, 1.0);
    _encodedString = [data base64EncodedString];
    
    [self UploadHRDocsImage];
    
}
- (IBAction)DetailsBtnAction:(id)sender
{
    _detailbtnlbl.tintColor=[UIColor whiteColor];
       _docubtnlbl.tintColor=[UIColor blackColor];
       _w4btnlbl.tintColor=[UIColor blackColor];
       _paymntbtnlbl.tintColor=[UIColor blackColor];
    
    _detailsaddview.hidden=NO;
    _w4detailview.hidden=YES;
    _paymentdetailview.hidden=YES;
    _dcmntdetailview.hidden=YES;
}

- (IBAction)DcmntBtnAction:(id)sender
{
    _detailbtnlbl.tintColor=[UIColor blackColor];
    _docubtnlbl.tintColor=[UIColor whiteColor];
    _w4btnlbl.tintColor=[UIColor blackColor];
    _paymntbtnlbl.tintColor=[UIColor blackColor];
    
    [self SelectHRDocs];
    _dcmntdetailview.hidden=NO;
    _w4detailview.hidden=YES;
    _detailsaddview.hidden=YES;
    _paymentdetailview.hidden=YES;
}

- (IBAction)w4BtnAction:(id)sender
{
    _detailbtnlbl.tintColor=[UIColor blackColor];
    _docubtnlbl.tintColor=[UIColor blackColor];
    _w4btnlbl.tintColor=[UIColor whiteColor];
    _paymntbtnlbl.tintColor=[UIColor blackColor];

    _w4detailview.hidden=NO;
    _detailsaddview.hidden=YES;
    _paymentdetailview.hidden=YES;
    _dcmntdetailview.hidden=YES;
       
}

- (IBAction)paymentbtnaction:(id)sender
{
    _detailbtnlbl.tintColor=[UIColor blackColor];
    _docubtnlbl.tintColor=[UIColor blackColor];
    _w4btnlbl.tintColor=[UIColor blackColor];
    _paymntbtnlbl.tintColor=[UIColor whiteColor];

    _paymentdetailview.hidden=NO;
    _w4detailview.hidden=YES;
    _detailsaddview.hidden=YES;
    _dcmntdetailview.hidden=YES;
    
}
-(IBAction)editdetails:(id)sender
{
    _editview.hidden=NO;
}
-(IBAction)closeeditview:(id)sender
{
    _editview.hidden=YES;
}

-(IBAction)cancelrequirement:(id)sender{
    
}
- (IBAction)w4savebtn:(id)sender {
    [self UpdateW4];
    
    }
- (IBAction)showbtn:(id)sender {
    
    button = (UIButton *)sender;
    CGPoint center= button.center;
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.documentlisttable];
   NSIndexPath *textFieldIndexPath = [self.documentlisttable indexPathForRowAtPoint:rootViewPoint];
   NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
    NSArray *newnamearry=[_docmntdict allKeys];
    urlstring=[_docmntdict objectForKey:[newnamearry objectAtIndex:textFieldIndexPath.row]];


    if (!_webVCtrl) {
        self.webVCtrl=[[WebViewController alloc]initWithNibName:@"WebViewController" bundle:nil];
    }
    _webVCtrl.modalPresentationStyle=UIModalPresentationPageSheet;
    _webVCtrl.urlstring=urlstring;
    [self presentViewController:_webVCtrl
                       animated:YES completion:NULL];
    

    
}
@end
