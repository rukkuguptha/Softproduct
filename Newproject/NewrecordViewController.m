//
//  NewrecordViewController.m
//  Newproject
//
//  Created by GMSIndia1 on 2/19/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "NewrecordViewController.h"

@interface NewrecordViewController ()

@end

@implementation NewrecordViewController

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
    
    //_navbar.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark-webservice
-(void)InsertSitevisitProductionRates{
    recordResults = FALSE;
      
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<InsertSitevisitProductionRates xmlns=\"http://ios.kontract360.com/\">\n"
                   "<rate>%@</rate>\n"
                   "<description>%@</description>\n"
                   "<value>%f</value>\n"
                   "<planId>%@</planId>\n"
                   "</InsertSitevisitProductionRates>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_ratetxtfld.text,_descptntxtfld.text,[_valuetxtfld.text doubleValue],_companyid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://ios.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/InsertSitevisitProductionRates" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)SitevisitInsertjobsiterequirements{
    recordResults = FALSE;
    
    NSString *soapMessage;
    NSInteger typeid=[[_JobtypeDic objectForKey:_typeidbtnlbl.titleLabel.text]integerValue];
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SitevisitInsertjobsiterequirements xmlns=\"http://ios.kontract360.com/\">\n"
                   "<name>%@</name>\n"
                   "<code>%@</code>\n"
                   "<typeId>%d</typeId>\n"
                   "<cost>%f</cost>\n"
                   "<planId>%@</planId>\n"
                   "</SitevisitInsertjobsiterequirements>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_jobnametxtfld.text,_jobcodetxtfld.text,typeid,[_jobcosttxtfld.text floatValue],_companyid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://ios.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/SitevisitInsertjobsiterequirements" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)SelectAllItemType{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SelectAllItemType xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</SelectAllItemType>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.1/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://ios.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/SelectAllItemType" forHTTPHeaderField:@"Soapaction"];
    
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
    
}
#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"SelectAllItemTypeResponse"])
    {
        _JobtypeDic=[[NSMutableDictionary alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"entry_id"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"itemtypename"])
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
    if([elementName isEqualToString:@"entry_id"])
    {
        
        recordResults = FALSE;
        jobtypeitm=_soapResults;
        
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"itemtypename"])
    {
        recordResults = FALSE;
        [_JobtypeDic setObject:jobtypeitm forKey:_soapResults];
        
        
        _soapResults = nil;
    }

    
}

#pragma mark-popover
-(void)createpopover{
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 120, 120)];
    
    popoverView.backgroundColor = [UIColor whiteColor];
    _popOverTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 120, 120)];
    
    _popOverTableView.delegate=(id)self;
    _popOverTableView.dataSource=(id)self;
    _popOverTableView.rowHeight= 32;
    _popOverTableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    
    
    // CGRect rect = frame;
    [popoverView addSubview:_popOverTableView];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(120, 120);
    
    //create a popover controller
    
    self.popOverController = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    
    //
    //    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    //    CGRect rect=CGRectMake(cell.bounds.origin.x+90, cell.bounds.origin.y+10, 50, 30);
    //    [self.popOverController presentPopoverFromRect:_disclsurelbl.bounds inView:self.view permittedArrowDirections:nil animated:YES];
    
    
    
    
    
    
    [self.popOverController presentPopoverFromRect:_typeidbtnlbl.frame
                                            inView:self.view
                          permittedArrowDirections:UIPopoverArrowDirectionUp
                                          animated:YES];
    

}
#pragma mark-Tableview Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
     if (tableView==_popOverTableView) {
        return [_JobtypeDic count];
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
        cell.textLabel.font=[UIFont systemFontOfSize:12];
    }
    
    if (tableView==_popOverTableView){
        NSArray *array1=[_JobtypeDic allKeys];
        cell.textLabel.text=[array1 objectAtIndex:indexPath.row];
        
    }
           return cell;
}

#pragma mark-Tableview Datasource
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
       if (tableView==_popOverTableView){
            NSArray *array1=[_JobtypeDic allKeys];
           [_typeidbtnlbl setTitle:[array1 objectAtIndex:indexPath.row] forState:UIControlStateNormal];
      
       }
    

}


- (IBAction)clsebtn:(id)sender {
    //[self.navigationController popViewControllerAnimated:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)updatepratebtn:(id)sender {
    [self InsertSitevisitProductionRates];
}

- (IBAction)pratecancel:(id)sender {
}
- (IBAction)typeidbtn:(id)sender {
    [self createpopover];
    [self SelectAllItemType];
}

- (IBAction)jobupdatebtn:(id)sender {
    [self SitevisitInsertjobsiterequirements];
}

- (IBAction)cancelbtn:(id)sender {
}
@end
