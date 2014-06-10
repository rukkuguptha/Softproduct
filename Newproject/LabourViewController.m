//
//  LabourViewController.m
//  Newproject
//
//  Created by GMSIndia 2 on 09/06/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "LabourViewController.h"

@interface LabourViewController ()

@end

@implementation LabourViewController

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
  
    // Do any additional setup after loading the view from its nib.
    _titleview.backgroundColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    
    _labrtable.layer.borderWidth=2.0f;
    _labrtable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    // Do any additional setup after loading the view from its nib.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    _totalarray=[[NSMutableArray alloc]init];
    [self ProjectManPowerRequiredSelect];
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
#pragma mark-Tableview
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_labourarray count];
    
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellidentifier=@"mycell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellidentifier];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellidentifier];
        
        if(tableView==_labrtable)
        {
            [[NSBundle mainBundle]loadNibNamed:@"Lbrcuscell" owner:self options:nil];
            cell=_labrcell;
        }
    }
        if(tableView==_labrtable)
        {  Lburmdl*lmdl=(Lburmdl *)[_labourarray objectAtIndex:indexPath.row];
            _joblbl=(UILabel*)[cell viewWithTag:1];
            cell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12];
            _joblbl.text=lmdl.JobNumber;
            _itemcodelbl=(UILabel*)[cell viewWithTag:2];
           
            _itemcodelbl.text=lmdl.ItemCode;
            _deslbl=(UILabel*)[cell viewWithTag:3];
            _deslbl.text=lmdl.jbDescription;
            _datelbl=(UILabel*)[cell viewWithTag:4];
            NSArray*array=[lmdl.CalenderDate componentsSeparatedByString:@"T"];
            NSString*news=[array objectAtIndex:0];
            NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
            [dateFormat setDateFormat:@"yyyy-MM-dd"];
            NSDate *dates = [dateFormat dateFromString:news];
            [dateFormat setDateFormat:@"MM-dd-yyy"];
            NSString *myFormattedDate = [dateFormat stringFromDate:dates];
            _datelbl.text=myFormattedDate;

            _quantitylbl=(UILabel*)[cell viewWithTag:5];
            _quantitylbl.text=lmdl.qty;

        }
        

    
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    
    
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //alternating cell back ground color
    if(tableView==_labrtable)
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



#pragma mark-webservices
-(void)ProjectManPowerRequiredSelect
{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<ProjectManPowerRequiredSelect xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</ProjectManPowerRequiredSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.100/service.asmx"];
    
    //NSURL *url = [NSURL URLWithString:@"http://192.168.0.100/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/ProjectManPowerRequiredSelect" forHTTPHeaderField:@"Soapaction"];
    
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
    [self newcalcuations];
    [_labrtable reloadData];
  
}
#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"ProjectManPowerRequiredSelectResponse"])
    {
        _labourarray=[[NSMutableArray alloc]init];
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
    if([elementName isEqualToString:@"ItemCode"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Description"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"CalenderDate"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"qty"])
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
    if([elementName isEqualToString:@"ProjectManPowerRequiredSelectResponse"])
    {
        
        recordResults = FALSE;
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"JobNumber"])
    {
        
        recordResults = FALSE;
        _lbrmdl=[[Lburmdl alloc]init];
        _lbrmdl.JobNumber=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"ItemCode"])
    {
        
        recordResults = FALSE;
      
        _lbrmdl.ItemCode=_soapResults;
        _soapResults = nil;
    }

    if([elementName isEqualToString:@"Description"])
    {
        
        recordResults = FALSE;
       
        _lbrmdl.jbDescription=_soapResults;
        _soapResults = nil;
    }

    if([elementName isEqualToString:@"CalenderDate"])
    {
        
        recordResults = FALSE;
        _lbrmdl.CalenderDate=_soapResults;
        _soapResults = nil;
    }

    if([elementName isEqualToString:@"qty"])
    {
        
        recordResults = FALSE;
      
        _lbrmdl.qty=_soapResults;
        [_labourarray addObject:_lbrmdl];
        _soapResults = nil;
    }


}
#pragma mark-calculations
-(void)calculatesum
{
    
    int i;
    for (i=0; i<[_totalarray count]; i++)
    {
        sum=([[_totalarray objectAtIndex:i]integerValue])+sum;
      
        
        _totalquantitylabel.text=[NSString stringWithFormat:@"%d",sum]  ;
    }
}

-(void)newcalcuations{
    
    
            for (int i=0; i<[_labourarray count]; i++) {
                Lburmdl *lmdl=(Lburmdl *)[_labourarray objectAtIndex:i];
               
               
                [_totalarray addObject:[NSString stringWithFormat:@"%d",[lmdl.qty integerValue]]];
               
                
                if (i==[_labourarray count]-1) {
                    [self calculatesum];
                    sum=0;
                }
            }
    }

@end
