//
//  NewCustmrViewController.m
//  Newproject
//
//  Created by GMSIndia1 on 3/12/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "NewCustmrViewController.h"

@interface NewCustmrViewController ()

@end

@implementation NewCustmrViewController

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
    _titleview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    self.navgtnbar.tintColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _custmrtable.layer.borderWidth = 2.0;
    _custmrtable.layer.borderColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    self.addnavbar.tintColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _addresstxtview.layer.borderWidth = 2.0;
    _addresstxtview.layer.borderColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;


    
    /*searchbar*/
    _SearchingBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 220, 44)];
    _SearchingBar.delegate = (id)self;
    _SearchingBar.tintColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    self.custmrtable.tableHeaderView=_SearchingBar;

    _popoverArry=[[NSMutableArray alloc]initWithObjects:@"Contact Info",@"Sales Rep Info", nil];

    

}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self CustomerMasterselect];
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
    if(tableView==_popOverTableView)
    
    {
        switch (poptype) {
            case 1:
                 return [_statearray count];
                break;
            case 2:
                return [_countryarray count];
                break;
            case 3:
                return [_popoverArry count];
                break;

            default:
                break;
        }
       
        
         }
    if(tableView==_custmrtable)
    {
       

    return [_customerarray count];
    }
    
    return YES;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        if(tableView==_custmrtable)
        {
            [[NSBundle mainBundle]loadNibNamed:@"Customercell" owner:self options:nil];
            cell=_custmrcell;
            
            
        }
    }
    //cell.textLabel.text=@"Customer Name";
    if(tableView==_popOverTableView)
    {  cell.textLabel.font = [UIFont fontWithName:@"Helvetica Neue Light" size:12];
        cell.textLabel.font = [UIFont systemFontOfSize:12.0];
      
        switch (poptype) {
            case 1:
             cell.textLabel.text=[_statearray objectAtIndex:indexPath.row];
                break;
            case 2:
                  cell.textLabel.text=[_countryarray objectAtIndex:indexPath.row];
                
                break;
            case 3:
                cell.textLabel.text=[_popoverArry objectAtIndex:indexPath.row];
                
                break;
            default:
                break;

        
    }
    }
    if(tableView==_custmrtable)
    {
        Custmermdl *custmd=(Custmermdl *)[_customerarray objectAtIndex:indexPath.row];
        _namelbl=(UILabel *)[cell viewWithTag:1];
        _namelbl.text=custmd.customername;
        _citylbl= (UILabel *)[cell viewWithTag:2];
        _citylbl.text=custmd.city;
        _statelbl=(UILabel *)[cell viewWithTag:3];
        _statelbl.text=custmd.state;
        _cuntrylbl=(UILabel *)[cell viewWithTag:4];
        _cuntrylbl.text=custmd.country;
        _phonelbl=(UILabel *)[cell viewWithTag:5];
        _phonelbl.text=custmd.phone;
        _emaillbl=(UILabel *)[cell viewWithTag:6];
        _emaillbl.text=custmd.email;
        
        
        
        
        
    }
    
    
    
    
    
      
    

    return cell;

    
}
#pragma mark-Tableview delegates
-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    
}
    
    

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //alternating cell back ground color
    if(tableView==_custmrtable)
    {
        if (indexPath.row%2 == 0) {
            [cell setBackgroundColor:[UIColor whiteColor]];
            
            
        }else
        {
            
            //[cell setBackgroundColor:[UIColor colorWithRed:247.0/255.0f green:247.0/255.0f blue:247.0/255.0f alpha:1.0f]];
            [cell setBackgroundColor:[UIColor colorWithRed:227.0/255.0f green:240.0/255.0f blue:247.0/255.0f alpha:1.0f]];
        }
    }
    else
    {
        
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView==_custmrtable) {
            }
    
    if (tableView==_popOverTableView) {
        
        
        
        switch (poptype) {
            case 1:
                [_statebtnlbl setTitle:[_statearray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
               
                break;
            case 2:
                 [_cuntrybtnlbl setTitle:[_countryarray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
                
                break;
                case 3:
                if (indexPath.row==0) {
                    if (!self.cntctVctrl) {
                        self.cntctVctrl=[[ContactInfoViewController alloc]initWithNibName:@"ContactInfoViewController" bundle:nil];
                    }
                    _cntctVctrl.custmrcode=_custmrcode;
                    [self presentViewController:_cntctVctrl
                                       animated:YES completion:NULL];
                }
                
                if (indexPath.row==1) {
                    
                    if (!self.salesVCtrl) {
                        self.salesVCtrl=[[SalesRepInfoViewController alloc]initWithNibName:@"SalesRepInfoViewController" bundle:nil];
                    }
                    _salesVCtrl.ccode=_custmrcode;
                                      [self presentViewController:_salesVCtrl
                                       animated:YES completion:NULL];

                    
                    
                }
                
                
                [self.popOverController dismissPopoverAnimated:YES];
                

                break;

                
                
            default:
                break;

        }
        
        
        
    }
    
}

#pragma mark-webservice
-(void)CustomerMasterselect{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<CustomerMasterselect xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</CustomerMasterselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.125/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/CustomerMasterselect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)Stateselect{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<Stateselect xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</Stateselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.125/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/Stateselect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)countryselect{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<Countryselect xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</Countryselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.125/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/Countryselect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)CustomerMasterInsert{
    webtype=1;
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<CustomerMasterInsert xmlns=\"http://ios.kontract360.com/\">\n"
                   "<CustomerName>%@</CustomerName>\n"
                   "<Adress>%@</Adress>\n"
                   "<City>%@</City>\n"
                   "<State>%@</State>\n"
                   "<Zip>%@</Zip>\n"
                   "<Country>%d</Country>\n"
                   "<Phone>%@</Phone>\n"
                   "<Fax>%@</Fax>\n"
                   "<Email>%@</Email>\n"
                   "<Website>%@</Website>\n"
                  
                   "</CustomerMasterInsert>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n", _nametextfld.text,_addresstxtview.text,_citytxtfld.text,_statebtnlbl.titleLabel.text,_zipbtnlbl.text,[[_countrydict objectForKey:_cuntrybtnlbl.titleLabel.text]integerValue],_phonetxtfld.text, _faxtxtfld.text, _emailtxtfld.text,_websitetxtfld.text];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.125/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/CustomerMasterInsert" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)CustomerMasterUpdate{
    webtype=2;
    recordResults = FALSE;
    NSString *soapMessage;
    
      Custmermdl *custmd=(Custmermdl *)[_customerarray objectAtIndex:path];
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<CustomerMasterUpdate xmlns=\"http://ios.kontract360.com/\">\n"
                   "<Id>%d</Id>\n"
                   "<CustomerCode>%@</CustomerCode>\n"
                   "<CustomerName>%@</CustomerName>\n"
                   "<Adress>%@</Adress>\n"
                   "<City>%@</City>\n"
                   "<State>%@</State>\n"
                   "<Zip>%@</Zip>\n"
                   "<Country>%d</Country>\n"
                   "<Phone>%@</Phone>\n"
                   "<Fax>%@</Fax>\n"
                   "<Email>%@</Email>\n"
                   "<Website>%@</Website>\n"
                    "</CustomerMasterUpdate>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n", [custmd.customerid integerValue],custmd.customercode,_nametextfld.text,_addresstxtview.text,_citytxtfld.text,_statebtnlbl.titleLabel.text,_zipbtnlbl.text,[[_countrydict objectForKey:_cuntrybtnlbl.titleLabel.text]integerValue],_phonetxtfld.text, _faxtxtfld.text, _emailtxtfld.text,_websitetxtfld.text];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.125/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/CustomerMasterUpdate" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)CustomerMaster1Search{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<CustomerMaster1Search xmlns=\"http://ios.kontract360.com/\">\n"
                    "<searchtext>%@</searchtext>\n"
                   "</CustomerMaster1Search>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_searchstring];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.125/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/CustomerMaster1Search" forHTTPHeaderField:@"Soapaction"];
    
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
    UIAlertView *  Alert=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"ERROR with theConnection" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    
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
    
    [_custmrtable reloadData];
    
       [_popOverTableView reloadData];
   

    
}


#pragma mark - XMLParser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    
    if([elementName isEqualToString:@"CustomerMasterselectResult"])
    {
        _customerarray=[[NSMutableArray alloc]init];
               if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"CustomerId"])
    {
               if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"CustomerCode"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"CustomerName"])
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

    if([elementName isEqualToString:@"Email"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Website"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Location"])
    {
      if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    
    if([elementName isEqualToString:@"StateselectResult"])
    {_statearray=[[NSMutableArray alloc]init];
        _statedict=[[NSMutableDictionary alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"state_id"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }


    if([elementName isEqualToString:@"state_name"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"CountryselectResult"])
    {
        _countryarray=[[NSMutableArray alloc]init];
        _countrydict=[[NSMutableDictionary alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"CountryCode"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"CountryName"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"CustomerMasterUpdateResult"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"CustomerMaster1SearchResponse"])
    {  _customerarray=[[NSMutableArray alloc]init];

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
    if([elementName isEqualToString:@"CustomerId"])
    {
        _custmdl=[[Custmermdl alloc]init];
        recordResults = FALSE;
        _custmdl.customerid=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Id"])
    {
        _custmdl=[[Custmermdl alloc]init];
        recordResults = FALSE;
        
        _soapResults = nil;
    }

    if([elementName isEqualToString:@"CustomerCode"])
    {
        recordResults = FALSE;
         _custmdl.customercode=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"CustomerName"])
    {
        recordResults = FALSE;
         _custmdl.customername=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Address"])
    {
        recordResults = FALSE;
         _custmdl.custmraddress=_soapResults;
        _soapResults = nil;

    }
    if([elementName isEqualToString:@"City"])
    {
        recordResults = FALSE;
         _custmdl.city=_soapResults;
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"State"])
    {
        recordResults = FALSE;
          _custmdl.state=_soapResults;
        _soapResults = nil;

    }
    
    if([elementName isEqualToString:@"Zip"])
    {
        recordResults = FALSE;
        _soapResults = nil;

    }
    
    if([elementName isEqualToString:@"Country"])
    {
        recordResults = FALSE;
          _custmdl.country=@"USA";
        _soapResults = nil;

    }
    if([elementName isEqualToString:@"Phone"])
    {
        recordResults = FALSE;
          _custmdl.phone=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Fax"])
    {
        recordResults = FALSE;
          _custmdl.fax=_soapResults;
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"Email"])
    {
        recordResults = FALSE;
          _custmdl.email=_soapResults;
        
        _soapResults = nil;

    }
    if([elementName isEqualToString:@"Website"])
    {
        recordResults = FALSE;
        _custmdl.website=_soapResults;
              _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"Location"])
    {
        recordResults = FALSE;
        _custmdl.locatn=_soapResults;
        [_customerarray addObject:_custmdl];
        _soapResults = nil;
        
    }
    


 
    if([elementName isEqualToString:@"state_id"])
    {
        recordResults = FALSE;
        stateid=_soapResults;
        _soapResults = nil;
    }
    
    
    if([elementName isEqualToString:@"state_name"])
    {
        recordResults = FALSE;
        [_statearray addObject:_soapResults];
        [_statedict setObject:stateid forKey:_soapResults];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"CountryCode"])
    {
        recordResults = FALSE;
        cuntryid=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"CountryName"])
    {
        recordResults = FALSE;
        [_countryarray addObject:_soapResults];
        [_countrydict setObject:cuntryid forKey:_soapResults];
        _soapResults = nil;
    }


}
#pragma mark-popover
-(void)createpopover{
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 200, 100)];
    
    popoverView.backgroundColor = [UIColor whiteColor];
    _popOverTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 200, 100)];
    
    _popOverTableView.delegate=(id)self;
    _popOverTableView.dataSource=(id)self;
    _popOverTableView.rowHeight= 32;
    _popOverTableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    
    
    // CGRect rect = frame;
    [popoverView addSubview:_popOverTableView];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(200, 100);
    
    //create a popover controller
    
    self.popOverController = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    
    if(poptype==1){
        
     [self.popOverController presentPopoverFromRect:_statebtnlbl.frame
                                             inView:self.addview permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
    }
    if(poptype==2){
        [self.popOverController presentPopoverFromRect:_cuntrybtnlbl.frame
                                                inView:self.addview permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
        
    }
        

    
}

#pragma mark-Searchbar
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    
    _searchstring=_SearchingBar.text;
    //NSLog(@"search%@",searchstring);
    [self CustomerMaster1Search];
    [searchBar resignFirstResponder];
    
    
}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    [self CustomerMasterselect];
    
}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    
    if ([_SearchingBar.text length]==0) {
        
         [self CustomerMasterselect];
        // [searchBar resignFirstResponder];
        
        
    }
    //[searchBar resignFirstResponder];
    
    
}

#pragma mark-Button Actions

- (IBAction)clsebtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)addcustmrbtn:(id)sender {
    _addview.hidden=NO;
   }

- (IBAction)deletecustmrbtn:(id)sender {
}

- (IBAction)statebtn:(id)sender {
    poptype=1;
    [self createpopover];
    [self Stateselect];
}

- (IBAction)cuntrybtn:(id)sender {
    poptype=2;
    [self createpopover];
    [self countryselect];
}

- (IBAction)updatebtn:(id)sender {
    if (webtype==1) {
        [self CustomerMasterInsert];

    }
    else{
        [self CustomerMasterUpdate];
    }
  
}

- (IBAction)cancelbtn:(id)sender {
    _nametextfld.text=@"";
    _addresstxtview.text=@"";
    _citytxtfld.text=@"";
    [_statebtnlbl setTitle:@"Select" forState:UIControlStateNormal];
    [_cuntrybtnlbl setTitle:@"Select" forState:UIControlStateNormal];
    _websitetxtfld.text=@"";
    _zipbtnlbl.text=@"";
    _emailtxtfld.text=@"";
    _phonetxtfld.text=@"";
    _faxtxtfld.text=@"";

}

- (IBAction)clseviewbtn:(id)sender {
    _addview.hidden=YES;

}

- (IBAction)editbtn:(id)sender {
     _addview.hidden=NO;
    button = (UIButton *)sender;
    CGPoint center= button.center;
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.custmrtable];
    NSIndexPath *textFieldIndexPath = [self.custmrtable indexPathForRowAtPoint:rootViewPoint];
    NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
    path=textFieldIndexPath.row;
    Custmermdl *custmd=(Custmermdl *)[_customerarray objectAtIndex:path];
    _nametextfld.text=custmd.customername;
    _addresstxtview.text=custmd.custmraddress;
    _citytxtfld.text=custmd.city;
    [_statebtnlbl setTitle:custmd.state forState:UIControlStateNormal];
    [_cuntrybtnlbl setTitle:custmd.country forState:UIControlStateNormal];
    _websitetxtfld.text=custmd.website;
    _zipbtnlbl.text=custmd.zip;
    _emailtxtfld.text=custmd.email;
    _phonetxtfld.text=custmd.phone;
    _faxtxtfld.text=custmd.fax;
    
    
    

}

- (IBAction)disclurebtn:(id)sender {
    poptype=3;
    
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 120, 70)];
    
    popoverView.backgroundColor = [UIColor whiteColor];
    _popOverTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 120, 70)];
    
    _popOverTableView.delegate=(id)self;
    _popOverTableView.dataSource=(id)self;
    _popOverTableView.rowHeight= 32;
    _popOverTableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    
    
    // CGRect rect = frame;
    [popoverView addSubview:_popOverTableView];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(120, 70);
    
    //create a popover controller
    
    self.popOverController = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    
    
    button = (UIButton *)sender;
    UITableViewCell *cell = (UITableViewCell *)[[button superview] superview];
    CGPoint center= button.center;
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.custmrtable];
    NSIndexPath *textFieldIndexPath = [self.custmrtable indexPathForRowAtPoint:rootViewPoint];
    NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
    btnindex=textFieldIndexPath.row;
    
    Custmermdl *custmd=(Custmermdl *)[_customerarray objectAtIndex:textFieldIndexPath.row];
    _custmrcode=custmd.customercode;
    [self.popOverController presentPopoverFromRect:_disclurebtnlbl.frame inView:cell permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
    

}
@end
