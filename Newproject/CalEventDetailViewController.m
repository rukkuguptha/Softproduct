//
//  CalEventDetailViewController.m
//  Newproject
//
//  Created by GMSIndia 2 on 28/05/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "CalEventDetailViewController.h"

@interface CalEventDetailViewController ()

@end

@implementation CalEventDetailViewController

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
    _mattitleview.backgroundColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _mantitleview.backgroundColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _summarytitleview.backgroundColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _calmanpwrtable.layer.borderWidth = 2.0;
    _calmanpwrtable.layer.borderColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _sumtable.layer.borderWidth = 2.0;
    _sumtable.layer.borderColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    tooltype=1;
    _mantitleview.hidden=NO;
    _mattitleview.hidden=YES;
    _summarytitleview.hidden=YES;
    _sumtable.hidden=YES;

    // Do any additional setup after loading the view from its nib.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    tooltype=1;
    _mantitleview.hidden=NO;
    _mattitleview.hidden=YES;
    _summarytitleview.hidden=YES;
      _sumtable.hidden=YES;
    //[_calmanpwrtable reloadData];
    _calmanpwrtable.hidden=NO;
    _totalarray=[[NSMutableArray alloc]init];
    [self CalenderManPowerSelect];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)clsebtn:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}
- (IBAction)manpoweraction:(id)sender
{
    tooltype=1;
     _totalarray=[[NSMutableArray alloc]init];
    _mantitleview.hidden=NO;
    _mattitleview.hidden=YES;
    _summarytitleview.hidden=YES;
    _sumtable.hidden=YES;
    //[_calmanpwrtable reloadData];
    _calmanpwrtable.hidden=NO;
    
     [self CalenderManPowerSelect];
}
- (IBAction)equipmentaction:(id)sender
{
    tooltype=2;
    _totalarray=[[NSMutableArray alloc]init];
    _mantitleview.hidden=YES;
    _summarytitleview.hidden=YES;
    _mattitleview.hidden=NO;
    _sumtable.hidden=YES;
    _calmanpwrtable.hidden=NO;
    [self CalenderEquipmentSelect];
   // [_calmanpwrtable reloadData];
}
- (IBAction)materialaction:(id)sender
{
    tooltype=3;
     _totalarray=[[NSMutableArray alloc]init];
    _totalarray=[[NSMutableArray alloc]init];
    _mantitleview.hidden=YES;
    _summarytitleview.hidden=YES;
    _mattitleview.hidden=NO;
    _sumtable.hidden=YES;
    _calmanpwrtable.hidden=NO;
   [self CalenderOtherSelect];
    //[_calmanpwrtable reloadData];
}
- (IBAction)summaryaction:(id)sender
{
    tooltype=4;
    _mantitleview.hidden=YES;
    _mattitleview.hidden=YES;
    _summarytitleview.hidden=NO;
    _calmanpwrtable.hidden=YES;
    _sumtable.hidden=NO;
}

#pragma mark-tableview datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView==_calmanpwrtable) {
        if (tooltype==1) {
            
            return [_manpwrarray count];
           }
        if (tooltype==2) {
            
            return [_eqpmntarray count];
        }
        if (tooltype==3) {
            
           [_eqpmntarray count];
        }
    }
    if (tableView==_sumtable) {
      //  if (tooltype==4) {
            
            return 5;
       // }
    }
    
    return YES;
    
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
        if (tableView==_calmanpwrtable) {
            if (tooltype==1) {
                [[NSBundle mainBundle]loadNibNamed:@"Eventcalcell" owner:self options:nil];
                cell=_calmanpwrcell;
            }
            if (tooltype==2) {
                [[NSBundle mainBundle]loadNibNamed:@"Matcalevecell" owner:self options:nil];
                cell=_calmaterialcell;
            }
            if (tooltype==3) {
                [[NSBundle mainBundle]loadNibNamed:@"Matcalevecell" owner:self options:nil];
                cell=_calmaterialcell;
            }
           
            
        }
        if (tableView==_sumtable)
        {
           // if (tooltype==4) {
                [[NSBundle mainBundle]loadNibNamed:@"Sumcell" owner:self options:nil];
                cell=_sumcell;
            //}
        }
    }
        cell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12];
        if (tableView==_calmanpwrtable) {
            if (tooltype==1) {

              
                Detaileventmanpwr *manmdl=(Detaileventmanpwr *)[_manpwrarray objectAtIndex:indexPath.row];
                
                _manitemcodelabel=(UILabel *)[cell viewWithTag:1];
                _manitemcodelabel.text=manmdl.ItemCode;
                _mandeslabel=(UILabel *)[cell viewWithTag:2];
                _mandeslabel.text=manmdl.eventDescription;
                _manpdatelabel=(UILabel *)[cell viewWithTag:3];
                _manpdatelabel.text=_selecteddate;
                _manqtylabel=(UILabel *)[cell viewWithTag:4];
                _manqtylabel.text=manmdl.Qty;
                _manstlabel=(UILabel *)[cell viewWithTag:5];
                _manstlabel.text=manmdl.ST;

                _manotlabel=(UILabel *)[cell viewWithTag:6];
                _manotlabel.text=manmdl.OT;

                _manstratelabel=(UILabel *)[cell viewWithTag:7];
                _manstratelabel.text=manmdl.STrate;
                _manotratelabel=(UILabel *)[cell viewWithTag:8];
                _manotratelabel.text=manmdl.OTrate;

                NSInteger A1=([manmdl.ST integerValue])*([manmdl.STrate integerValue]);
                 NSInteger A2=([manmdl.OT integerValue])*([manmdl.OTrate integerValue]);
                NSInteger B=A1+A2;
                NSInteger total=B*([manmdl.Qty integerValue]);
                NSLog(@"%d",total);
               
             _manotratelabel=(UILabel *)[cell viewWithTag:9];
                _mantotallabel.text=[NSString stringWithFormat:@"%d",total];
                 [_totalarray addObject:[NSString stringWithFormat:@"%d",total]];
                 NSLog(@"%@",_totalarray);
                int i;
                if (indexPath.row==[_manpwrarray count]-1) {
                    [self calculatesum];
                    sum=0;
//                for (i=0; i<[_totalarray count]; i++)
//                {
//                    sum=([[_totalarray objectAtIndex:i]integerValue])+sum;
//                     NSLog(@"%d",sum);
//                    _totallabel.text=[NSString stringWithFormat:@"%d",sum]  ;
//                }
                }
        
    }
            if (tooltype==2)
            {
               _totallabel.text=@"";
                Eqeventmdl *eqmdl=(Eqeventmdl *)[_eqpmntarray objectAtIndex:indexPath.row];
                
                _Eqitemcodelabel=(UILabel *)[cell viewWithTag:1];
                _Eqitemcodelabel.text=eqmdl.ItemCode;
                _Eqdeslabel=(UILabel *)[cell viewWithTag:2];
                _Eqdeslabel.text=eqmdl.eventDescription;
                _Eqdatelabel=(UILabel *)[cell viewWithTag:3];
                _Eqdatelabel.text=_selecteddate;
                _Eqqtylabel=(UILabel *)[cell viewWithTag:4];
                _Eqqtylabel.text=eqmdl.Qty;
                _Eqtotallabel=(UILabel *)[cell viewWithTag:5];
                 NSInteger B1=([eqmdl.UnitCost integerValue])*([eqmdl.Qty integerValue]);
                _Eqtotallabel.text=[NSString stringWithFormat:@"%d",B1];
                [_totalarray addObject:[NSString stringWithFormat:@"%d",B1]];
                NSLog(@"%@",_totalarray);
                int i;
                if (indexPath.row==[_eqpmntarray count]-1) {
                    [self calculatesum];
                    sum=0;
//                    for (i=0; i<[_totalarray count]; i++)
//                    {
//                        eqsum=([[_totalarray objectAtIndex:i]integerValue])+eqsum;
//                        NSLog(@"%d",eqsum);
//                        _totallabel.text=[NSString stringWithFormat:@"%d",eqsum]  ;              }
                }
                


                
            }
            if (tooltype==3)
            { _totallabel.text=@"";
                
                Eqeventmdl *eqmdl=(Eqeventmdl *)[_eqpmntarray objectAtIndex:indexPath.row];
                
                _Eqitemcodelabel=(UILabel *)[cell viewWithTag:1];
                _Eqitemcodelabel.text=eqmdl.ItemCode;
                _Eqdeslabel=(UILabel *)[cell viewWithTag:2];
                _Eqdeslabel.text=eqmdl.eventDescription;
                _Eqdatelabel=(UILabel *)[cell viewWithTag:3];
                _Eqdatelabel.text=_selecteddate;
                _Eqqtylabel=(UILabel *)[cell viewWithTag:4];
                _Eqqtylabel.text=eqmdl.Qty;
                _Eqtotallabel=(UILabel *)[cell viewWithTag:5];
                NSInteger B1=([eqmdl.UnitCost integerValue])*([eqmdl.Qty integerValue]);
                _Eqtotallabel.text=[NSString stringWithFormat:@"%d",B1];
                [_totalarray addObject:[NSString stringWithFormat:@"%d",B1]];
                NSLog(@"%@",_totalarray);
                int i;
                if (indexPath.row==[_eqpmntarray count]-1) {
                    
//                    for (i=0; i<[_totalarray count]; i++)
//                    {
//                        matsum=([[_totalarray objectAtIndex:i]integerValue])+matsum;
//                        NSLog(@"%d",matsum);
//                        _totallabel.text=[NSString stringWithFormat:@"%d",matsum]  ;              }
                    [self calculatesum];
                    sum=0;
                }
                


            }

        
    
        }
    
    return cell;
        

}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //alternating cell back ground color
    if(tableView==_calmanpwrtable||(tableView==_sumtable))
    {
        if (indexPath.row%2 == 0) {
            [cell setBackgroundColor:[UIColor whiteColor]];
            
        }else
        {
            
            //[cell setBackgroundColor:[UIColor colorWithRed:247.0/255.0f green:247.0/255.0f blue:247.0/255.0f alpha:1.0f]];
            [cell setBackgroundColor:[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f]];
            
            
        }
    }
}
-(void)calculatesum
{ int i;
    for (i=0; i<[_totalarray count]; i++)
    {
        sum=([[_totalarray objectAtIndex:i]integerValue])+sum;
        NSLog(@"%d",sum);
        _totallabel.text=[NSString stringWithFormat:@"%d",sum]  ;
    }
}


-(void)CalenderManPowerSelect
{
    recordResults = FALSE;
    NSString *soapMessage;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString*estmtn = [defaults objectForKey:@"Estimationid"];
//    NSDateFormatter *dateFormat1 = [[NSDateFormatter alloc] init];
//    [dateFormat1 setDateFormat:@"MM/dd/yyyy"];
//    NSDate *dates = [dateFormat1 dateFromString:_selecteddate];
//    NSLog(@"s%@",dates);
//    NSDateFormatter *dateFormat2 = [[NSDateFormatter alloc]init];
//    [dateFormat2 setDateFormat: @"yyyy-MM-dd"];
//    
//    NSString*    dateString = [dateFormat2 stringFromDate:dates];
     NSLog(@"s%@",_selecteddate);
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<CalenderManPowerSelect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<LeadId>%d</LeadId>\n"
                   "<CalenderDate>%@</CalenderDate>\n"
                   "</CalenderManPowerSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[estmtn integerValue],_selecteddate];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.100/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/CalenderManPowerSelect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)CalenderEquipmentSelect
{
    recordResults = FALSE;
    NSString *soapMessage;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString*estmtn = [defaults objectForKey:@"Estimationid"];
    //    NSDateFormatter *dateFormat1 = [[NSDateFormatter alloc] init];
    //    [dateFormat1 setDateFormat:@"MM/dd/yyyy"];
    //    NSDate *dates = [dateFormat1 dateFromString:_selecteddate];
    //    NSLog(@"s%@",dates);
    //    NSDateFormatter *dateFormat2 = [[NSDateFormatter alloc]init];
    //    [dateFormat2 setDateFormat: @"yyyy-MM-dd"];
    //
    //    NSString*    dateString = [dateFormat2 stringFromDate:dates];
    NSLog(@"s%@",_selecteddate);
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<CalenderEquipmentSelect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<LeadId>%d</LeadId>\n"
                   "<CalenderDate>%@</CalenderDate>\n"
                   "</CalenderEquipmentSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[estmtn integerValue],_selecteddate];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.100/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/CalenderEquipmentSelect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)CalenderOtherSelect
{
    recordResults = FALSE;
    NSString *soapMessage;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString*estmtn = [defaults objectForKey:@"Estimationid"];
    //    NSDateFormatter *dateFormat1 = [[NSDateFormatter alloc] init];
    //    [dateFormat1 setDateFormat:@"MM/dd/yyyy"];
    //    NSDate *dates = [dateFormat1 dateFromString:_selecteddate];
    //    NSLog(@"s%@",dates);
    //    NSDateFormatter *dateFormat2 = [[NSDateFormatter alloc]init];
    //    [dateFormat2 setDateFormat: @"yyyy-MM-dd"];
    //
    //    NSString*    dateString = [dateFormat2 stringFromDate:dates];
    NSLog(@"s%@",_selecteddate);
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<CalenderOtherSelect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<LeadId>%d</LeadId>\n"
                   "<CalenderDate>%@</CalenderDate>\n"
                   "</CalenderOtherSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[estmtn integerValue],_selecteddate];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.100/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/CalenderOtherSelect" forHTTPHeaderField:@"Soapaction"];
    
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
	
	
	if( _xmlparser
       )
	{
		
	}
	
	_xmlparser = [[NSXMLParser alloc] initWithData: _webData];
	[_xmlparser setDelegate:(id)self];
	[_xmlparser setShouldResolveExternalEntities: YES];
	[_xmlparser parse];
    [_calmanpwrtable reloadData];
   
    

}

#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"CalenderManPowerSelectResponse"])
    {_manpwrarray=[[NSMutableArray alloc]init];
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
    if([elementName isEqualToString:@"Qty"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"ST"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"OT"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }

    if([elementName isEqualToString:@"STrate"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }

    if([elementName isEqualToString:@"OTrate"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }

    if([elementName isEqualToString:@"CalenderEquipmentSelectResponse"])
    {_eqpmntarray=[[NSMutableArray alloc]init];
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"eqItemCode"])
    {        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }

    if([elementName isEqualToString:@"EQDescription"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }

    if([elementName isEqualToString:@"UnitCost"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }

    if([elementName isEqualToString:@"EqQty"])
    {
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"CalenderOtherSelectResponse"])
    {_eqpmntarray=[[NSMutableArray alloc]init];
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"OtherItemCode"])
    {        if(!_soapresults)
    {
        _soapresults = [[NSMutableString alloc] init];
    }
        recordResults = TRUE;
        
    }
    
    if([elementName isEqualToString:@"OtherCodeDescription"])
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
    if([elementName isEqualToString:@"CalenderManPowerSelect"])
    {
        
        recordResults = FALSE;
        
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"ItemCode"])
    {
        _manpwr=[[Detaileventmanpwr alloc]init];
        recordResults = FALSE;
        
        _manpwr.ItemCode=_soapresults;
        _soapresults = nil;

        
    }
    if([elementName isEqualToString:@"Description"])
    {
        recordResults = FALSE;
        _manpwr.eventDescription=_soapresults;
        
        _soapresults = nil;
        
    }
    if([elementName isEqualToString:@"Qty"])
    {
       
        recordResults = FALSE;
        _manpwr.Qty=_soapresults;
        
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"ST"])
    {
        recordResults = FALSE;
        _manpwr.ST=_soapresults;
        _soapresults = nil;

        
    }
    if([elementName isEqualToString:@"OT"])
    {
        recordResults = FALSE;
        _manpwr.OT=_soapresults;
        
        _soapresults = nil;
        
    }
    
    if([elementName isEqualToString:@"STrate"])
    {
        recordResults = FALSE;
        _manpwr.STrate=_soapresults;
        
        _soapresults = nil;
        
    }
    
    if([elementName isEqualToString:@"OTrate"])
    {
        recordResults = FALSE;
        _manpwr.OTrate=_soapresults;
        [_manpwrarray addObject:_manpwr];
        _soapresults = nil;
        
    }
    if([elementName isEqualToString:@"eqItemCode"])
    {     _eqmdl=[[Eqeventmdl alloc]init];
        recordResults = FALSE;
        
        _eqmdl.ItemCode=_soapresults;
        _soapresults = nil;
    }
    
    if([elementName isEqualToString:@"EQDescription"])
    {
        
        recordResults = FALSE;
        
        _eqmdl.eventDescription=_soapresults;
        _soapresults = nil;
        
    }
    
    if([elementName isEqualToString:@"UnitCost"])
    {recordResults = FALSE;
        
        _eqmdl.UnitCost=_soapresults;
        _soapresults = nil;
           }
    
    if([elementName isEqualToString:@"EqQty"])
    {
        recordResults = FALSE;
        
        _eqmdl.Qty=_soapresults;
        [_eqpmntarray addObject:_eqmdl];
        _soapresults = nil;
        
    }
    if([elementName isEqualToString:@"OtherItemCode"])
    {     _eqmdl=[[Eqeventmdl alloc]init];
        recordResults = FALSE;
        
        _eqmdl.ItemCode=_soapresults;
        _soapresults = nil;
    }
    
    if([elementName isEqualToString:@"OtherCodeDescription"])
    {
        
        recordResults = FALSE;
        
        _eqmdl.eventDescription=_soapresults;
        _soapresults = nil;
        
    }
    
//    if([elementName isEqualToString:@"UnitCost"])
//    {recordResults = FALSE;
//        
//        _eqmdl.UnitCost=_soapresults;
//        _soapresults = nil;
//    }
    
    if([elementName isEqualToString:@"OtherQty"])
    {
        recordResults = FALSE;
        
        _eqmdl.Qty=_soapresults;
        [_eqpmntarray addObject:_eqmdl];
        _soapresults = nil;
        
    }



}

@end
