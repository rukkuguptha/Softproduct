//
//  CompanyViewController.m
//  Newproject
//
//  Created by GMSIndia 2 on 19/06/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import "CompanyViewController.h"

@interface CompanyViewController ()

@end

@implementation CompanyViewController

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
//    _scroll.frame=CGRectMake(0, 0,1024, 768);
//    [_scroll setContentSize:CGSizeMake(1024,850)];
    self.navigationController.navigationBar.tintColor=[UIColor blackColor];

    // Do any additional setup after loading the view from its nib.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self Getbasicinfo];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - arvinice


-(void)Getbasicinfo{
    recordResults = FALSE;
    NSString *soapMessage;
   
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<GetBasicInfo xmlns=\"http://arvin.kontract360.com/\">\n"
                   
                   "</GetBasicInfo>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://arvin.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://arvin.kontract360.com/GetBasicInfo" forHTTPHeaderField:@"Soapaction"];
    
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

-(void)SaveBasicInfo{
    recordResults = FALSE;
    NSString *soapMessage;
     NSString * letter=@"";
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SaveBasicInfo xmlns=\"http://arvin.kontract360.com/\">\n"
                   "<CompanyName>%@</CompanyName>\n"
                   "<Address>%@</Address>\n"
                   "<City>%@</City>\n"
                   "<State>%@</State>\n"
                   "<Zip>%@</Zip>\n"
                   "<Country>%@</Country>\n"
                   "<Phone>%@</Phone>\n"
                   "<Fax>%@</Fax>\n"
                   "<email>%@</email>\n"
                   "<WebSite>%@</WebSite>\n"
                   "<FederalEmployerId>%@</FederalEmployerId>\n"
                   "<StateEmployerId>%@</StateEmployerId>\n"
                   "<StateUnemploymentId>%@</StateUnemploymentId>\n"
                   "<LetterHead>%@</LetterHead>\n"
                   "</SaveBasicInfo>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_companynametxtfld.text,_addresstxtfld.text,_citytxtfld.text,_statetextfld.text,_ziptextfld.text,_coutryBtn.titleLabel.text,_phonetxtfld.text,_faxtxtfld.text,_mailtxtfld.text,_webtxtfld.text,_fedraltxtfld.text,_stateempIdtxtfld.text,_stateunempidtxtfld.text,letter];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://arvin.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://arvin.kontract360.com/SaveBasicInfo" forHTTPHeaderField:@"Soapaction"];
    
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
      
    
}
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"GetBasicInfoResult"])
    {
       
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Id"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"CompanyName"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Address"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"City"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"State"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Zip"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Country"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Phone"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    
    if([elementName isEqualToString:@"Fax"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    
    if([elementName isEqualToString:@"email"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"WebSite"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"FederalEmployerId"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"StateUnemploymentId"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }



    if([elementName isEqualToString:@"StateEmployerId"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"LetterHead"])
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
    if([elementName isEqualToString:@"GetBasicInfoResult"])
    {
        
        recordResults = FALSE;
                
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Id"])
    {
        
        recordResults = FALSE;
        
        _soapResults = nil;
    }



    if([elementName isEqualToString:@"CompanyName"])
    {
        
        recordResults = FALSE;
        _companynametxtfld.text=_soapResults;
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Address"])
    {
        
        recordResults = FALSE;
        _addresstxtfld.text=_soapResults;
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"City"])
    {
        
        recordResults = FALSE;
        _citytxtfld.text=_soapResults;
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"State"])
    {
        
        recordResults = FALSE;
        _statetextfld.text=_soapResults;
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Zip"])
    {
        
        recordResults = FALSE;
        _ziptextfld.text=_soapResults;
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Country"])
    {
        
        recordResults = FALSE;
       [_coutryBtn setTitle:_soapResults forState:UIControlStateNormal];
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Phone"])
    {
        
        recordResults = FALSE;
        _phonetxtfld.text=_soapResults;
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Fax"])
    {
        
        recordResults = FALSE;
        _faxtxtfld.text=_soapResults;
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"email"])
    {
        
        recordResults = FALSE;
        _mailtxtfld.text=_soapResults;
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"WebSite"])
    {
        
        recordResults = FALSE;
        _webtxtfld.text=_soapResults;
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"FederalEmployerId"])
    {
        
        recordResults = FALSE;
        _fedraltxtfld.text=_soapResults;
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"StateEmployerId"])
    {
        
        recordResults = FALSE;
        _stateempIdtxtfld.text=_soapResults;
        
        _soapResults = nil;
    }

    if([elementName isEqualToString:@"StateUnemploymentId"])
    {
        
        recordResults = FALSE;
        _stateunempidtxtfld.text=_soapResults;
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"LetterHead"])
    {
        
        recordResults = FALSE;
        
        
        _soapResults = nil;
    }




}


#pragma mark - Buttons
- (IBAction)savebtn:(id)sender {
    [self SaveBasicInfo];
}

-(IBAction)cancel:(id)sender
{
    
}
-(IBAction)closethecompany:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}
@end
