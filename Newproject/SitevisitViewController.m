//
//  SitevisitViewController.m
//  Newproject
//
//  Created by GMSIndia 2 on 13/02/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "SitevisitViewController.h"

@interface SitevisitViewController ()

@end

@implementation SitevisitViewController

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
    
    [[UIToolbar appearance] setTintColor:[UIColor redColor]];
    _prdunratetble.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _prdunratetble.layer.borderWidth=3.0;
    _documenttable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _documenttable.layer.borderWidth=3.0;
  
    _tabletitleview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _jobsitetable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _jobsitetable.layer.borderWidth=3.0;
    _jobsitetitleview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _safteytitleview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _safetytableview.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _safetytableview.layer.borderWidth=3.0;
    _neweqmnttitile.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _newequipmenttable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _newequipmenttable.layer.borderWidth=3.0;
    _worktitleview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _workscdletable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _workscdletable.layer.borderWidth=3.0;
    _meetingtitleview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _meetingtable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _meetingtable.layer.borderWidth=3.0;
    _bidderstitle.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _bidderstable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _bidderstable.layer.borderWidth=3.0;

    _weathertitle.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _weathertable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _weathertable.layer.borderWidth=3.0;

    _notestitle.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _notestable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _notestable.layer.borderWidth=3.0;
    
    _cmpxtyofwrk=[[NSMutableArray alloc]initWithObjects:@"Easy",@"Moderate",@"Difficult", nil];
    
    _gernalbtnlbl.tintColor=[UIColor whiteColor];

    }


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
     _companynametxtfld.text=_companyname;
    [self ListSiteVisitGeneral];
    
    _gernalbtnlbl.tintColor=[UIColor whiteColor];
    _pratebtnlbl.tintColor=[UIColor blackColor];
    _documntbtnlbl.tintColor=[UIColor blackColor];
    _accesbltybtnlbl.tintColor=[UIColor blackColor];
    _EstggAreabtnlbl.tintColor=[UIColor blackColor];
    _jobsitebtnlbl.tintColor=[UIColor blackColor];
    _saftybtnlbl.tintColor=[UIColor blackColor];
    _equpmntslbl.tintColor=[UIColor blackColor];
    _workbtnlbl.tintColor=[UIColor blackColor];
    _meetingnotesbtnlbl.tintColor=[UIColor blackColor];
    _biddersbtnlbl.tintColor=[UIColor blackColor];
    _weatherbtnlbl.tintColor=[UIColor blackColor];
    _notesbtnlbl.tintColor=[UIColor blackColor];
    

    
    
    _gernalview.hidden=NO;
    _rateview.hidden=YES;
    _docmntview.hidden=YES;
    _accblitytxtview.hidden=YES;
    _equipmentview.hidden=YES;
    _jobsiteview.hidden=YES;
    _safetyview.hidden=YES;
    _neweqmntview.hidden=YES;
    _workschdleview.hidden=YES;
    _meetingview.hidden=YES;
    _biddersview.hidden=YES;
    _weatherview.hidden=YES;
    _notesview.hidden=YES;
    

    
    
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark-webservice
-(void)ListSiteVisitGeneral{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<ListSiteVisitGeneral xmlns=\"http://ios.kontract360.com/\">\n"
                     "<planid>%@</planid>\n"
                   "</ListSiteVisitGeneral>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_companyid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://ios.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/ListSiteVisitGeneral" forHTTPHeaderField:@"Soapaction"];
    
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


#pragma mark-tableview datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView==_popOverTableView) {
        return [_cmpxtyofwrk count];
    }
    else{
        
        return 5;

    }
    
    return YES;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        if (tableView==_prdunratetble) {
             [[NSBundle mainBundle]loadNibNamed:@"Ratecellview" owner:self options:nil];
            
             cell=_ratecell;
        }
        if (tableView==_documenttable) {
                 [[NSBundle mainBundle]loadNibNamed:@"cellfordocumnt" owner:self options:nil];
            
            cell=_docucell;
            
        }

        
        if (tableView==_jobsitetable) {
            [[NSBundle mainBundle]loadNibNamed:@"Jobsitecellview" owner:self options:nil];
            
            cell=_jobsitecell;
            
        }
        

       
    }
    
    
      if (tableView==_popOverTableView) {
          
           cell.textLabel.text=[_cmpxtyofwrk objectAtIndex:indexPath.row];

      }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //alternating cell back ground color
    if(tableView==_documenttable||tableView==_prdunratetble)
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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView==_popOverTableView) {
        
        [_complextyofwrkbtnlbl setTitle:[_cmpxtyofwrk objectAtIndex:indexPath.row] forState:UIControlStateNormal];
       
    }
}


#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"ListSiteVisitGeneralResult"])
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
    if([elementName isEqualToString:@"Zip"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Complexity"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"FacilityDetails"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ScopeofWork"])
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
  
    if([elementName isEqualToString:@"Location"])
    {
        recordResults = FALSE;
        
        _loctntxtfld.text=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Zip"])
    {  recordResults = FALSE;
        
        _ziptxtfld.text=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Complexity"])
    {
        recordResults = FALSE;
        [_complextyofwrkbtnlbl setTitle:_soapResults forState:UIControlStateNormal];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"FacilityDetails"])
    {
        recordResults = FALSE;
        _facilitytxtview.text=_soapResults;
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"ScopeofWork"])
    {
        recordResults = FALSE;
        _scpeofwrktxtview.text=_soapResults;
        
        _soapResults = nil;
    }

   }

#pragma mark-popovers
-(void)createpopover{
    
    
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 120, 120)];
    
    popoverView.backgroundColor = [UIColor whiteColor];
    _popOverTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 120, 120)];
    
    _popOverTableView.delegate=(id)self;
    _popOverTableView.dataSource=(id)self;
    _popOverTableView.rowHeight= 32;
    _popOverTableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    
    
    // CGRect rect = frame;
    [popoverView addSubview:_popOverTableView];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(120, 120);
    
    //create a popover controller
    
    self.popOverController = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    
    //
    //    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    //    CGRect rect=CGRectMake(cell.bounds.origin.x+90, cell.bounds.origin.y+10, 50, 30);
    //    [self.popOverController presentPopoverFromRect:_disclsurelbl.bounds inView:self.view permittedArrowDirections:nil animated:YES];
    
    
    
    
    
    
    [self.popOverController presentPopoverFromRect:_complextyofwrkbtnlbl.frame
                                            inView:self.gernalview
                          permittedArrowDirections:UIPopoverArrowDirectionUp
                                          animated:YES];

    
}

#pragma mark-Barbuttonitems


- (IBAction)generalbtn:(id)sender {
    _gernalbtnlbl.tintColor=[UIColor whiteColor];
    _pratebtnlbl.tintColor=[UIColor blackColor];
    _documntbtnlbl.tintColor=[UIColor blackColor];
    _accesbltybtnlbl.tintColor=[UIColor blackColor];
    _EstggAreabtnlbl.tintColor=[UIColor blackColor];
    _jobsitebtnlbl.tintColor=[UIColor blackColor];
    _saftybtnlbl.tintColor=[UIColor blackColor];
    _equpmntslbl.tintColor=[UIColor blackColor];
    _workbtnlbl.tintColor=[UIColor blackColor];
    _meetingnotesbtnlbl.tintColor=[UIColor blackColor];
    _biddersbtnlbl.tintColor=[UIColor blackColor];
    _weatherbtnlbl.tintColor=[UIColor blackColor];
    _notesbtnlbl.tintColor=[UIColor blackColor];

    _gernalview.hidden=NO;
     _rateview.hidden=YES;
    _docmntview.hidden=YES;
     _accblitytxtview.hidden=YES;
    _equipmentview.hidden=YES;
      _jobsiteview.hidden=YES;
    _safetyview.hidden=YES;
   _neweqmntview.hidden=YES;
    _workschdleview.hidden=YES;
    _meetingview.hidden=YES;
    _biddersview.hidden=YES;
    _weatherview.hidden=YES;
    _notesview.hidden=YES;
}

- (IBAction)prductnbtn:(id)sender {
    _gernalbtnlbl.tintColor=[UIColor blackColor];
    _pratebtnlbl.tintColor=[UIColor whiteColor];
    _documntbtnlbl.tintColor=[UIColor blackColor];
    _accesbltybtnlbl.tintColor=[UIColor blackColor];
    _EstggAreabtnlbl.tintColor=[UIColor blackColor];
    _jobsitebtnlbl.tintColor=[UIColor blackColor];
    _saftybtnlbl.tintColor=[UIColor blackColor];
    _equpmntslbl.tintColor=[UIColor blackColor];
    _workbtnlbl.tintColor=[UIColor blackColor];
    _meetingnotesbtnlbl.tintColor=[UIColor blackColor];
    _biddersbtnlbl.tintColor=[UIColor blackColor];
    _weatherbtnlbl.tintColor=[UIColor blackColor];
    _notesbtnlbl.tintColor=[UIColor blackColor];
    
     _gernalview.hidden=YES;
    _rateview.hidden=NO;
    _docmntview.hidden=YES;
     _accblitytxtview.hidden=YES;
    _equipmentview.hidden=YES;
      _jobsiteview.hidden=YES;
    _safetyview.hidden=YES;
   _neweqmntview.hidden=YES;
    _workschdleview.hidden=YES;
    _meetingview.hidden=YES;
    _biddersview.hidden=YES;
    _weatherview.hidden=YES;
    _notesview.hidden=YES;


}

- (IBAction)documntbtn:(id)sender {
    _gernalbtnlbl.tintColor=[UIColor blackColor];
    _pratebtnlbl.tintColor=[UIColor blackColor];
    _documntbtnlbl.tintColor=[UIColor whiteColor];
    _accesbltybtnlbl.tintColor=[UIColor blackColor];
    _EstggAreabtnlbl.tintColor=[UIColor blackColor];
    _jobsitebtnlbl.tintColor=[UIColor blackColor];
    _saftybtnlbl.tintColor=[UIColor blackColor];
    _equpmntslbl.tintColor=[UIColor blackColor];
    _workbtnlbl.tintColor=[UIColor blackColor];
    _meetingnotesbtnlbl.tintColor=[UIColor blackColor];
    _biddersbtnlbl.tintColor=[UIColor blackColor];
    _weatherbtnlbl.tintColor=[UIColor blackColor];
    _notesbtnlbl.tintColor=[UIColor blackColor];

    
    
    _gernalview.hidden=YES;
    _rateview.hidden=YES;
    _docmntview.hidden=NO;
    _accblitytxtview.hidden=YES;
    _equipmentview.hidden=YES;
      _jobsiteview.hidden=YES;
    _safetyview.hidden=YES;
       _neweqmntview.hidden=YES;
    _workschdleview.hidden=YES;
    _meetingview.hidden=YES;
    _biddersview.hidden=YES;
    _weatherview.hidden=YES;
    _notesview.hidden=YES;


}

- (IBAction)acceblitybtn:(id)sender {
    
    _gernalbtnlbl.tintColor=[UIColor blackColor];
    _pratebtnlbl.tintColor=[UIColor blackColor];
    _documntbtnlbl.tintColor=[UIColor blackColor];
    _accesbltybtnlbl.tintColor=[UIColor whiteColor];
    _EstggAreabtnlbl.tintColor=[UIColor blackColor];
    _jobsitebtnlbl.tintColor=[UIColor blackColor];
    _saftybtnlbl.tintColor=[UIColor blackColor];
    _equpmntslbl.tintColor=[UIColor blackColor];
    _workbtnlbl.tintColor=[UIColor blackColor];
    _meetingnotesbtnlbl.tintColor=[UIColor blackColor];
    _biddersbtnlbl.tintColor=[UIColor blackColor];
    _weatherbtnlbl.tintColor=[UIColor blackColor];
    _notesbtnlbl.tintColor=[UIColor blackColor];

    _gernalview.hidden=YES;
    _rateview.hidden=YES;
    _docmntview.hidden=YES;
    _accessview.hidden=NO;
      _equipmentview.hidden=YES;
      _jobsiteview.hidden=YES;
    _safetyview.hidden=YES;
       _neweqmntview.hidden=YES;
    _workschdleview.hidden=YES;
    _meetingview.hidden=YES;
    _biddersview.hidden=YES;
    _weatherview.hidden=YES;
    _notesview.hidden=YES;


}

- (IBAction)Equmntstgareabtn:(id)sender {
    
    _gernalbtnlbl.tintColor=[UIColor blackColor];
    _pratebtnlbl.tintColor=[UIColor blackColor];
    _documntbtnlbl.tintColor=[UIColor blackColor];
    _accesbltybtnlbl.tintColor=[UIColor blackColor];
    _EstggAreabtnlbl.tintColor=[UIColor whiteColor];
    _jobsitebtnlbl.tintColor=[UIColor blackColor];
    _saftybtnlbl.tintColor=[UIColor blackColor];
    _equpmntslbl.tintColor=[UIColor blackColor];
    _workbtnlbl.tintColor=[UIColor blackColor];
    _meetingnotesbtnlbl.tintColor=[UIColor blackColor];
    _biddersbtnlbl.tintColor=[UIColor blackColor];
    _weatherbtnlbl.tintColor=[UIColor blackColor];
    _notesbtnlbl.tintColor=[UIColor blackColor];

    
    _gernalview.hidden=YES;
    _rateview.hidden=YES;
    _docmntview.hidden=YES;
    _accessview.hidden=YES;
    _equipmentview.hidden=NO;
     _jobsiteview.hidden=YES;
    _safetyview.hidden=YES;
       _neweqmntview.hidden=YES;
    _workschdleview.hidden=YES;

    _meetingview.hidden=YES;
    _biddersview.hidden=YES;
    _weatherview.hidden=YES;
    _notesview.hidden=YES;


}

- (IBAction)jobsitebtn:(id)sender {
    
    _gernalbtnlbl.tintColor=[UIColor blackColor];
    _pratebtnlbl.tintColor=[UIColor blackColor];
    _documntbtnlbl.tintColor=[UIColor blackColor];
    _accesbltybtnlbl.tintColor=[UIColor blackColor];
    _EstggAreabtnlbl.tintColor=[UIColor blackColor];
    _jobsitebtnlbl.tintColor=[UIColor whiteColor];
    _saftybtnlbl.tintColor=[UIColor blackColor];
    _equpmntslbl.tintColor=[UIColor blackColor];
    _workbtnlbl.tintColor=[UIColor blackColor];
    _meetingnotesbtnlbl.tintColor=[UIColor blackColor];
    _biddersbtnlbl.tintColor=[UIColor blackColor];
    _weatherbtnlbl.tintColor=[UIColor blackColor];
    _notesbtnlbl.tintColor=[UIColor blackColor];

    _gernalview.hidden=YES;
    _rateview.hidden=YES;
    _docmntview.hidden=YES;
    _accessview.hidden=YES;
    _equipmentview.hidden=YES;
    _jobsiteview.hidden=NO;
     _safetyview.hidden=YES;
       _neweqmntview.hidden=YES;
    _workschdleview.hidden=YES;
    _meetingview.hidden=YES;
    _biddersview.hidden=YES;
    _weatherview.hidden=YES;
    _notesview.hidden=YES;

    
}

- (IBAction)safetybtn:(id)sender {
    
    _gernalbtnlbl.tintColor=[UIColor blackColor];
    _pratebtnlbl.tintColor=[UIColor blackColor];
    _documntbtnlbl.tintColor=[UIColor blackColor];
    _accesbltybtnlbl.tintColor=[UIColor blackColor];
    _EstggAreabtnlbl.tintColor=[UIColor blackColor];
    _jobsitebtnlbl.tintColor=[UIColor blackColor];
    _saftybtnlbl.tintColor=[UIColor whiteColor];
    _equpmntslbl.tintColor=[UIColor blackColor];
    _workbtnlbl.tintColor=[UIColor blackColor];
    _meetingnotesbtnlbl.tintColor=[UIColor blackColor];
    _biddersbtnlbl.tintColor=[UIColor blackColor];
    _weatherbtnlbl.tintColor=[UIColor blackColor];
    _notesbtnlbl.tintColor=[UIColor blackColor];

    _gernalview.hidden=YES;
    _rateview.hidden=YES;
    _docmntview.hidden=YES;
    _accessview.hidden=YES;
    _equipmentview.hidden=YES;
    _jobsiteview.hidden=YES;
    _safetyview.hidden=NO;
       _neweqmntview.hidden=YES;
    _workschdleview.hidden=YES;
    _meetingview.hidden=YES;
    _biddersview.hidden=YES;
    _weatherview.hidden=YES;
    _notesview.hidden=YES;

    
}

- (IBAction)newequipmentbtn:(id)sender {
    _gernalbtnlbl.tintColor=[UIColor blackColor];
    _pratebtnlbl.tintColor=[UIColor blackColor];
    _documntbtnlbl.tintColor=[UIColor blackColor];
    _accesbltybtnlbl.tintColor=[UIColor blackColor];
    _EstggAreabtnlbl.tintColor=[UIColor blackColor];
    _jobsitebtnlbl.tintColor=[UIColor blackColor];
    _saftybtnlbl.tintColor=[UIColor blackColor];
    _equpmntslbl.tintColor=[UIColor whiteColor];
    _workbtnlbl.tintColor=[UIColor blackColor];
    _meetingnotesbtnlbl.tintColor=[UIColor blackColor];
    _biddersbtnlbl.tintColor=[UIColor blackColor];
    _weatherbtnlbl.tintColor=[UIColor blackColor];
    _notesbtnlbl.tintColor=[UIColor blackColor];

    _gernalview.hidden=YES;
    _rateview.hidden=YES;
    _docmntview.hidden=YES;
    _accessview.hidden=YES;
    _equipmentview.hidden=YES;
    _jobsiteview.hidden=YES;
    _safetyview.hidden=YES;
    
    _neweqmntview.hidden=NO;
      _workschdleview.hidden=YES;
    _meetingview.hidden=YES;
    _biddersview.hidden=YES;
    _weatherview.hidden=YES;
    _notesview.hidden=YES;


    
}

- (IBAction)workschedulebtn:(id)sender {
    _gernalbtnlbl.tintColor=[UIColor blackColor];
    _pratebtnlbl.tintColor=[UIColor blackColor];
    _documntbtnlbl.tintColor=[UIColor blackColor];
    _accesbltybtnlbl.tintColor=[UIColor blackColor];
    _EstggAreabtnlbl.tintColor=[UIColor blackColor];
    _jobsitebtnlbl.tintColor=[UIColor blackColor];
    _saftybtnlbl.tintColor=[UIColor blackColor];
    _equpmntslbl.tintColor=[UIColor blackColor];
    _workbtnlbl.tintColor=[UIColor whiteColor];
    _meetingnotesbtnlbl.tintColor=[UIColor blackColor];
    _biddersbtnlbl.tintColor=[UIColor blackColor];
    _weatherbtnlbl.tintColor=[UIColor blackColor];
    _notesbtnlbl.tintColor=[UIColor blackColor];

    _gernalview.hidden=YES;
    _rateview.hidden=YES;
    _docmntview.hidden=YES;
    _accessview.hidden=YES;
    _equipmentview.hidden=YES;
    _jobsiteview.hidden=YES;
    _safetyview.hidden=YES;
    _neweqmntview.hidden=YES;
    _workschdleview.hidden=NO;
    _meetingview.hidden=YES;
    _biddersview.hidden=YES;
    _weatherview.hidden=YES;
    _notesview.hidden=YES;

    

    
}

- (IBAction)meetingnotesbtn:(id)sender {
    _gernalbtnlbl.tintColor=[UIColor blackColor];
    _pratebtnlbl.tintColor=[UIColor blackColor];
    _documntbtnlbl.tintColor=[UIColor blackColor];
    _accesbltybtnlbl.tintColor=[UIColor blackColor];
    _EstggAreabtnlbl.tintColor=[UIColor blackColor];
    _jobsitebtnlbl.tintColor=[UIColor blackColor];
    _saftybtnlbl.tintColor=[UIColor blackColor];
    _equpmntslbl.tintColor=[UIColor blackColor];
    _workbtnlbl.tintColor=[UIColor blackColor];
    _meetingnotesbtnlbl.tintColor=[UIColor whiteColor];
    _biddersbtnlbl.tintColor=[UIColor blackColor];
    _weatherbtnlbl.tintColor=[UIColor blackColor];
    _notesbtnlbl.tintColor=[UIColor blackColor];

    _gernalview.hidden=YES;
    _rateview.hidden=YES;
    _docmntview.hidden=YES;
    _accessview.hidden=YES;
    _equipmentview.hidden=YES;
    _jobsiteview.hidden=YES;
    _safetyview.hidden=YES;
    _neweqmntview.hidden=YES;
    _workschdleview.hidden=YES;
    _meetingview.hidden=NO;
    _biddersview.hidden=YES;
    _weatherview.hidden=YES;
    _notesview.hidden=YES;
    


}

- (IBAction)otherbiddersbtn:(id)sender {
    _gernalbtnlbl.tintColor=[UIColor blackColor];
    _pratebtnlbl.tintColor=[UIColor blackColor];
    _documntbtnlbl.tintColor=[UIColor blackColor];
    _accesbltybtnlbl.tintColor=[UIColor blackColor];
    _EstggAreabtnlbl.tintColor=[UIColor blackColor];
    _jobsitebtnlbl.tintColor=[UIColor blackColor];
    _saftybtnlbl.tintColor=[UIColor blackColor];
    _equpmntslbl.tintColor=[UIColor blackColor];
    _workbtnlbl.tintColor=[UIColor blackColor];
    _meetingnotesbtnlbl.tintColor=[UIColor blackColor];
    _biddersbtnlbl.tintColor=[UIColor whiteColor];
    _weatherbtnlbl.tintColor=[UIColor blackColor];
    _notesbtnlbl.tintColor=[UIColor blackColor];

    _gernalview.hidden=YES;
    _rateview.hidden=YES;
    _docmntview.hidden=YES;
    _accessview.hidden=YES;
    _equipmentview.hidden=YES;
    _jobsiteview.hidden=YES;
    _safetyview.hidden=YES;
    _neweqmntview.hidden=YES;
    _workschdleview.hidden=YES;
    _meetingview.hidden=YES;
      _biddersview.hidden=NO;
    _weatherview.hidden=YES;
    _notesview.hidden=YES;

}

- (IBAction)weatheroutlookbtn:(id)sender {
    _gernalbtnlbl.tintColor=[UIColor blackColor];
    _pratebtnlbl.tintColor=[UIColor blackColor];
    _documntbtnlbl.tintColor=[UIColor blackColor];
    _accesbltybtnlbl.tintColor=[UIColor blackColor];
    _EstggAreabtnlbl.tintColor=[UIColor blackColor];
    _jobsitebtnlbl.tintColor=[UIColor blackColor];
    _saftybtnlbl.tintColor=[UIColor blackColor];
    _equpmntslbl.tintColor=[UIColor blackColor];
    _workbtnlbl.tintColor=[UIColor blackColor];
    _meetingnotesbtnlbl.tintColor=[UIColor blackColor];
    _biddersbtnlbl.tintColor=[UIColor blackColor];
    _weatherbtnlbl.tintColor=[UIColor whiteColor];
    _notesbtnlbl.tintColor=[UIColor blackColor];

    _gernalview.hidden=YES;
    _rateview.hidden=YES;
    _docmntview.hidden=YES;
    _accessview.hidden=YES;
    _equipmentview.hidden=YES;
    _jobsiteview.hidden=YES;
    _safetyview.hidden=YES;
    _neweqmntview.hidden=YES;
    _workschdleview.hidden=YES;
    _meetingview.hidden=YES;
    _biddersview.hidden=YES;

    _weatherview.hidden=NO;
    _notesview.hidden=YES;

}

- (IBAction)notesbtn:(id)sender {
    
    _gernalbtnlbl.tintColor=[UIColor blackColor];
    _pratebtnlbl.tintColor=[UIColor blackColor];
    _documntbtnlbl.tintColor=[UIColor blackColor];
    _accesbltybtnlbl.tintColor=[UIColor blackColor];
    _EstggAreabtnlbl.tintColor=[UIColor blackColor];
    _jobsitebtnlbl.tintColor=[UIColor blackColor];
    _saftybtnlbl.tintColor=[UIColor blackColor];
    _equpmntslbl.tintColor=[UIColor blackColor];
    _workbtnlbl.tintColor=[UIColor blackColor];
    _meetingnotesbtnlbl.tintColor=[UIColor blackColor];
    _biddersbtnlbl.tintColor=[UIColor blackColor];
    _weatherbtnlbl.tintColor=[UIColor blackColor];
    _notesbtnlbl.tintColor=[UIColor whiteColor];

    _gernalview.hidden=YES;
    _rateview.hidden=YES;
    _docmntview.hidden=YES;
    _accessview.hidden=YES;
    _equipmentview.hidden=YES;
    _jobsiteview.hidden=YES;
    _safetyview.hidden=YES;
    _neweqmntview.hidden=YES;
    _workschdleview.hidden=YES;
    _meetingview.hidden=YES;
    _weatherview.hidden=YES;
    _notesview.hidden=NO;
    _biddersview.hidden=YES;



}


#pragma mark-button Actions
- (IBAction)cmpxtyofwrkbtn:(id)sender {
    
    [self createpopover];
    [_popOverTableView reloadData];
    
}

- (IBAction)updatebtn:(id)sender {
    
 
    
}
- (IBAction)ratedeletebtn:(id)sender {
}

- (IBAction)Rateaddbtn:(id)sender {
    if (!_newrecordVCtrl) {
        self.newrecordVCtrl=[[NewrecordViewController alloc]initWithNibName:@"NewrecordViewController" bundle:nil];
    }
    self.newrecordVCtrl.modalPresentationStyle=UIModalPresentationFormSheet;
    [self presentViewController:_newrecordVCtrl
                       animated:YES completion:NULL];

}

- (IBAction)celleditbtn:(id)sender {
}
- (IBAction)takepicturebtn:(id)sender {
}

- (IBAction)upadtepicturebtn:(id)sender {
}

- (IBAction)docutypebtn:(id)sender {
}
- (IBAction)accebilityupdate:(id)sender {
}
- (IBAction)equpmntupdatebtn:(id)sender {
}
- (IBAction)addnewjobsite:(id)sender {
    
    if (!_newrecordVCtrl) {
        self.newrecordVCtrl=[[NewrecordViewController alloc]initWithNibName:@"Jobsiterecord" bundle:nil];
    }
    self.newrecordVCtrl.modalPresentationStyle=UIModalPresentationFormSheet;
    [self presentViewController:_newrecordVCtrl
                       animated:YES completion:NULL];

}
- (IBAction)addsafetyrules:(id)sender {
}
- (IBAction)addnewequipment:(id)sender {
}
- (IBAction)addworkscdle:(id)sender {
}
- (IBAction)addmeetgnots:(id)sender {
}
- (IBAction)addbidder:(id)sender {
}
- (IBAction)addweather:(id)sender {
}
- (IBAction)addnotesbtn:(id)sender {
}
-(IBAction)closesitevisit:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

@end
