//
//  StockViewController.m
//  Newproject
//
//  Created by GMSIndia1 on 6/12/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "StockViewController.h"

@interface StockViewController ()

@end

@implementation StockViewController
@synthesize delegate;
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
    [[self.notestxtview layer] setBorderColor:[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor];
    [[self.notestxtview layer] setBorderWidth:2.3];
    [[self.notestxtview layer] setCornerRadius:10];
    [[self.notes1txtview layer] setBorderColor:[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor];
    [[self.notes1txtview layer] setBorderWidth:2.3];
    [[self.notes1txtview layer] setCornerRadius:10];
    [self JobsSelect];
    
    self.view.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];


}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    _eqmdl=(EqOthersMdl *)[_eqarray objectAtIndex:0];
   
    _itmnametxtfld.text=_eqmdl.itemname;
    _orderdtxtfld.text=_eqmdl.OrderedQuantity;
    _stocktxtfld.text=_eqmdl.StockQuantity;
    _delivrdtxtfld.text=_eqmdl.DeliveredQty;
    
    
    _item1txtfld.text=_eqmdl.itemname;
    _stock1txtfld.text=_eqmdl.StockQuantity;
    
    
    

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark-Web Service
-(void)StockOutInsert{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<StockOutInsert xmlns=\"http://ios.kontract360.com/\">\n"
                   "<MainId>%d</MainId>\n"
                   "<JobNumber>%@</JobNumber>\n"
                   "<JobSite>%@</JobSite>\n"
                   "<ItemCode>%@</ItemCode>\n"
                   "<ItemName>%@</ItemName>\n"
                   "<QtySendNow>%d</QtySendNow>\n"
                   "<ConfirmStockOut>%d</ConfirmStockOut>\n"
                   "<Notes>%@</Notes>\n"
                   "<ThirdParty>%d</ThirdParty>\n"
                   "</StockOutInsert>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[_eqmdl.entryid integerValue],_eqmdl.jobnumber,_jobsitetxtfld.text,_eqmdl.itemcode,_eqmdl.itemname,[_sendtxtfld.text integerValue],confirm,_notestxtview.text,thirdparty];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.100/service.asmx"];
    //  NSURL *url = [NSURL URLWithString:@"http://test3.kontract360.com/service.asmx"];;
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/StockOutInsert" forHTTPHeaderField:@"Soapaction"];
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
-(void)SiteInInsert{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SiteInInsert xmlns=\"http://ios.kontract360.com/\">\n"
                   "<MainId>%d</MainId>\n"
                   "<JobNumber>%@</JobNumber>\n"
                   "<JobSite>%@</JobSite>\n"
                   "<ItemCode>%@</ItemCode>\n"
                   "<ItemName>%@</ItemName>\n"
                   "<QtyReceivedNow>%d</QtyReceivedNow>\n"
                   "<ConfirmStockOut>%d</ConfirmStockOut>\n"
                   "<Notes>%@</Notes>\n"
                   "<ReceivedBack>%d</ReceivedBack>\n"
                   "</SiteInInsert>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[_eqmdl.entryid integerValue],_eqmdl.jobnumber,_jobsitetxtfld.text,_eqmdl.itemcode,_eqmdl.itemname,[_sendtxtfld.text integerValue],confirm,_notestxtview.text,0];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.100/service.asmx"];
    //  NSURL *url = [NSURL URLWithString:@"http://test3.kontract360.com/service.asmx"];;
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/SiteInInsert" forHTTPHeaderField:@"Soapaction"];
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

-(void)StockInInsert{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
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
                   "<QtySendNow>%d</QtySendNow>\n"
                   "<ConfirmStockOut>%d</ConfirmStockOut>\n"
                   "<Notes>%@</Notes>\n"
                   "<ThirdParty>%d</ThirdParty>\n"
                   "</StockInInsert>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[_eqmdl.entryid integerValue],_eqmdl.jobnumber,_jobsitetxtfld.text,_eqmdl.itemcode,_eqmdl.itemname,[_sendtxtfld.text integerValue],confirm,_notestxtview.text,thirdparty];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.100/service.asmx"];
    //  NSURL *url = [NSURL URLWithString:@"http://test3.kontract360.com/service.asmx"];;
    
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
    _jobsitetxtfld.text= [_jobdict objectForKey: _eqmdl.jobnumber];
    _jobsite1txtfld.text=[_jobdict objectForKey: _eqmdl.jobnumber];

    
}
#pragma mark - XMLParser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"JobsSelectResponse"])
    {
       // _jobarray=[[NSMutableArray alloc]init];
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
    if([elementName isEqualToString:@"StockOutInsertResult"])
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
    if([elementName isEqualToString:@"JobNumber"])
    {
        recordResults = FALSE;
        jobnumber=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"JobDescDetail"])
    {
        recordResults = FALSE;
        [_jobdict setObject:_soapResults forKey:jobnumber];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"result"])
    {
          recordResults = FALSE;
        if ([_soapResults isEqualToString:@"Inserted SiteIn"]) {
            
        }
        else{
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:_soapResults delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        [_confirmcheckbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        confirm=0;
            _sendtxtfld.text=@"";
            _notestxtview.text=@"";
            [_thirdbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
            thirdparty=0;
        }

         _soapResults = nil;
        
    }
}
#pragma Mark-AlertView
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if ([self.delegate respondsToSelector:@selector(toreloadtable)]) {
        [self.delegate toreloadtable];
        
        
        
    }
    
    
}
#pragma Mark-Buttons
- (IBAction)thirdbtn:(id)sender {
    btnclck1++;
    if (btnclck1%2!=0) {
        [_thirdbtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        thirdparty=1;
        
    }
    else
    {
        [_thirdbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        thirdparty=0;
        
    }

}

- (IBAction)confirmbtn:(id)sender {
    btnclck++;
    if (btnclck%2!=0) {
        [_confirmcheckbtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        confirm=1;
        [self SiteInInsert];
    }
    else
    {
        [_confirmcheckbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        confirm=0;
    }

}

- (IBAction)savebtn:(id)sender {
    [self StockOutInsert];
}

- (IBAction)confirm1btnlbl:(id)sender {
    btnclck2++;
    if (btnclck2%2!=0) {
        [_confirmlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        
    }
    else
    {
        [_confirmlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        
    }
    
    
    

}

- (IBAction)save1btn:(id)sender {
}

- (IBAction)closebtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
  
}
@end
