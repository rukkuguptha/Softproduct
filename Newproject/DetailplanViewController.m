//
//  DetailplanViewController.m
//  Newproject
//
//  Created by GMSIndia 2 on 13/02/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "DetailplanViewController.h"

@interface DetailplanViewController ()

@end

@implementation DetailplanViewController

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
    _scaffoldtable.layer.borderWidth=4.0f;
    _scaffoldtable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _scaffoldtabletitleview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
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
    [self ScaffoldingSelectScaffoldtype];
    //[self ScaffoldingSelectplan];
}
-(IBAction)addplan:(id)sender
{
    
}
-(IBAction)detailscaffoldaction:(id)sender
{
    if (!self.allctrlr) {
        self.allctrlr=[[AllDetailsplandisplayViewController alloc]initWithNibName:@"AllDetailsplandisplayViewController" bundle:nil];
    }
    button = (UIButton *)sender;
    CGPoint center= button.center;
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.scaffoldtable];
    NSIndexPath *textFieldIndexPath = [self.scaffoldtable indexPathForRowAtPoint:rootViewPoint];
    NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
    btnindex=textFieldIndexPath.row;

    Customscaffoldingplan*scaffldingplan=(Customscaffoldingplan *)[_scaffoldingplanlistarray objectAtIndex:btnindex];
    Scaffoldtypemdl*typemdl=(Scaffoldtypemdl *)[_scaffoldtyperesultarray objectAtIndex:btnindex];
    _allctrlr.sccfldtypemdl=typemdl;
    _allctrlr.customsccfldmdl=scaffldingplan;
    _allctrlr.modalPresentationStyle=UIModalPresentationFullScreen;
    _allctrlr.modalTransitionStyle=UIModalTransitionStyleCoverVertical;
    [self presentViewController:_allctrlr
                       animated:YES completion:NULL];
}
-(IBAction)closeplan:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}
- (IBAction)Scaffoldslection:(id)sender
{
    _scaffoldbtn.tintColor=[UIColor whiteColor];
     _fireproofingbtn.tintColor=[UIColor blackColor];
       _insulationbtn.tintColor=[UIColor blackColor];
    _scaffoldview.hidden=NO;
//    _fireproofingview.hidden=YES;
//    _insulationview.hidden=YES;
}
- (IBAction)InsulationSelection:(id)sender
{
    _insulationbtn.tintColor=[UIColor whiteColor];
     _scaffoldbtn.tintColor=[UIColor blackColor];
     _fireproofingbtn.tintColor=[UIColor blackColor];
   
//    _scaffoldview.hidden=YES;
//    _fireproofingview.hidden=YES;
//     _insulationview.hidden=NO;
}
- (IBAction)fireproofingselection:(id)sender
{
    _fireproofingbtn.tintColor=[UIColor whiteColor];
    _insulationbtn.tintColor=[UIColor blackColor];
     _scaffoldbtn.tintColor=[UIColor blackColor];
//    _fireproofingview.hidden=NO;
//    _scaffoldview.hidden=YES;
//    _insulationview.hidden=YES;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}

#pragma mark-Tableview
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(tableView==_scaffoldtable)
    {
        return [_scaffoldingplanlistarray count];
    }
       return YES;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellidentifier=@"mycell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellidentifier];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellidentifier];
        
        if(tableView==_scaffoldtable)
        {
            [[NSBundle mainBundle]loadNibNamed:@"scaffoldcell" owner:self options:nil];
            cell=_scaffoldcell;
        }
        
        
    }
     if(tableView==_scaffoldtable)
     {
         Customscaffoldingplan*scaffmdl=(Customscaffoldingplan *)[_scaffoldingplanlistarray objectAtIndex:indexPath.row];
         _unitcelllabel=(UILabel*)[cell viewWithTag:1];
         _unitcelllabel.text=scaffmdl.unit;
        _equipcelllabel=(UILabel*)[cell viewWithTag:2];
         _equipcelllabel.text=scaffmdl.equp;

         _pjctheadercelllabel=(UILabel*)[cell viewWithTag:3];
         _pjctheadercelllabel.text=scaffmdl.ph;

         _scaffoldcellalbel=(UILabel*)[cell viewWithTag:4];
         _scaffoldcellalbel.text=scaffmdl.scaffoldname;
         //[NSString stringWithFormat:@"%d",scaffmdl.typescaffold];

         _lengthcelllabel=(UILabel*)[cell viewWithTag:5];
        _lengthcelllabel.text=scaffmdl.length;

         _widthcelllabel=(UILabel*)[cell viewWithTag:6];
         _widthcelllabel.text=scaffmdl.width;
         _heightcelllabel=(UILabel*)[cell viewWithTag:7];
        _heightcelllabel.text=scaffmdl.height;
         
         _quantitycelllabel=(UILabel*)[cell viewWithTag:8];
         _quantitycelllabel.text=scaffmdl.qty;
         
         _elevationcelllabel=(UILabel*)[cell viewWithTag:9];
         _elevationcelllabel.text=scaffmdl.elevation;
         _manhourslabel=(UILabel*)[cell viewWithTag:10];
         _manhourslabel.text=scaffmdl.manhours;


     }
    
    return cell;
    
}
-(void)ScaffoldingSelectScaffoldtype{
    webtype=1;
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<ScaffoldingSelectScaffoldtype xmlns=\"http://ios.kontract360.com/\">\n"
                  "</ScaffoldingSelectScaffoldtype>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://ios.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/ScaffoldingSelectScaffoldtype" forHTTPHeaderField:@"Soapaction"];
    
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

-(void)ScaffoldingSelectplan{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<ScaffoldingSelectplan xmlns=\"http://ios.kontract360.com/\">\n"
                    "<planid>%@</planid>\n"
                   "</ScaffoldingSelectplan>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_planid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://ios.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/ScaffoldingSelectplan" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)connection:(NSURLConnection*)connection didReceiveResponse:(NSURLResponse *)response
{
    [_webData setLength: 0];
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
   	[_webData appendData:data];
}
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    UIAlertView *  Alert=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"ERROR with the Connection" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    
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
    [_scaffoldtable reloadData];
    if (webtype==1) {
        [self ScaffoldingSelectplan];
        webtype=0;
    }


}
#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"ScaffoldingSelectplanResult"])
    {
        _scaffoldingplanlistarray=[[NSMutableArray alloc]init];
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"id"])
    {
       
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"length"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"width"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"height"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"qty"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"elevation"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"unit"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"equp"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ph"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"typeofscaffold"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Decking"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"HandRail"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Tarpaulin"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Plasticsheet"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"InternalWorkFactor"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"PPE"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"UnplannedWork"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ManHoures"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ErectHoures"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"DesmandleHoures"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"planid"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ScaffoldingSelectScaffoldtypeResult"])
    {
        _scaffoldtyperesultarray=[[NSMutableArray alloc]init];
        _scaffoldtypeDict=[[NSMutableDictionary alloc]init];
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"scaffoldId"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"typename"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"rate"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ftupto33"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ftupto100"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ftupto165"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ft3upto1750"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ft3upto7000"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ft3upto18000"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ft3g18000"])
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
    if([elementName isEqualToString:@"ScaffoldingSelectplanResult"])
    {
               recordResults = FALSE;
        
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"id"])
    {
        _scfldmdl=[[Customscaffoldingplan alloc]init];
        recordResults = FALSE;
        _scfldmdl.idvalue=[_soapresults integerValue];;
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"length"])
    {
        
        recordResults = FALSE;
        _scfldmdl.length=_soapresults;
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"width"])
    {
        
        recordResults = FALSE;
        _scfldmdl.width=_soapresults;
        _soapresults = nil;
    }

    if([elementName isEqualToString:@"height"])
    {
        
        recordResults = FALSE;
        _scfldmdl.height=_soapresults;
        _soapresults = nil;
    }

    if([elementName isEqualToString:@"qty"])
    {
        
        recordResults = FALSE;
        _scfldmdl.qty=_soapresults;
        _soapresults = nil;
    }

    if([elementName isEqualToString:@"elevation"])
    {
        
        recordResults = FALSE;
        _scfldmdl.elevation=_soapresults;
        _soapresults = nil;
    }

    if([elementName isEqualToString:@"unit"])
    {
        
        recordResults = FALSE;
        _scfldmdl.unit=_soapresults;
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"equp"])
    {
        
        recordResults = FALSE;
        _scfldmdl.equp=_soapresults;
        _soapresults = nil;
    }

    if([elementName isEqualToString:@"ph"])
    {
        
        recordResults = FALSE;
        _scfldmdl.ph=_soapresults;
        _soapresults = nil;
    }

    if([elementName isEqualToString:@"typeofscaffold"])
    {
        
        recordResults = FALSE;
         NSString *scaffoldname=[_scaffoldtypeDict objectForKey:_soapresults];
        _scfldmdl.typescaffold=[_soapresults integerValue];
        _scfldmdl.scaffoldname=scaffoldname;
        _soapresults = nil;
    }

    if([elementName isEqualToString:@"Decking"])
    {
        
        recordResults = FALSE;
        _scfldmdl.decking=_soapresults;
        _soapresults = nil;
    }

    if([elementName isEqualToString:@"HandRail"])
    {
        
        recordResults = FALSE;
        _scfldmdl.handrail=_soapresults;
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"Tarpaulin"])
    {
        
        recordResults = FALSE;
        _scfldmdl.tarpaulin=_soapresults;
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"Plasticsheet"])
    {
        
        recordResults = FALSE;
        _scfldmdl.Plasticsheet=_soapresults;
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"InternalWorkFactor"])
    {
        
        recordResults = FALSE;
        _scfldmdl.internalworkfactor=[_soapresults integerValue];
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"PPE"])
    {
        
        recordResults = FALSE;
        _scfldmdl.ppe=[_soapresults integerValue];
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"UnplannedWork"])
    {
        
        recordResults = FALSE;
        _scfldmdl.unplannedwork=[_soapresults integerValue];
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"ManHoures"])
    {
        
        recordResults = FALSE;
        _scfldmdl.manhours=_soapresults;
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"ErectHoures"])
    {
        
        recordResults = FALSE;
        _scfldmdl.erecthours=_soapresults;
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"DesmandleHoures"])
    {
        
        recordResults = FALSE;
        _scfldmdl.dismantlehours=_soapresults;
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"planid"])
    {
        
        recordResults = FALSE;
        _scfldmdl.pid=_soapresults;
        [_scaffoldingplanlistarray addObject:_scfldmdl];
        _soapresults = nil;
    }
    
    
    if([elementName isEqualToString:@"ScaffoldingSelectScaffoldtypeResult"])
    {
        
        recordResults = FALSE;
       
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"scaffoldId"])
    {
        _typemdl=[[Scaffoldtypemdl alloc]init];
        recordResults = FALSE;
        _scaffoldtypestring=_soapresults;
        _typemdl.scaffoldid=[_soapresults integerValue];
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"typename"])
    {
       
        recordResults = FALSE;
        _typemdl.typeName=_soapresults;
        [_scaffoldtypeDict setObject:_soapresults forKey:_scaffoldtypestring];
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"rate"])
    {
        
        recordResults = FALSE;
        _typemdl.rate=_soapresults;
        _soapresults = nil;
    }

    if([elementName isEqualToString:@"ftupto33"])
    {
        
        recordResults = FALSE;
        _typemdl.ftupto33=_soapresults;
        _soapresults = nil;
    }

    if([elementName isEqualToString:@"ftupto100"])
    {
        
        recordResults = FALSE;
        _typemdl.ftupto100=_soapresults;
        _soapresults = nil;
    }

    if([elementName isEqualToString:@"ftupto165"])
    {
        
        recordResults = FALSE;
        _typemdl.ftupto165=_soapresults;
        _soapresults = nil;
    }

    if([elementName isEqualToString:@"ft3upto1750"])
    {
        
        recordResults = FALSE;
        _typemdl.ft3upto1750=_soapresults;
        _soapresults = nil;
    }

    if([elementName isEqualToString:@"ft3upto7000"])
    {
        
        recordResults = FALSE;
        _typemdl.ft3upto7000=_soapresults;
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"ft3upto18000"])
    {
        
        recordResults = FALSE;
        _typemdl.ft3upto18000=_soapresults;
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"ft3g18000"])
    {
        
        recordResults = FALSE;
        _typemdl.ft3g18000=_soapresults;
        [_scaffoldtyperesultarray addObject:_typemdl];
        _soapresults = nil;
    }



    



    





}

@end
