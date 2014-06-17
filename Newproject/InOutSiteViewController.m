//
//  InOutSiteViewController.m
//  Newproject
//
//  Created by GMSIndia 2 on 12/06/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "InOutSiteViewController.h"

@interface InOutSiteViewController ()

@end

@implementation InOutSiteViewController

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
  self.view.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    [[self.notetextview layer] setBorderColor:[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor];
    [[self.notetextview layer] setBorderWidth:2];
    [[self.notetextview layer] setCornerRadius:10];
    
    [[self.outnotetextview layer] setBorderColor:[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor];
    [[self.outnotetextview layer] setBorderWidth:2];
    [[self.outnotetextview layer] setCornerRadius:10];
    // Do any additional setup after loading the view from its nib.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self JobsSelect];
   
    [self SiteInSelect];
    
    EqOthersMdl *eqmdl=(EqOthersMdl*)[_inoutarray objectAtIndex:0];
    
    _itemcodetxtfld.text=eqmdl.itemname;
    _orderedqtytxtfld.text=eqmdl.OrderedQuantity;
    _receivedqtytxtfld.text=eqmdl.ReceivedQty;
   // _jobsitetxtfld.text=[_jobdict objectForKey:eqmdl.jobnumber];
    
    
    _outitemcodetxtfld.text=eqmdl.itemname;
    _outorderedqtytxtfld.text=eqmdl.OrderedQuantity;
    _outreceivedqtytxtfld.text=eqmdl.ReceivedQty;
   // _outjobsitetxtfld.text=[_jobdict objectForKey:eqmdl.jobnumber];
    _outtotalqtysendtxtfld.text=eqmdl.TotalQtySendBack;
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)closethepage:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}
-(IBAction)confirmcheckaction:(id)sender
{   confmin=@"clickd";
    if(confirmcheck==0)
    {
        
        [_cnfrmbtn setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        
        
        confirmcheck=1;
        
        
    }
    else
    {
        [_cnfrmbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        confirmcheck=0;
        
    }

}
-(IBAction)tojobsiteaction:(id)sender
{
    UIViewController *popovercontent=[[UIViewController alloc]init];
    UIView *popoverview=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 210, 120)];
    popoverview.backgroundColor=[UIColor whiteColor];
    _popovertableview=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 210, 120)];
    _popovertableview.delegate=(id)self;
    _popovertableview.dataSource=(id)self;
    _popovertableview.rowHeight=32;
    _popovertableview.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    [popoverview addSubview:_popovertableview];
    popovercontent.view=popoverview;
    popovercontent.contentSizeForViewInPopover=CGSizeMake(210, 120);
    self.popovercontroller=[[UIPopoverController alloc]initWithContentViewController:popovercontent];
    [self.popovercontroller presentPopoverFromRect:_tojobbtn.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
    
    
 
}
-(IBAction)outconfirmcheckaction:(id)sender
{   confirmout=@"clicked";
    if(outconfirmcheck==0)
    {
        
        [_outcnfrmbtn setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        
        
        outconfirmcheck=1;
        if ([_outqtysendbacktxtfld.text  compare:_outreceivedqtytxtfld.text options:NSNumericSearch] == NSOrderedDescending){
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Quantity Send Back should be less than or equal to Received Quantity" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
        else
        {
            [self StockInInsert];
        }

       
        
        
    }
    else
    {
        [_outcnfrmbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        outconfirmcheck=0;
        
    }

}
-(IBAction)savesiteout:(id)sender
{

    if (outconfirmcheck==1) {
        if ([_outqtysendbacktxtfld.text  compare:_outreceivedqtytxtfld.text options:NSNumericSearch] == NSOrderedDescending){
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Quantity Send Back should be less than or equal to Received Quantity" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
        else
        {
        [self SiteOutInsert];
        }
    }
    else
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Please confirm before save" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }

}
-(IBAction)savesitein:(id)sender
{
    
if(confirmcheck==1)
{

    [self SiteInUpdate];
}
    else
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Please confirm before save" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
}

- (IBAction)removeexpbtn:(id)sender {
}

- (IBAction)excptnbtn:(id)sender {
    
    btnclck++;
    if (btnclck%2!=0) {
        [_excptnbtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        excptn=1;
       
    }
    else
    {
        [_excptnbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        excptn=0;
    }

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
    if(tableView==_popovertableview)
        
    {
        return [_jobnoarray count];
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
    
    if(tableView==_popovertableview)
    {  cell.textLabel.font = [UIFont fontWithName:@"Helvetica Neue Light" size:12];
        cell.textLabel.font = [UIFont systemFontOfSize:12.0];
        jobsitemodel *jmdl=(jobsitemodel*)[_jobnoarray objectAtIndex:indexPath.row];
        cell.textLabel.text=[NSString stringWithFormat:@"%@-%@",jmdl.jobno,jmdl.jobname];
        
                
        
        }
    
    
    
    
return cell;
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (tableView==_popovertableview) {
        jobsitemodel *jmdl=(jobsitemodel*)[_jobnoarray objectAtIndex:indexPath.row];
        
       [_tojobbtn setTitle:[NSString stringWithFormat:@"%@-%@",jmdl.jobno,jmdl.jobname]forState:UIControlStateNormal];
        
        jobid=jmdl.jobid;
        
    }
    [self.popovercontroller dismissPopoverAnimated:YES];
    
}
-(void)JobsSelect{
    recordResults=FALSE;
    NSString *soapMessage;
    
    webtype=1;
    
    
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
-(void)SiteInSelect{
    recordResults=FALSE;
    NSString *soapMessage;
    
    EqOthersMdl *eqmdl=(EqOthersMdl*)[_inoutarray objectAtIndex:0];
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SiteInSelect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<MainId>%d</MainId>\n"
                   
                   "</SiteInSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[eqmdl.entryid integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.100/service.asmx"];;
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/SiteInSelect" forHTTPHeaderField:@"Soapaction"];
    
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


-(void)SiteInUpdate
{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
   EqOthersMdl *eqmdl=(EqOthersMdl*)[_inoutarray objectAtIndex:0];
    NSString *note=_notetextview.text;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SiteInUpdate xmlns=\"http://ios.kontract360.com/\">\n"
                   "<MainId>%d</MainId>\n"
                   "<ConfirmSiteIn>%d</ConfirmSiteIn>\n"
                   "<Notes>%@</Notes>\n"
                   "<QtyReceivedNow>%d</QtyReceivedNow>\n"
                    "<Exception>%d</Exception>\n"
                   "</SiteInUpdate>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[eqmdl.entryid integerValue],confirmcheck,note,[_qtyrcvdnwtxtfld.text integerValue],excptn];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    //NSURL *url = [NSURL URLWithString:@"http://192.168.0.100/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.100/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/SiteInUpdate" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)tojobselect{
    recordResults=FALSE;
    NSString *soapMessage;
    
    webtype=1;
    
    
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
-(void)JOB1Select
{
    recordResults=FALSE;
    NSString *soapMessage;
    
   
    EqOthersMdl *eqmdl=(EqOthersMdl*)[_inoutarray objectAtIndex:0];
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<JOB1Select xmlns=\"http://ios.kontract360.com/\">\n"
                   "<JobNumber>%@</JobNumber>\n"
                   
                   "</JOB1Select>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",eqmdl.jobnumber];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.100/service.asmx"];;
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/JOB1Select" forHTTPHeaderField:@"Soapaction"];
    
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

-(void)SiteOutInsert
{
    
    recordResults = FALSE;
    NSString *soapMessage;
   
    EqOthersMdl *eqmdl=(EqOthersMdl*)[_inoutarray objectAtIndex:0];
    NSString *note=_outnotetextview.text;
    NSString *jobdesc=[_jobdict objectForKey:eqmdl.jobnumber];
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SiteOutInsert xmlns=\"http://ios.kontract360.com/\">\n"
                   "<MainId>%d</MainId>\n"
                   "<JobNumber>%@</JobNumber>\n"
                   "<JobSite>%@</JobSite>\n"
                   "<ItemCode>%@</ItemCode>\n"
                   "<ItemName>%@</ItemName>\n"
                   "<QtySendBackNow>%d</QtySendBackNow>\n"
                   "<ToJob>%d</ToJob>\n"
                   "<ConfirmSiteOut>%d</ConfirmSiteOut>\n"
                   "<Notes>%@</Notes>\n"
                   "<EntryId>%d</EntryId>\n"
                   "</SiteOutInsert>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[eqmdl.entryid integerValue],eqmdl.jobnumber,jobdesc,eqmdl.itemcode,eqmdl.itemname,[_outqtysendbacktxtfld.text integerValue],jobid,outconfirmcheck,note,[eqmdl.entryid integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    //NSURL *url = [NSURL URLWithString:@"http://192.168.0.100/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.100/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/SiteOutInsert" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)StockInInsert
{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    EqOthersMdl *eqmdl=(EqOthersMdl*)[_inoutarray objectAtIndex:0];
    //NSString *note=_outnotetextview.text;
    NSString *jobdesc=[_jobdict objectForKey:eqmdl.jobnumber];
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<StockInInsert xmlns=\"http://ios.kontract360.com/\">\n"
                   "<MainId>%d</MainId>\n"
                   "<JobNumber>%@</JobNumber>\n"
                   "<JobSite>%@</JobSite>\n"
                   "<ItemCode>%@</ItemCode>\n"
                   "<ItemName>%@</ItemName>\n"
                   "<QtyReceivedBackNow>%d</QtyReceivedBackNow>\n"
                   "<ConfirmStockIn>%d</ConfirmStockIn>\n"
                   "<Notes>%@</Notes>\n"
                   "<EntryId>%d</EntryId>\n"
                   "</StockInInsert>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[eqmdl.entryid integerValue],eqmdl.jobnumber,jobdesc,eqmdl.itemcode,eqmdl.itemname,[_outqtysendbacktxtfld.text integerValue],0,@"",[eqmdl.entryid integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    //NSURL *url = [NSURL URLWithString:@"http://192.168.0.100/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.100/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/StockInInsert" forHTTPHeaderField:@"Soapaction"];
    
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
    UIAlertView *  Alert=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"ERROR with the Connection" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    
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
    if (webtype==1) {
        [self JOB1Select];
         EqOthersMdl *eqmdl=(EqOthersMdl*)[_inoutarray objectAtIndex:0];
        _jobsitetxtfld.text=[_jobdict objectForKey:eqmdl.jobnumber];
        _outjobsitetxtfld.text=[_jobdict objectForKey:eqmdl.jobnumber];
        webtype=0;

    }
    
}
#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"JobsSelectResponse"])
    {
       
        _jobdict=[[NSMutableDictionary alloc]init];
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
    if([elementName isEqualToString:@"SiteInSelectResponse"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"QtyReceivedNow"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"SiteInUpdateResult"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"SiteOutInsertResult"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"StockInInsertResult"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"JOB1SelectResponse"])
    {
        _jobnoarray=[[NSMutableArray alloc]init];
        _jobnodictionary=[[NSMutableDictionary alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"JId"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"JNumber"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"J1JobDescDetail"])
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
    if([elementName isEqualToString:@"JobNumber"])
    {
        recordResults = FALSE;
        job=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"JobDescDetail"])
    {
        recordResults = FALSE;
        
        [_jobdict setObject:_soapResults forKey:job];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"QtyReceivedNow"])
    {
        recordResults = FALSE;
        _qtyrcvdnwtxtfld.text=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"SiteInUpdateResult"])
    {
        recordResults = FALSE;
        
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"result"])
    {
        recordResults = FALSE;
        msg=_soapResults;
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:_soapResults delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
               _soapResults = nil;
    }

    
    if([elementName isEqualToString:@"JId"])
    {
        recordResults = FALSE;
        _jmdl=[[jobsitemodel alloc]init];
        _jmdl.jobid=[_soapResults integerValue];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"JNumber"])
    {
        recordResults = FALSE;
        
        _jmdl.jobno=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"J1JobDescDetail"])
    {
        recordResults = FALSE;
        _jmdl.jobname=_soapResults;
        [_jobnoarray addObject:_jmdl];
        
        _soapResults = nil;
    }
    




}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if ([alertView.message isEqualToString:msg]) {
        
        [_cnfrmbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        confirmcheck=0;
        _notetextview.text=@"";
        if ([self.delegate respondsToSelector:@selector(toreloadtable)]) {
            [self.delegate toreloadtable];
        }
        
    }
    
    
}



@end
