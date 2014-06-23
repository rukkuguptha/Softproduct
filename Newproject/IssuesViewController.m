//
//  IssuesViewController.m
//  Newproject
//
//  Created by Riya on 6/20/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "IssuesViewController.h"

@interface IssuesViewController ()

@end

@implementation IssuesViewController

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
    _issuetable.layer.borderWidth=3.0;
    _issuetable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f].CGColor;
    _titleview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f];

}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self IssueManagementSelect];
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
    
    // Return the number of rows in the section.
    
    return [_Issuearray count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
         [[NSBundle mainBundle]loadNibNamed:@"IssueCell" owner:self options:nil];
         cell=_issuecell;
        
    }
    
    Issuemdl*issues=(Issuemdl *)[_Issuearray objectAtIndex:indexPath.row];
    _numbrlbl=(UILabel *)[cell viewWithTag:1];
    
    _numbrlbl.text=issues.jobnumbr;
  
    _datelbl=(UILabel *)[cell viewWithTag:2];
    _datelbl.text=issues.datetime;
    _typelbl=(UILabel *)[cell viewWithTag:3];
    _typelbl.text=issues.type;
    _cmmtlbl=(UILabel *)[cell viewWithTag:4];
    _cmmtlbl.text=issues.comments;
    
    return cell;
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
  
    
}
#pragma mark-Web Service
-(void)IssueManagementSelect{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<IssueManagementSelect xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</IssueManagementSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.100/service.asmx"];
    //  NSURL *url = [NSURL URLWithString:@"http://test3.kontract360.com/service.asmx"];;
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/IssueManagementSelect" forHTTPHeaderField:@"Soapaction"];
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
      [_issuetable reloadData];
    
}
#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"IssueManagementSelectResponse"])
    {
        _Issuearray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"IMEntryId"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"IMItemCode"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"IMJobNumber"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"IMDateTime"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"IMType"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"IMRelatedTo"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"IMComments"])
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
    if([elementName isEqualToString:@"IMEntryId"])
    {
        
        
        _issuemdl=[[Issuemdl alloc]init];
        recordResults = FALSE;
        _issuemdl.entryid=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"IMItemCode"])
    {
        
        
        recordResults = FALSE;
        _issuemdl.itemcode=_soapResults;
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"IMJobNumber"])
    {
        
        
        recordResults = FALSE;
        _issuemdl.jobnumbr=_soapResults;
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"IMDateTime"])
    {
        
        
        recordResults = FALSE;
        NSArray *dateArray=[[NSArray alloc]init];
        dateArray=[_soapResults componentsSeparatedByString:@" "];
        NSString *date1 =[dateArray objectAtIndex:0];
//        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
//        [dateFormat setDateFormat:@"yyyy-MM-dd"];
//        NSDate *dates = [dateFormat dateFromString:date1];
//        [dateFormat setDateFormat:@"MM-dd-yyy"];
//        NSString *myFormattedDate = [dateFormat stringFromDate:dates];

         _issuemdl.datetime=date1;
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"IMType"])
    {
        
        
        recordResults = FALSE;
        _issuemdl.type=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"IMRelatedTo"])
    {
        
        recordResults = FALSE;
        
        
       _issuemdl.relatedto=_soapResults;
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"IMComments"])
    {
        
        
        recordResults = FALSE;
        _issuemdl.comments=_soapResults;
        [_Issuearray addObject:_issuemdl];

        _soapResults = nil;
    }
  }
#pragma mark-Button Action
- (IBAction)addbtn:(id)sender {
}

- (IBAction)deletebtn:(id)sender {
}

- (IBAction)editbtn:(id)sender {
}

- (IBAction)clsebtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
