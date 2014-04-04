//
//  MangmntdetailsViewController.m
//  Newproject
//
//  Created by GMSIndia1 on 4/3/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "MangmntdetailsViewController.h"

@interface MangmntdetailsViewController ()

@end

@implementation MangmntdetailsViewController

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
    [[self.clausetxtview layer] setBorderColor:[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor];
    [[self.clausetxtview layer] setBorderWidth:3];
    [[self.clausetxtview layer] setCornerRadius:10];
     self.volumetitle.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    [[self.vlumeclautxtview layer] setBorderColor:[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor];
    [[self.vlumeclautxtview layer] setBorderWidth:3];
    [[self.vlumeclautxtview layer] setCornerRadius:10];
    self.vlumetable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    self.vlumetable.layer.borderWidth=2.0f;
    
    [[self.lbrclaustxtview layer] setBorderColor:[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor];
    [[self.lbrclaustxtview layer] setBorderWidth:3];
    [[self.lbrclaustxtview layer] setCornerRadius:10];
    [[self.labrview layer] setBorderColor:[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor];
    [[self.labrview layer] setBorderWidth:2];
    [[self.labrview layer] setCornerRadius:10];

    [[self.equpclause layer] setBorderColor:[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor];
    [[self.equpclause layer] setBorderWidth:3];
    [[self.equpclause layer] setCornerRadius:10];
    self.cfetable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    self.cfetable.layer.borderWidth=2.0f;
    self.tretable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    self.tretable.layer.borderWidth=2.0f;
    [[self.othrtermsclause layer] setBorderColor:[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor];
    [[self.othrtermsclause layer] setBorderWidth:3];
    [[self.othrtermsclause layer] setCornerRadius:10];
    self.basetable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    self.basetable.layer.borderWidth=2.0f;
    self.basetitle.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    self.fueltitle.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    self.fueltable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    self.fueltable.layer.borderWidth=2.0f;
    self.nonfueltitle.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    self.nonfueltable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    self.nonfueltable.layer.borderWidth=2.0f;
    self.smrtitle.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    self.smrtable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    self.smrtable.layer.borderWidth=2.0f;
    [[self.deliveryclausetxtview layer] setBorderColor:[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor];
    [[self.deliveryclausetxtview layer] setBorderWidth:3];
    [[self.deliveryclausetxtview layer] setCornerRadius:10];
    [[self.srstxtview layer] setBorderColor:[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor];
    [[self.srstxtview layer] setBorderWidth:3];
    [[self.srstxtview layer] setCornerRadius:10];
    self.doctitle.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    self.docutable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    self.docutable.layer.borderWidth=2.0f;


}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    _subcntrct=(subcontract *)[_detailsarray objectAtIndex:0];
    _clausetxtview.text=_subcntrct.Payementclause;
    _nettextfld.text=_subcntrct.NetDays;
    _vlumeclautxtview.text=_subcntrct.VolumeDisClause;
    _lbrclaustxtview.text=_subcntrct.LabourClause;
    _weekhrstxtfld.text=_subcntrct.WeeklyHours;
    _subcntrctbtn.text=_subcntrct.SubContractorMarkup;
    _equpclause.text=_subcntrct.EquipmentClause;
   
    _othrtermsclause.text=_subcntrct.OtherClause;
    _overtimetextfield.text=_subcntrct.OvertimeMarkupPer;
   // _premiumtimetxtfld.text=_subcntrct.
    _temtxtfld.text=_subcntrct.ThirdPartyequipmentMarkup;
    _leasemarkuptxtfld.text=_subcntrct.LeaseMarkup;
    _rentalmarkuptxtfld.text=_subcntrct.RentalMarkup;
    _materialpurchasetxtfld.text=_subcntrct.MaterialPurchaseMarkup;
    _deliveryclausetxtview.text=_subcntrct.DeliveryRatesClause;
    _srstxtview.text=_subcntrct.SpecialRatesStructure;
    
    NSLog(@"%@",_subcntrct.Payementclause);
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark-webservice
-(void)VolumeDiscountselect{
    tabletype=1;
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<VolumeDiscountselect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<ContractId>%d</ContractId>\n"
                   "</VolumeDiscountselect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_subcntrct.contractid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://ios.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/VolumeDiscountselect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)SelectMarkupMaster{
    tabletype=2;
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
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
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
    
    [_vlumetable reloadData];
}
#pragma mark - XMLParser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    if ([elementName isEqualToString:@"VolumeDiscountselectResult"])
    {
        _volumearray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"ContractID"])
    {
                if(!_soapResults)
        {
            _soapResults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"AmtFrom"])
    {
        if(!_soapResults)
        {
            _soapResults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }
    if ([elementName isEqualToString:@"AmtTo"])
    {
        if(!_soapResults)
        {
            _soapResults=[[NSMutableString alloc]init];
        }
        recordResults = TRUE;
        
    }

    if ([elementName isEqualToString:@"Percentage"])
    {
        if(!_soapResults)
        {
            _soapResults=[[NSMutableString alloc]init];
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
    if ([elementName isEqualToString:@"ContractID"])
    {
        _vlumemdl=[[Vlumedismdl alloc]init];
               recordResults = FALSE;
        _vlumemdl.contractid=_soapResults;
        _soapResults=nil;
        
    }
    if ([elementName isEqualToString:@"AmtFrom"])
    {
        recordResults = FALSE;
          _vlumemdl.amountfrom=_soapResults;
        _soapResults=nil;

        
    }
    if ([elementName isEqualToString:@"AmtTo"])
    {
        recordResults = FALSE;
          _vlumemdl.amountto=_soapResults;
        _soapResults=nil;

        
    }
    
    if ([elementName isEqualToString:@"Percentage"])
    {
        recordResults = FALSE;
          _vlumemdl.percentage=_soapResults;
        [_volumearray addObject:_vlumemdl];
        _soapResults=nil;

        
    }

}


#pragma mark-Tableview Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (tabletype) {
        case 1:
             return [_volumearray count];
            break;
            
        default:
            break;
    }
    return YES;
    // Return the number of rows in the section.
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        [[NSBundle mainBundle]loadNibNamed:@"volumediscountcell" owner:self options:nil];
        cell=_volumecell;
        
    }
    Vlumedismdl *vlmdl=(Vlumedismdl *)[_volumearray objectAtIndex:indexPath.row];
    _amuntfrmlbl=(UILabel *)[cell viewWithTag:1];
    _amuntfrmlbl.text=vlmdl.amountfrom;
    _amunttolbl=(UILabel *)[cell viewWithTag:2];
    _amunttolbl.text=vlmdl.amountto;
    _percentagelbl=(UILabel *)[cell viewWithTag:3];
    _percentagelbl.text=vlmdl.percentage;

    
    return cell;
    
    
}

- (IBAction)paymntbtn:(id)sender {
    _paymentview.hidden=NO;
     _volumeview.hidden=YES;
    _labrview.hidden=YES;
       _equpview.hidden=YES;
      _othrtrmsview.hidden=YES;
       _markupview.hidden=YES;
      _baseview.hidden=YES;
    _fuelview.hidden=YES;
     _nonfuelview.hidden=YES;
   _smrview.hidden=YES;
     _othrratesview.hidden=YES;
      _deliveryview.hidden=YES;
    _srsview.hidden=YES;
    _docuview.hidden=YES;


}

- (IBAction)volumebtn:(id)sender {
    [self VolumeDiscountselect];
    _volumeview.hidden=NO;
    _paymentview.hidden=YES;
  
    _labrview.hidden=YES;
       _equpview.hidden=YES;
      _othrtrmsview.hidden=YES;
       _markupview.hidden=YES;
      _baseview.hidden=YES;
    _fuelview.hidden=YES;
     _nonfuelview.hidden=YES;
       _smrview.hidden=YES;
     _othrratesview.hidden=YES;
      _deliveryview.hidden=YES;
    _srsview.hidden=YES;
    _docuview.hidden=YES;


}

- (IBAction)laborbtn:(id)sender {
    _volumeview.hidden=YES;
    _paymentview.hidden=YES;
    _labrview.hidden=NO;
     _equpview.hidden=YES;
      _othrtrmsview.hidden=YES;
       _markupview.hidden=YES;
      _baseview.hidden=YES;
    _fuelview.hidden=YES;
     _nonfuelview.hidden=YES;
   _smrview.hidden=YES;

     _othrratesview.hidden=YES;
      _deliveryview.hidden=YES;
    _srsview.hidden=YES;
    _docuview.hidden=YES;


}

- (IBAction)equpbtn:(id)sender {
    _paymentview.hidden=YES;
    _volumeview.hidden=YES;
    _labrview.hidden=YES;
    _equpview.hidden=NO;
      _othrtrmsview.hidden=YES;
       _markupview.hidden=YES;
      _baseview.hidden=YES;
    _fuelview.hidden=YES;
     _nonfuelview.hidden=YES;
       _smrview.hidden=YES;
     _othrratesview.hidden=YES;
      _deliveryview.hidden=YES;

    _srsview.hidden=YES;
    _docuview.hidden=YES;


}

- (IBAction)othrtermsbtn:(id)sender {
    _paymentview.hidden=YES;
    _volumeview.hidden=YES;
    _labrview.hidden=YES;
    _equpview.hidden=YES;
    _othrtrmsview.hidden=NO;
    _markupview.hidden=YES;
      _baseview.hidden=YES;
    _fuelview.hidden=YES;
     _nonfuelview.hidden=YES;
       _smrview.hidden=YES;
     _othrratesview.hidden=YES;
      _deliveryview.hidden=YES;

    
    _srsview.hidden=YES;
    _docuview.hidden=YES;


}

- (IBAction)markupbtn:(id)sender {
    [self SelectMarkupMaster];
    _paymentview.hidden=YES;
    _volumeview.hidden=YES;
    _labrview.hidden=YES;
    _equpview.hidden=YES;
    _othrtrmsview.hidden=YES;
    _markupview.hidden=NO;
     _baseview.hidden=YES;
    _fuelview.hidden=YES;
     _nonfuelview.hidden=YES;
       _smrview.hidden=YES;
     _othrratesview.hidden=YES;
      _deliveryview.hidden=YES;
    _srsview.hidden=YES;
    _docuview.hidden=YES;


}

- (IBAction)basebtn:(id)sender {
    _paymentview.hidden=YES;
    _volumeview.hidden=YES;
    _labrview.hidden=YES;
    _equpview.hidden=YES;
    _othrtrmsview.hidden=YES;
    _markupview.hidden=YES;
    _baseview.hidden=NO;
     _fuelview.hidden=YES;
     _nonfuelview.hidden=YES;
       _smrview.hidden=YES;
     _othrratesview.hidden=YES;
      _deliveryview.hidden=YES;
    _srsview.hidden=YES;
    _docuview.hidden=YES;


}

- (IBAction)fuelbtn:(id)sender {
    _paymentview.hidden=YES;
    _volumeview.hidden=YES;
    _labrview.hidden=YES;
    _equpview.hidden=YES;
    _othrtrmsview.hidden=YES;
    _markupview.hidden=YES;
    _baseview.hidden=YES;
    _fuelview.hidden=NO;
      _nonfuelview.hidden=YES;
       _smrview.hidden=YES;
     _othrratesview.hidden=YES;
      _deliveryview.hidden=YES;
    _srsview.hidden=YES;
    _docuview.hidden=YES;

}

- (IBAction)nonfuelbtn:(id)sender {
    _paymentview.hidden=YES;
    _volumeview.hidden=YES;
    _labrview.hidden=YES;
    _equpview.hidden=YES;
    _othrtrmsview.hidden=YES;
    _markupview.hidden=YES;
    _baseview.hidden=YES;
    _fuelview.hidden=YES;
    _nonfuelview.hidden=NO;
     _smrview.hidden=YES;
     _othrratesview.hidden=YES;
      _deliveryview.hidden=YES;
    _srsview.hidden=YES;
    _docuview.hidden=YES;


}

- (IBAction)SMRbtn:(id)sender {
    _paymentview.hidden=YES;
    _volumeview.hidden=YES;
    _labrview.hidden=YES;
    _equpview.hidden=YES;
    _othrtrmsview.hidden=YES;
    _markupview.hidden=YES;
    _baseview.hidden=YES;
    _fuelview.hidden=YES;
    _nonfuelview.hidden=YES;
    _smrview.hidden=NO;
     _othrratesview.hidden=YES;
      _deliveryview.hidden=YES;
    _srsview.hidden=YES;
    _docuview.hidden=YES;



}

- (IBAction)Orbtn:(id)sender {
    _paymentview.hidden=YES;
    _volumeview.hidden=YES;
    _labrview.hidden=YES;
    _equpview.hidden=YES;
    _othrtrmsview.hidden=YES;
    _markupview.hidden=YES;
    _baseview.hidden=YES;
    _fuelview.hidden=YES;
    _nonfuelview.hidden=YES;
    _smrview.hidden=YES;
    _othrratesview.hidden=NO;
    _deliveryview.hidden=YES;

    _srsview.hidden=YES;
    _docuview.hidden=YES;


}

- (IBAction)deliveryratebtn:(id)sender {
    _paymentview.hidden=YES;
    _volumeview.hidden=YES;
    _labrview.hidden=YES;
    _equpview.hidden=YES;
    _othrtrmsview.hidden=YES;
    _markupview.hidden=YES;
    _baseview.hidden=YES;
    _fuelview.hidden=YES;
    _nonfuelview.hidden=YES;
    _smrview.hidden=YES;
    _othrratesview.hidden=YES;
    _deliveryview.hidden=NO;
     _srsview.hidden=YES;
    _docuview.hidden=YES;


}

- (IBAction)srsbtn:(id)sender {
    _paymentview.hidden=YES;
    _volumeview.hidden=YES;
    _labrview.hidden=YES;
    _equpview.hidden=YES;
    _othrtrmsview.hidden=YES;
    _markupview.hidden=YES;
    _baseview.hidden=YES;
    _fuelview.hidden=YES;
    _nonfuelview.hidden=YES;
    _smrview.hidden=YES;
    _othrratesview.hidden=YES;
    _deliveryview.hidden=YES;
    _srsview.hidden=NO;
     _docuview.hidden=YES;

}

- (IBAction)docubtn:(id)sender {
    _paymentview.hidden=YES;
    _volumeview.hidden=YES;
    _labrview.hidden=YES;
    _equpview.hidden=YES;
    _othrtrmsview.hidden=YES;
    _markupview.hidden=YES;
    _baseview.hidden=YES;
    _fuelview.hidden=YES;
    _nonfuelview.hidden=YES;
    _smrview.hidden=YES;
    _othrratesview.hidden=YES;
    _deliveryview.hidden=YES;
    _srsview.hidden=YES;
    _docuview.hidden=NO;

}


/*btn outlets*/
- (IBAction)overcheckbtn:(id)sender {
}

- (IBAction)minimumhrsbtn:(id)sender {
}

- (IBAction)holidaysbtn:(id)sender {
}
- (IBAction)conequpbtn:(id)sender {
}

- (IBAction)thirdequpbtn:(id)sender {
}
- (IBAction)shopcheckbtn:(id)sender {
}

- (IBAction)consublebtn:(id)sender {
}

- (IBAction)smalltoolbtn:(id)sender {
}
- (IBAction)selectmarkupbtn:(id)sender {
}
- (IBAction)clsebtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
