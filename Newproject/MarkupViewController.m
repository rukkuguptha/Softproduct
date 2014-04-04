//
//  MarkupViewController.m
//  Newproject
//
//  Created by GMSIndia1 on 3/12/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "MarkupViewController.h"

@interface MarkupViewController ()

@end

@implementation MarkupViewController

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
      self.markuptableviewtitle.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:251.0/255.0f alpha:1.0f];
    _markuptable.layer.borderWidth=2;
    _markuptable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:251.0/255.0f alpha:1.0f].CGColor;
    // Do any additional setup after loading the view from its nib.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self SelectMarkupMaster];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)closemarkuppage:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}
-(IBAction)markupselection:(id)sender
{
    [self createpopover];
}

-(void)createpopover
{
    UIViewController *popovercontent=[[UIViewController alloc]init];
    UIView *popoverview=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 210, 200)];
    popoverview.backgroundColor=[UIColor whiteColor];
    _popovertableview=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 210, 200)];
    _popovertableview.delegate=(id)self;
    _popovertableview.dataSource=(id)self;
    _popovertableview.rowHeight=32;
    _popovertableview.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    [popoverview addSubview:_popovertableview];
    popovercontent.view=popoverview;
    popovercontent.contentSizeForViewInPopover=CGSizeMake(210, 200);
    self.popovercontroller=[[UIPopoverController alloc]initWithContentViewController:popovercontent];
    [self.popovercontroller presentPopoverFromRect:_markupbutton.frame inView:self.scroll permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];

}
#pragma mark-Tableview datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView==_popovertableview) {
        return 1;
    }
    // Return the number of sections.
  
       return YES;

}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView==_popovertableview) {
        return [_markuparray count];
    }
    if (tableView==_markuptable) {
        return [_markuptablearray count];
    }
           return YES;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    if (tableView==_markuptable) {
        [[NSBundle mainBundle]loadNibNamed:@"markupcell" owner:self options:nil];
        cell=_markupcell;
    }
    
    
    
    if (tableView==_popovertableview)
    {
        cell.textLabel.font = [UIFont fontWithName:@"Helvetica Neue Light" size:12];
        cell.textLabel.font = [UIFont systemFontOfSize:12.0];
        cell.textLabel.text=[NSString stringWithFormat:@"%@",[_markuparray objectAtIndex:indexPath.row]];
        
    }
    if (tableView==_markuptable)
    {
        Matrixmark *markmdl=(Matrixmark*)[_markuptablearray objectAtIndex:indexPath.row];
        _markupnamelabel=(UILabel*)[cell viewWithTag:1];
        _markupnamelabel.text=markmdl.MainHeader;
        _stpercentlabel=(UILabel*)[cell viewWithTag:2];
        _stpercentlabel.text=markmdl.STPer;
        _stdollerlabel=(UILabel*)[cell viewWithTag:3];
        _stdollerlabel.text=markmdl.VeriablePercent;
        _otpercentlabel=(UILabel*)[cell viewWithTag:4];
        _otpercentlabel.text=markmdl.OTPer;
        _otdollerlabel=(UILabel*)[cell viewWithTag:5];
        _otdollerlabel.text=markmdl.OTDoll;
        _fixeddollerlabel=(UILabel*)[cell viewWithTag:4];
        _fixeddollerlabel.text=markmdl.FixedDollar;
        _variablepercentlabel=(UILabel*)[cell viewWithTag:5];
        _variablepercentlabel.text=markmdl.VeriablePercent;

    }

    
    
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView==_popovertableview)
    {
        [_markupbutton setTitle:[_markuparray objectAtIndex:indexPath.row]forState:UIControlStateNormal];
        mark=[_markuparray objectAtIndex:indexPath.row];
    }
    [self.popovercontroller dismissPopoverAnimated:YES];
    [self Markupmain];
    
}

#pragma mark-Webservices
-(void)SelectMarkupMaster
{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SelectMarkupMaster xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</SelectMarkupMaster>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.1/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://ios.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/SelectMarkupMaster" forHTTPHeaderField:@"Soapaction"];
    
    [theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    
    if( theConnection )
    {
        _webdata = [NSMutableData data];
    }
    else
    {
        ////NSLog(@"theConnection is NULL");
    }
    
    
}
-(void)Markupmain
{
    
    NSString *markupid=[_markupdict objectForKey:mark];
    NSLog(@"%@",mark);
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<Markupmain xmlns=\"http://ios.kontract360.com/\">\n"
                   "<MarkupID>%d</MarkupID>\n"
                   "</Markupmain>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[markupid integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.1/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://ios.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/Markupmain" forHTTPHeaderField:@"Soapaction"];
    
    [theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    
    if( theConnection )
    {
        _webdata = [NSMutableData data];
    }
    else
    {
        ////NSLog(@"theConnection is NULL");
    }
    
    
}

#pragma mark - Connection
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
	[_webdata setLength: 0];
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
   	[_webdata appendData:data];
}
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    UIAlertView *  Alert=[[UIAlertView alloc]initWithTitle:nil message:@"ERROR with the Connection" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    
    [Alert show];
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"DONE. Received Bytes: %d", [_webdata length]);
	NSString *theXML = [[NSString alloc] initWithBytes: [_webdata mutableBytes] length:[_webdata length] encoding:NSUTF8StringEncoding];
	NSLog(@"xml===== %@",theXML);
	
	
	if( _xmlparser )
	{
		
	}
	
	_xmlparser = [[NSXMLParser alloc] initWithData: _webdata];
	[_xmlparser setDelegate:(id)self];
	[_xmlparser setShouldResolveExternalEntities: YES];
	[_xmlparser parse];
    [_popovertableview reloadData];
    [_markuptable reloadData];
    
}
#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict
{
    if ([elementName isEqualToString:@"SelectMarkupMasterResult"])
    {
        _markuparray=[[NSMutableArray alloc]init];
        _markupdict=[[NSMutableDictionary alloc]init];
        if(!_soapresults)
        {
            _soapresults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"MarkupEntryId"])
    {
        
        if(!_soapresults)
        {
            _soapresults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    
    if ([elementName isEqualToString:@"MarkUpName"])
    {
        
        if(!_soapresults)
        {
            _soapresults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"CompanyStd"])
    {
        
        if(!_soapresults)
        {
            _soapresults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"MarkupmainResult"])
    {
        _markuptablearray=[[NSMutableArray alloc]init];
        if(!_soapresults)
        {
            _soapresults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"EntryId"])
    {
        
        if(!_soapresults)
        {
            _soapresults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"MarkupId"])
    {
        
        if(!_soapresults)
        {
            _soapresults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"MainHeader"])
    {
        
        if(!_soapresults)
        {
            _soapresults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"VeriablePercent"])
    {
        
        if(!_soapresults)
        {
            _soapresults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"FixedDollar"])
    {
        
        if(!_soapresults)
        {
            _soapresults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"STPer"])
    {
        
        if(!_soapresults)
        {
            _soapresults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }

    if ([elementName isEqualToString:@"OTPer"])
    {
        
        if(!_soapresults)
        {
            _soapresults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"OTPer"])
    {
        
        if(!_soapresults)
        {
            _soapresults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }







    
}
-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    
    
    
	if( recordResults)
        
	{
        [_soapresults appendString: string];
    }
}
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    
    if ([elementName isEqualToString:@"MarkupEntryId"]) {
        
        recordResults=FALSE;
        _markupstring=_soapresults;
        _soapresults=nil;
    }
    if ([elementName isEqualToString:@"MarkUpName"]) {
        
        recordResults=FALSE;
        [_markupdict setObject:_markupstring forKey:_soapresults];
        [_markuparray addObject:_soapresults];
        _soapresults=nil;
    }
    if ([elementName isEqualToString:@"CompanyStd"]) {
        
        recordResults=FALSE;
        
        _soapresults=nil;
    }
    if ([elementName isEqualToString:@"MarkupmainResult"]) {
       
        recordResults=FALSE;
        
        _soapresults=nil;
    }
    if ([elementName isEqualToString:@"EntryId"]) {
        _master=[[Matrixmark alloc]init];
        recordResults=FALSE;
        _master.EntryId=[_soapresults integerValue];
        _soapresults=nil;
    }
    if ([elementName isEqualToString:@"MarkupId"]) {
        
        recordResults=FALSE;
        _master.MarkupId=[_soapresults integerValue];
        _soapresults=nil;
    }
    if ([elementName isEqualToString:@"MainHeader"]) {
        
        recordResults=FALSE;
        _master.MainHeader=_soapresults;
        _soapresults=nil;
    }
    if ([elementName isEqualToString:@"VeriablePercent"]) {
        
        recordResults=FALSE;
        _master.VeriablePercent=_soapresults;
        _soapresults=nil;
    }
    if ([elementName isEqualToString:@"FixedDollar"]) {
        
        recordResults=FALSE;
        _master.FixedDollar=_soapresults;
        _soapresults=nil;
    }
    if ([elementName isEqualToString:@"STPer"]) {
        
        recordResults=FALSE;
        _master.STPer=_soapresults;
        _soapresults=nil;
    }

    if ([elementName isEqualToString:@"OTPer"]) {
        
        recordResults=FALSE;
        _master.OTPer=_soapresults;
        _soapresults=nil;
    }
    if ([elementName isEqualToString:@"OTDoll"]) {
        
        recordResults=FALSE;
        _master.OTDoll=_soapresults;
        [_markuptablearray addObject:_master];
        _soapresults=nil;
    }

    
    
    
    
    
}



@end
