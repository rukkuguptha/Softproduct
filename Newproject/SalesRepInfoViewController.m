//
//  SalesRepInfoViewController.m
//  Newproject
//
//  Created by GMSIndia 2 on 20/06/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import "SalesRepInfoViewController.h"

@interface SalesRepInfoViewController ()

@end

@implementation SalesRepInfoViewController

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
        _scroll.frame=CGRectMake(0, 0, 1024,708);
    [_scroll setContentSize:CGSizeMake(1024,760)];
    _infoview.backgroundColor=[UIColor colorWithRed:227.0/255.0f green:240.0/255.0f blue:247.0/255.0f alpha:1.0f];
   // self.navbar.tintColor=[UIColor colorWithRed:227.0/255.0f green:240.0/255.0f blue:247.0/255.0f alpha:1.0f];
    _salesRepTable.layer.borderWidth=2;
    _salesRepTable.layer.borderColor= [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self CustomerSalesRepInfoselect];

    
//    UIBarButtonItem*addbtn=[[UIBarButtonItem alloc]initWithTitle:@"Add" style:UIBarButtonItemStylePlain target:self action:@selector(addaction)];
//    UIBarButtonItem*editbtn=[[UIBarButtonItem alloc]initWithTitle:@"Delete" style:UIBarButtonItemStylePlain target:self action:@selector(editaction)];
//    NSArray*barbutns=[[NSArray alloc]initWithObjects:addbtn,editbtn, nil];
//    [self.navigationItem setRightBarButtonItems:barbutns animated:YES];
//    _addView.hidden=YES;
    
    
}
-(void)editaction
{
    if ([self.salesRepTable isEditing]) {
        // If the tableView is already in edit mode, turn it off. Also change the title of the button to reflect the intended verb (‘Edit’, in this case).
        
        [self.salesRepTable setEditing:NO animated:YES];
        //[_Editbtn setTitle:@"Edit"forState:UIControlStateNormal];
    }
    else {
        // [_Editbtn setTitle:@"Done"forState:UIControlStateNormal];
        
        // Turn on edit mode
        
        [self.salesRepTable setEditing:YES animated:YES];
    }
    
}

//-(void)addaction
//{
//    _addView.hidden=NO;
//}
//- (IBAction)editcellbtn:(id)sender
//{
//    _addView.hidden=NO;
//}
-(IBAction)closetheView:(id)sender
{
    self.addView.hidden=YES;
   
}
- (IBAction)editsalesaction:(id)sender
{
    _addView.hidden=NO;
    _navbar.title=@"EDIT";
    optionidentifier=2;
}
- (IBAction)addsalesaction:(id)sender
{
    _addView.hidden=NO;
     _navbar.title=@"ADD";
    optionidentifier=1;
}
- (IBAction)deletesalesaction:(id)sender
{
    if ([self.salesRepTable isEditing]) {
        // If the tableView is already in edit mode, turn it off. Also change the title of the button to reflect the intended verb (‘Edit’, in this case).
        
        [self.salesRepTable setEditing:NO animated:YES];
        //[_Editbtn setTitle:@"Edit"forState:UIControlStateNormal];
    }
    else {
        // [_Editbtn setTitle:@"Done"forState:UIControlStateNormal];
        
        // Turn on edit mode
        
        [self.salesRepTable setEditing:YES animated:YES];
    }
 
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_salesarray count];
    // Return the number of rows in the section.
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
                   [[NSBundle mainBundle]loadNibNamed:@"RepSalescell" owner:self options:nil];
                    cell=_salescell;
        
        
        
    }
    
    
    Rsalesmdl*rmdl=(Rsalesmdl *)[_salesarray objectAtIndex:indexPath.row];
    _custcodelabel=(UILabel*)[cell viewWithTag:1];
    _custcodelabel.text=rmdl.CustomerCode;
    _empidlabel=(UILabel*)[cell viewWithTag:2];
    _empidlabel.text=rmdl.EmpId;
    _namelabel=(UILabel*)[cell viewWithTag:3];
    _namelabel.text=rmdl.EmpName;
    _phonelabel=(UILabel*)[cell viewWithTag:4];
    _phonelabel.text=rmdl.PhoneOffice;
    _extensionlabel=(UILabel*)[cell viewWithTag:5];
    _extensionlabel.text=rmdl.Extension;
    _mobilelabel=(UILabel*)[cell viewWithTag:6];
    _mobilelabel.text=rmdl.Mobile;
    _email=(UILabel*)[cell viewWithTag:7];
    _email.text=rmdl.Email;

    
    
    return cell;
    
    
}
-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    
    
}
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


- (IBAction)closesalesreppage:(id)sender {
    [self dismissViewControllerAnimated:YES completion:NULL];
}
#pragma mark-Webservices
-(void)CustomerSalesRepInfoselect
{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<CustomerSalesRepInfoselect xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</CustomerSalesRepInfoselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.1/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://ios.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/CustomerSalesRepInfoselect" forHTTPHeaderField:@"Soapaction"];
    
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
	
	
	if( _xmlparser )
	{
		
	}
	
	_xmlparser = [[NSXMLParser alloc] initWithData: _webData];
	[_xmlparser setDelegate:(id)self];
	[_xmlparser setShouldResolveExternalEntities: YES];
	[_xmlparser parse];
    [_salesRepTable reloadData];
    if (webtype==1||webtype==2) {
        [self CustomerSalesRepInfoselect];
        webtype=0;
    }
    
}
#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict
{
    if ([elementName isEqualToString:@"CustomerSalesRepInfoselectResult"]) {
        _salesarray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"EntryId"]) {
        
        if(!_soapResults)
        {
            _soapResults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    
    if ([elementName isEqualToString:@"CustomerCode"]) {
        if(!_soapResults)
        {
            _soapResults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    
    if ([elementName isEqualToString:@"EmpId"]) {
        if(!_soapResults)
        {
            _soapResults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    
    if ([elementName isEqualToString:@"EmpName"]) {
        if(!_soapResults)
        {
            _soapResults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    
    if ([elementName isEqualToString:@"PhoneOffice"]) {
        
        if(!_soapResults)
        {
            _soapResults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"Extension"]) {
        
        if(!_soapResults)
        {
            _soapResults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"Mobile"]) {
        
        if(!_soapResults)
        {
            _soapResults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }if ([elementName isEqualToString:@"Email"]) {
        
        if(!_soapResults)
        {
            _soapResults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    
    

}
-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    
    
    
	if( recordResults)
        
	{
        
        
		[_soapResults appendString: string];
    }
}
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    
    if ([elementName isEqualToString:@"EntryId"]) {
        _rmodel=[[Rsalesmdl alloc]init];
        recordResults=FALSE;
        _rmodel.entryid=[_soapResults integerValue];
        _soapResults=nil;
    }
    if ([elementName isEqualToString:@"CustomerCode"]) {
       
        recordResults=FALSE;
        _rmodel.CustomerCode=_soapResults;
        _soapResults=nil;
    }
    if ([elementName isEqualToString:@"EmpId"]) {
        
        recordResults=FALSE;
        _rmodel.EmpId=_soapResults;
        _soapResults=nil;
    }
    if ([elementName isEqualToString:@"EmpName"]) {
        
        recordResults=FALSE;
        _rmodel.EmpName=_soapResults;
        _soapResults=nil;
    }
    if ([elementName isEqualToString:@"PhoneOffice"]) {
       
        recordResults=FALSE;
        _rmodel.PhoneOffice=_soapResults;
        _soapResults=nil;
    }
    if ([elementName isEqualToString:@"Extension"]) {
        
        recordResults=FALSE;
        _rmodel.Extension=_soapResults;
        _soapResults=nil;
    }
    if ([elementName isEqualToString:@"Mobile"]) {
        recordResults=FALSE;
        _rmodel.Mobile=_soapResults;
        _soapResults=nil;
    }
    if ([elementName isEqualToString:@"Email"]) {
        recordResults=FALSE;
        _rmodel.Email=_soapResults;
        [_salesarray addObject:_rmodel];
        _soapResults=nil;
    }
    





}
@end
