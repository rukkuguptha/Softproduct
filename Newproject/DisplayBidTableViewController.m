//
//  DisplayBidTableViewController.m
//  Newproject
//
//  Created by GMSIndia 2 on 25/06/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "DisplayBidTableViewController.h"

@interface DisplayBidTableViewController ()

@end

@implementation DisplayBidTableViewController

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
  
    _manpowertitle.backgroundColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _manpowertable.layer.borderWidth = 2.0;
    _manpowertable.layer.borderColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _Othertitle.backgroundColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _Othertable.layer.borderWidth = 2.0;
    _Othertable.layer.borderColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _summarytitle.backgroundColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _SummaryTable.layer.borderWidth = 2.0;
    _SummaryTable.layer.borderColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _manpowertable.hidden=NO;
    _manpowertitle.hidden=NO;
    _Othertable.hidden=YES;
    _Othertitle.hidden=YES;
    _SummaryTable.hidden=YES;
    _summarytitle.hidden=YES;

    _manpwrbtn.tintColor=[UIColor whiteColor];
    _eqpmntbtn.tintColor=[UIColor blackColor];
    _materialbtn.tintColor=[UIColor blackColor];
    _otherbtn.tintColor=[UIColor blackColor];
    _summarybtn.tintColor=[UIColor blackColor];
   tooltype=1;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
     tooltype=1;
    [self BidManPowerReviewSelect];
    _manpowertable.hidden=NO;
    _manpowertitle.hidden=NO;
    _Othertable.hidden=YES;
    _Othertitle.hidden=YES;
    _SummaryTable.hidden=YES;
    _summarytitle.hidden=YES;
    _manpwrbtn.tintColor=[UIColor whiteColor];
    _eqpmntbtn.tintColor=[UIColor blackColor];
    _materialbtn.tintColor=[UIColor blackColor];
    _otherbtn.tintColor=[UIColor blackColor];
    _summarybtn.tintColor=[UIColor blackColor];
}


- (IBAction)colsethispage:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)manpoweraction:(id)sender
{
    tooltype=1;
    _manpowertable.hidden=NO;
    _manpowertitle.hidden=NO;
    _Othertable.hidden=YES;
    _Othertitle.hidden=YES;
    _SummaryTable.hidden=YES;
    _summarytitle.hidden=YES;
    _manpwrbtn.tintColor=[UIColor whiteColor];
    _eqpmntbtn.tintColor=[UIColor blackColor];
    _materialbtn.tintColor=[UIColor blackColor];
    _otherbtn.tintColor=[UIColor blackColor];
    _summarybtn.tintColor=[UIColor blackColor];

}
- (IBAction)equipmentaction:(id)sender
{
    tooltype=2;
    [self BidEquipmentSelect];
    _manpowertable.hidden=YES;
     _manpowertitle.hidden=YES;
    _Othertable.hidden=NO;
    _Othertitle.hidden=NO;
    _SummaryTable.hidden=YES;
    _summarytitle.hidden=YES;
    _manpwrbtn.tintColor=[UIColor blackColor];
    _eqpmntbtn.tintColor=[UIColor whiteColor];
    _materialbtn.tintColor=[UIColor blackColor];
    _otherbtn.tintColor=[UIColor blackColor];
    _summarybtn.tintColor=[UIColor blackColor];
    
}
- (IBAction)materialaction:(id)sender
{
    tooltype=3;
    [self BidMaterialReviewselect];
    _manpowertable.hidden=YES;
    _manpowertitle.hidden=YES;
    _Othertable.hidden=NO;
    _Othertitle.hidden=NO;
    _SummaryTable.hidden=YES;
    _summarytitle.hidden=YES;
    _manpwrbtn.tintColor=[UIColor blackColor];
    _eqpmntbtn.tintColor=[UIColor blackColor];
    _materialbtn.tintColor=[UIColor whiteColor];
    _otherbtn.tintColor=[UIColor blackColor];
    _summarybtn.tintColor=[UIColor blackColor];
   
}
- (IBAction)otheraction:(id)sender
{
    tooltype=4;
    [self BidOtherReviewselect];
    _manpowertable.hidden=YES;
     _manpowertitle.hidden=YES;
    _Othertable.hidden=NO;
    _Othertitle.hidden=NO;
    _SummaryTable.hidden=YES;
    _summarytitle.hidden=YES;
    _manpwrbtn.tintColor=[UIColor blackColor];
    _eqpmntbtn.tintColor=[UIColor blackColor];
    _materialbtn.tintColor=[UIColor blackColor];
    _otherbtn.tintColor=[UIColor whiteColor];
    _summarybtn.tintColor=[UIColor blackColor];
    
}
- (IBAction)summaryaction:(id)sender
{
    tooltype=5;
    _manpowertable.hidden=YES;
    _manpowertitle.hidden=YES;
    _Othertable.hidden=YES;
    _Othertitle.hidden=YES;
    _SummaryTable.hidden=NO;
    _summarytitle.hidden=NO;
    _manpwrbtn.tintColor=[UIColor blackColor];
    _eqpmntbtn.tintColor=[UIColor blackColor];
    _materialbtn.tintColor=[UIColor blackColor];
    _otherbtn.tintColor=[UIColor blackColor];
    _summarybtn.tintColor=[UIColor whiteColor];
    [_SummaryTable reloadData];

}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView==_manpowertable) {
        return [_manpowerarray count];
    }
    if (tableView==_Othertable)
    {
        if (tooltype==2) {
            return [_Equipmentarray count];
        }
        if(tooltype==3)
        {
            return [_materialarray count];
        }
        if(tooltype==4)
        {
            return [_Otherarray count];
        }
    }
    if (tableView==_SummaryTable)
    {
        return 4;
    }
    return YES;
}
#pragma mark-tableview delegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
        if (tableView==_manpowertable) {
           
                [[NSBundle mainBundle]loadNibNamed:@"Tblebidcell" owner:self options:nil];
                cell=_manpowercell;
            
        }
        if (tableView==_Othertable) {
            
            [[NSBundle mainBundle]loadNibNamed:@"Bidreviewcell" owner:self options:nil];
            cell=_othercell;
            
        }
        if (tableView==_SummaryTable) {
            
            [[NSBundle mainBundle]loadNibNamed:@"sumbidcell" owner:self options:nil];
            cell=_sumcell;
            
        }


         cell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12];
    }
    
        if (tableView==_manpowertable) {
            
            
            Reviebidmdl *manmdl=(Reviebidmdl *)[_manpowerarray objectAtIndex:indexPath.row];
            
            _Mestilabel=(UILabel *)[cell viewWithTag:1];
            _Mestilabel.text=manmdl.Estimation;
            _Mitemcodelabel=(UILabel *)[cell viewWithTag:2];
            _Mitemcodelabel.text=manmdl.ItemCode;
            _Mdesclabel=(UILabel *)[cell viewWithTag:3];
            _Mdesclabel.text=manmdl.mDescription;
            _Mqtylabel=(UILabel *)[cell viewWithTag:4];
            _Mqtylabel.text=manmdl.TotalQty;
            
            _Mstlabel=(UILabel *)[cell viewWithTag:5];
            _Mstlabel.text=manmdl.TotalST;
            
            _Motlabel=(UILabel *)[cell viewWithTag:6];
            _Motlabel.text=manmdl.TotalOT;
            _Mstratelabel=(UILabel *)[cell viewWithTag:7];
            _Mstratelabel.text=manmdl.TotalSTRate;
            
            
            _Motratelabel=(UILabel *)[cell viewWithTag:8];
            _Motratelabel.text=manmdl.TotalOTRate;
            _Mtotlabel=(UILabel *)[cell viewWithTag:9];
            NSInteger x=[manmdl.TotalUnitCost integerValue]*[manmdl.TotalQty integerValue];
            _Mtotlabel.text=[NSString stringWithFormat:@"$%d",x];
            _Mtypelabel=(UILabel *)[cell viewWithTag:10];
            _Mtypelabel.text=manmdl.BidMType;

        }
    
    if (tableView==_Othertable) {
        
        if (tooltype==2) {
            
        
                Reviebidmdl *eqmdl=(Reviebidmdl *)[_Equipmentarray objectAtIndex:indexPath.row];
                
                _Oestilabel=(UILabel *)[cell viewWithTag:1];
                _Oestilabel.text=eqmdl.Estimation;
                _Oitemcodelabel=(UILabel *)[cell viewWithTag:2];
                _Oitemcodelabel.text=eqmdl.ItemCode;
                _Odesclabel=(UILabel *)[cell viewWithTag:3];
                _Odesclabel.text=eqmdl.mDescription;
                _Oqtylabel=(UILabel *)[cell viewWithTag:4];
                _Oqtylabel.text=eqmdl.TotalQty;
                
                _Ototallabel=(UILabel *)[cell viewWithTag:5];
                NSInteger e=[eqmdl.TotalUnitCost integerValue]*[eqmdl.TotalQty integerValue];
                _Ototallabel.text=[NSString stringWithFormat:@"$%d",e];
                
                _Otypelabel=(UILabel *)[cell viewWithTag:6];
                _Otypelabel.text=eqmdl.BidMType;
               

                }
        if (tooltype==3) {
            
            
            Reviebidmdl *mtmdl=(Reviebidmdl *)[_materialarray objectAtIndex:indexPath.row];
            
            _Oestilabel=(UILabel *)[cell viewWithTag:1];
            _Oestilabel.text=mtmdl.Estimation;
            _Oitemcodelabel=(UILabel *)[cell viewWithTag:2];
            _Oitemcodelabel.text=mtmdl.ItemCode;
            _Odesclabel=(UILabel *)[cell viewWithTag:3];
            _Odesclabel.text=mtmdl.mDescription;
            _Oqtylabel=(UILabel *)[cell viewWithTag:4];
            _Oqtylabel.text=mtmdl.TotalQty;
            
            _Ototallabel=(UILabel *)[cell viewWithTag:5];
            NSInteger e=[mtmdl.TotalUnitCost integerValue]*[mtmdl.TotalQty integerValue];
            _Ototallabel.text=[NSString stringWithFormat:@"$%d",e];
            
            _Otypelabel=(UILabel *)[cell viewWithTag:6];
            _Otypelabel.text=mtmdl.BidMType;
            
            
        }
        if (tooltype==4) {
            
            
            Reviebidmdl *othmdl=(Reviebidmdl *)[_Otherarray objectAtIndex:indexPath.row];
            
            _Oestilabel=(UILabel *)[cell viewWithTag:1];
            _Oestilabel.text=othmdl.Estimation;
            _Oitemcodelabel=(UILabel *)[cell viewWithTag:2];
            _Oitemcodelabel.text=othmdl.ItemCode;
            _Odesclabel=(UILabel *)[cell viewWithTag:3];
            _Odesclabel.text=othmdl.mDescription;
            _Oqtylabel=(UILabel *)[cell viewWithTag:4];
            _Oqtylabel.text=othmdl.TotalQty;
            
            _Ototallabel=(UILabel *)[cell viewWithTag:5];
            NSInteger e=[othmdl.TotalUnitCost integerValue]*[othmdl.TotalQty integerValue];
            _Ototallabel.text=[NSString stringWithFormat:@"$%d",e];
            
            _Otypelabel=(UILabel *)[cell viewWithTag:6];
            _Otypelabel.text=othmdl.BidMType;
            
            
        }


       
    
    }
    
    
    return cell;
}
#pragma mark-Webservices
-(void)BidManPowerReviewSelect
{
    recordResults = FALSE;
    NSString *soapMessage;
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<BidManPowerReviewSelect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<BidId>%@</BidId>\n"
                   "</BidManPowerReviewSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_bidid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.100/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/BidManPowerReviewSelect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)BidEquipmentSelect
{
    recordResults = FALSE;
    NSString *soapMessage;
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<BidEquipmentSelect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<BidId>%@</BidId>\n"
                   "</BidEquipmentSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_bidid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.100/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/BidEquipmentSelect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)BidMaterialReviewselect
{
    recordResults = FALSE;
    NSString *soapMessage;
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<BidMaterialReviewselect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<BidId>%@</BidId>\n"
                   "</BidMaterialReviewselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_bidid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.100/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/BidMaterialReviewselect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)BidOtherReviewselect
{
    recordResults = FALSE;
    NSString *soapMessage;
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<BidOtherReviewselect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<BidId>%@</BidId>\n"
                   "</BidOtherReviewselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_bidid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.100/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/BidOtherReviewselect" forHTTPHeaderField:@"Soapaction"];
    
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
//-(void)BidReviewCostselect
//{
//    recordResults = FALSE;
//    NSString *soapMessage;
//    soapMessage = [NSString stringWithFormat:
//                   
//                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
//                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
//                   
//                   
//                   "<soap:Body>\n"
//                   
//                   "<BidReviewCostselect xmlns=\"http://ios.kontract360.com/\">\n"
//                   "<BidReviewId>%d</BidReviewId>\n"
//                   "</BidReviewCostselect>\n"
//                   "</soap:Body>\n"
//                   "</soap:Envelope>\n",_bidid];
//    NSLog(@"soapmsg%@",soapMessage);
//    
//    
//    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
//    NSURL *url = [NSURL URLWithString:@"http://192.168.0.100/service.asmx"];
//    
//    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
//    
//    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
//    
//    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
//    
//    [theRequest addValue: @"http://ios.kontract360.com/BidReviewCostselect" forHTTPHeaderField:@"Soapaction"];
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
//}
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
	
	
	if( _xmlparser
       )
	{
		
	}
	
	_xmlparser = [[NSXMLParser alloc] initWithData: _webData];
	[_xmlparser setDelegate:(id)self];
	[_xmlparser setShouldResolveExternalEntities: YES];
	[_xmlparser parse];
    if (tooltype==1) {
        
    
    [_manpowertable reloadData];
    }
    if (tooltype==2||tooltype==3||tooltype==4) {
        [_Othertable reloadData];
    }
    
    
    
}

#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"BidManPowerReviewSelectResponse"])
    {_manpowerarray=[[NSMutableArray alloc]init];
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"BidTableId"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"BidId"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }

    if([elementName isEqualToString:@"EstimationId"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }

    if([elementName isEqualToString:@"Estimation"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }

    if([elementName isEqualToString:@"ItemCode"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }

    if([elementName isEqualToString:@"Description"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }

    if([elementName isEqualToString:@"TotalUnitCost"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }

    if([elementName isEqualToString:@"TotalQty"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }

    if([elementName isEqualToString:@"Type"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }

    if([elementName isEqualToString:@"TotalST"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"TotalOT"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }

    if([elementName isEqualToString:@"TotalSTRate"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }

    if([elementName isEqualToString:@"TotalOTRate"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"TotalSTOTSum"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"BidMType"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"BidEquipmentSelectResponse"])
    {_Equipmentarray=[[NSMutableArray alloc]init];
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"EqEstimation"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }

    if([elementName isEqualToString:@"eqItemCode"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }

    if([elementName isEqualToString:@"EqDescription"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }

    if([elementName isEqualToString:@"EQQty"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }

    if([elementName isEqualToString:@"EQTotal"])
    {        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"EqType"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }


    if([elementName isEqualToString:@"EQBidMType"])
    {
        if(!_soapresults)
    {
        _soapresults = [[NSMutableString alloc] init];
    }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"BidMaterialReviewselectResponse"])
    {_materialarray=[[NSMutableArray alloc]init];
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"MtEstimation"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"MtItemCode"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }

    if([elementName isEqualToString:@"MtDescription"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }

    if([elementName isEqualToString:@"MtQty"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }

    if([elementName isEqualToString:@"MtTotal"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }

    if([elementName isEqualToString:@"MtType"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }

    if([elementName isEqualToString:@"MtBidMType"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"BidOtherReviewselectResponse"])
    {_Otherarray=[[NSMutableArray alloc]init];
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"OtherEstimation"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"OtherItemCode"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    
    if([elementName isEqualToString:@"OtherDescription"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    
    if([elementName isEqualToString:@"OtherQty"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    
    if([elementName isEqualToString:@"OtherTotal"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    
    if([elementName isEqualToString:@"OtherType"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    
    if([elementName isEqualToString:@"OtherBidMType"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }


    





}
-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    
    
    
	if( recordResults )
        
	{
        [_soapresults appendString: string];
    }
}
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if([elementName isEqualToString:@"BidManPowerReviewSelectResponse"])
    {
        
        recordResults = FALSE;
        
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"BidTableId"])
    {
        
        _reviewmdl=[[Reviebidmdl alloc]init];
        recordResults = FALSE;
        
        _reviewmdl.BidTableId=_soapresults;
        _soapresults = nil;
        
    }
    if([elementName isEqualToString:@"BidId"])
    {
        recordResults = FALSE;
        
        _reviewmdl.BidId=_soapresults;
        _soapresults = nil;

        
    }
    
    if([elementName isEqualToString:@"EstimationId"])
    {
        recordResults = FALSE;
        
        _reviewmdl.EstimationId=_soapresults;
        _soapresults = nil;

        
    }
    
    if([elementName isEqualToString:@"Estimation"])
    {
        recordResults = FALSE;
        
        _reviewmdl.Estimation=_soapresults;
        _soapresults = nil;

        
    }
    
    if([elementName isEqualToString:@"ItemCode"])
    {
        recordResults = FALSE;
        
        _reviewmdl.ItemCode=_soapresults;
        _soapresults = nil;

        
    }
    
    if([elementName isEqualToString:@"Description"])
    {
        recordResults = FALSE;
        
        _reviewmdl.mDescription=_soapresults;
        _soapresults = nil;
    }
    
    if([elementName isEqualToString:@"TotalUnitCost"])
    {
        recordResults = FALSE;
        
        _reviewmdl.TotalUnitCost=_soapresults;
        _soapresults = nil;

        
    }
    
    if([elementName isEqualToString:@"TotalQty"])
    {
        recordResults = FALSE;
        
        _reviewmdl.TotalQty=_soapresults;
        _soapresults = nil;

        
    }
    
    if([elementName isEqualToString:@"Type"])
    {
        recordResults = FALSE;
        
        _reviewmdl.Type=_soapresults;
        _soapresults = nil;
        
    }
    
    if([elementName isEqualToString:@"TotalST"])
    {
        recordResults = FALSE;
        
        _reviewmdl.TotalST=_soapresults;
        _soapresults = nil;
        
    }
    if([elementName isEqualToString:@"TotalOT"])
    {
        recordResults = FALSE;
        
        _reviewmdl.TotalOT=_soapresults;
        _soapresults = nil;

        
    }
    
    if([elementName isEqualToString:@"TotalSTRate"])
    {
        recordResults = FALSE;
        
        _reviewmdl.TotalSTRate=_soapresults;
        _soapresults = nil;
        
    }
    
    if([elementName isEqualToString:@"TotalOTRate"])
    {
        recordResults = FALSE;
        
        _reviewmdl.TotalOTRate=_soapresults;
        _soapresults = nil;

        
    }
    if([elementName isEqualToString:@"TotalSTOTSum"])
    {
        recordResults = FALSE;
        
        _reviewmdl.TotalSTOTSum=_soapresults;
        _soapresults = nil;

        
    }
    if([elementName isEqualToString:@"BidMType"])
    {
        recordResults = FALSE;
        
        _reviewmdl.BidMType=_soapresults;
        [_manpowerarray addObject:_reviewmdl];
        _soapresults = nil;

        
    }
    if([elementName isEqualToString:@"EqEstimation"])
    {
        recordResults = FALSE;
        
        _reviewmdl=[[Reviebidmdl alloc]init];
        _reviewmdl.Estimation=_soapresults;
        _soapresults = nil;
        
        
    }
    if([elementName isEqualToString:@"eqItemCode"])
    {
        recordResults = FALSE;
        
       
        _reviewmdl.ItemCode=_soapresults;
        _soapresults = nil;
        
        
    }
    if([elementName isEqualToString:@"EqDescription"])
    {
        recordResults = FALSE;
        
        
        _reviewmdl.mDescription=_soapresults;
        _soapresults = nil;
        
        
    }

    if([elementName isEqualToString:@"EQQty"])
    {
        recordResults = FALSE;
        
        
        _reviewmdl.TotalQty=_soapresults;
        _soapresults = nil;
        
        
    }

    if([elementName isEqualToString:@"EQTotal"])
    {
        recordResults = FALSE;
        
        
        _reviewmdl.TotalUnitCost=_soapresults;
        _soapresults = nil;
        
        
    }

    if([elementName isEqualToString:@"EqType"])
    {
        recordResults = FALSE;
        
        
        _reviewmdl.Type=_soapresults;
        _soapresults = nil;
        
        
    }
    if([elementName isEqualToString:@"EQBidMType"])
    {
        recordResults = FALSE;
        
        
        _reviewmdl.BidMType=_soapresults;
        [_Equipmentarray addObject:_reviewmdl];
        _soapresults = nil;
        
        
    }


    if([elementName isEqualToString:@"MtEstimation"])
    {
        recordResults = FALSE;
        
        _reviewmdl=[[Reviebidmdl alloc]init];
        _reviewmdl.Estimation=_soapresults;
        _soapresults = nil;
        
        
    }
    if([elementName isEqualToString:@"MtItemCode"])
    {
        recordResults = FALSE;
        
        
        _reviewmdl.ItemCode=_soapresults;
        _soapresults = nil;
        
        
    }
    if([elementName isEqualToString:@"MtDescription"])
    {
        recordResults = FALSE;
        
        
        _reviewmdl.mDescription=_soapresults;
        _soapresults = nil;
        
        
    }
    
    if([elementName isEqualToString:@"MtQty"])
    {
        recordResults = FALSE;
        
        
        _reviewmdl.TotalQty=_soapresults;
        _soapresults = nil;
        
        
    }
    
    if([elementName isEqualToString:@"MtTotal"])
    {
        recordResults = FALSE;
        
        
        _reviewmdl.TotalUnitCost=_soapresults;
        _soapresults = nil;
        
        
    }
    
    if([elementName isEqualToString:@"MtType"])
    {
        recordResults = FALSE;
        
        
        _reviewmdl.Type=_soapresults;
        _soapresults = nil;
        
        
    }
    if([elementName isEqualToString:@"MtBidMType"])
    {
        recordResults = FALSE;
        
        
        _reviewmdl.BidMType=_soapresults;
        [_materialarray addObject:_reviewmdl];
        _soapresults = nil;
        
        
    }

    if([elementName isEqualToString:@"OtherEstimation"])
    {
        recordResults = FALSE;
        
        _reviewmdl=[[Reviebidmdl alloc]init];
        _reviewmdl.Estimation=_soapresults;
        _soapresults = nil;
        
        
    }
    if([elementName isEqualToString:@"OtherItemCode"])
    {
        recordResults = FALSE;
        
        
        _reviewmdl.ItemCode=_soapresults;
        _soapresults = nil;
        
        
    }
    if([elementName isEqualToString:@"OtherDescription"])
    {
        recordResults = FALSE;
        
        
        _reviewmdl.mDescription=_soapresults;
        _soapresults = nil;
        
        
    }
    
    if([elementName isEqualToString:@"OtherQty"])
    {
        recordResults = FALSE;
        
        
        _reviewmdl.TotalQty=_soapresults;
        _soapresults = nil;
        
        
    }
    
    if([elementName isEqualToString:@"OtherTotal"])
    {
        recordResults = FALSE;
        
        
        _reviewmdl.TotalUnitCost=_soapresults;
        _soapresults = nil;
        
        
    }
    
    if([elementName isEqualToString:@"OtherType"])
    {
        recordResults = FALSE;
        
        
        _reviewmdl.Type=_soapresults;
        _soapresults = nil;
        
        
    }
    if([elementName isEqualToString:@"OtherBidMType"])
    {
        recordResults = FALSE;
        
        
        _reviewmdl.BidMType=_soapresults;
        [_Otherarray addObject:_reviewmdl];
        _soapresults = nil;
        
        
    }


    

}


@end
