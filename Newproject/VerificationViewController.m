    //
//  VerificationViewController.m
//  Newproject
//
//  Created by GMSIndia1 on 9/24/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import "VerificationViewController.h"

@interface VerificationViewController ()

@end

@implementation VerificationViewController

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
    self.navigationController.navigationBar.tintColor=[UIColor blackColor];
    //_view1.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    //_tabbar.tintColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
       [_tabbar setSelectedItem:[_tabbar.items objectAtIndex:0]];
    _requirementtable.layer.borderWidth = 2.0;
    _requirementtable.layer.borderColor = [UIColor colorWithRed:0/255.0f green:191/255.0f blue:255.0/255.0f alpha:1.0f].CGColor;
    
    /*scroll*/
    
    _scroll.frame=CGRectMake(0, 0, 1004,768);
    [_scroll setContentSize:CGSizeMake(1004,1000)];
       _monthArray=[[NSMutableArray alloc]initWithObjects:@"JAN",@"FEB",@"MAR",@"APR",@"MAY",@"JUN",@"JUL",@"AUG",@"SEP",@"OCT",@"NOV",@"DEC",nil];
    _monthdictArray=[[NSMutableArray alloc]initWithObjects:@"01",@"02",@"03",@"04",@"05",@"06",@"07",@"08",@"09",@"10",@"11",@"12", nil];
    _monthDictionary=[[NSMutableDictionary alloc]initWithObjects:_monthdictArray forKeys:_monthArray];
    _remonthDictionary=[[NSMutableDictionary alloc]initWithObjects:_monthArray forKeys:_monthdictArray];
    _yearArray=[[NSMutableArray alloc]initWithObjects:@"2013",@"2014",@"2015",@"2016",@"2017",@"2018",@"2019",@"2020",@"2021",@"2022",@"2023", nil];

   _remonthDictionary=[[NSMutableDictionary alloc]initWithObjects:_monthArray forKeys:_monthdictArray];

    }



-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [_tabbar setSelectedItem:[_tabbar.items objectAtIndex:0]];
    __requirmentview.hidden=NO;

    [self FetchApplicant];
    NSLog(@"Applicnt %d",_applicantid);

    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    
    if (item.tag==1) {
     __requirmentview.hidden=NO;
        _I9view.hidden=YES;
       
        
    }
    if (item.tag==2) {
        [self FetchImage];
//        [self selectdocs];
        _I9view.hidden=NO;
        
        __requirmentview.hidden=YES;
        
    }
   
    
    //NSLog(@"view");
}

- (IBAction)requrmntactn:(id)sender {
}

- (IBAction)i9action:(id)sender {
}

- (IBAction)bgaction:(id)sender {
}

- (IBAction)ssnaction:(id)sender {
}
- (IBAction)savebtn:(id)sender {
}

- (IBAction)cancelbtn:(id)sender {
}

- (IBAction)uploadbtn:(id)sender {
    poptype=3;
    [self selectdocs];
    [self createpop];
   
}
-(void)createpop
{
     poptype=3;
        
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 120, 100)];
    
    popoverView.backgroundColor = [UIColor whiteColor];
    _popOverTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 120, 100)];
    
    _popOverTableView.delegate=(id)self;
    _popOverTableView.dataSource=(id)self;
    _popOverTableView.rowHeight= 32;
    _popOverTableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    
    
    [popoverView addSubview:_popOverTableView];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(120, 100);
    
    //create a popover controller
    
    self.popOverController = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    
    
//    UIButton *button = (UIButton *)sender;
//    
//    UITableViewCell *cell = (UITableViewCell *)[[button superview] superview];
//    UITableView *table = (UITableView *)[cell superview];
//    NSIndexPath *IndexPath = [table indexPathForCell:cell];
    
    
    
    
    [self.popOverController presentPopoverFromRect:_uploadbtnlbl.frame
                                            inView:_I9view
                          permittedArrowDirections:UIPopoverArrowDirectionLeft
                                          animated:YES];
    

}

#pragma mark - Table View
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView==_requirementtable) {
        return [_requirementArray count];

        
    }
    
    
    if (tableView==_popOverTableView) {
        switch (poptype) {
            case 1:
                return [_monthArray count];
                break;
            case 2:
                return [_yearArray count];
                break;
            case 3:
                return [_docsarray count];
                break;
            default:
                break;
        }
    }
        // Return the number of rows in the section.
    }
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
      
            
            
                 
        cell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12.0f];
        
        if (tableView==_requirementtable){
        [[NSBundle mainBundle]loadNibNamed:@"requirmentcell" owner:self options:nil];
        cell=_verifctncell;
        }
    }
    
    if (tableView==_requirementtable){
           NSLog(@"indexPath row: %d",indexPath.row);
    Coursemdl*coursemdl1=(Coursemdl *)[_requirementArray objectAtIndex:indexPath.row];
    _reqiuremntnamelbl=(UILabel *)[cell viewWithTag:1];
   _reqiuremntnamelbl.text=coursemdl1.itemname;
    //NSLog(@"lbl%@",)
    button=(UIButton*)[cell viewWithTag:2];
    [button setTitle:coursemdl1.month forState:UIControlStateNormal];
    yearbutton=(UIButton *)[cell viewWithTag:3];
    
    [yearbutton setTitle:coursemdl1.year forState:UIControlStateNormal];
  
    }
    
    if (tableView==_popOverTableView) {
        cell.textLabel.font = [UIFont fontWithName:@"Helvetica Neue Light" size:12];
        cell.textLabel.font = [UIFont systemFontOfSize:12.0];
        
        switch (poptype) {
            case 1:
                cell.textLabel.text=[_monthArray objectAtIndex:indexPath.row];
                break;
            case 2:
                cell.textLabel.text=[_yearArray objectAtIndex:indexPath.row];
                break;
            case 3:
                cell.textLabel.text=[_docsarray objectAtIndex:indexPath.row];
                break;
        }
    }

            return cell;
}

#pragma mark - Table View delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (tableView==_popOverTableView) {
        
        //Coursemdl*coursemdl2=(Coursemdl *)[_requirementArray objectAtIndex:textFieldIndexPath.row];
        
        switch (poptype) {
                
            case 1:
                
                //path=indexPath.row;
                [button setTitle:[_monthArray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
                
               // coursemdl2.month=button.titleLabel.text;
                
               // NSLog(@"_monthbtn.tag%@",coursemdl2.month);
                
                
                
                break;
            case 2:
                
                [yearbutton setTitle:[_yearArray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
                
                //coursemdl3.year=yearbutton.titleLabel.text;
                
                
                break;
                case 3:
                _doc=[_docspathDict objectForKey:[_docsarray objectAtIndex:indexPath.row]];
                NSLog(@"%@",_doc);
                if (!self.webctrl) {
                    _webctrl=[[WebViewController alloc]initWithNibName:@"WebViewController" bundle:nil];
                }
                _webctrl.docpdf=_doc;
                [self.navigationController pushViewController:_webctrl animated:YES];
                [self.popOverController dismissPopoverAnimated:YES];


                break;
                default:
                break;
        }
        
        
    }

    
       
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //alternating cell back ground color
           if (indexPath.row%2 == 0) {
            [cell setBackgroundColor:[UIColor whiteColor]];
            
        }else
        {
            
            //[cell setBackgroundColor:[UIColor colorWithRed:247.0/255.0f green:247.0/255.0f blue:247.0/255.0f alpha:1.0f]];
            [cell setBackgroundColor:[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f]];
            
            
        }
    }


- (IBAction)Rsavebtn:(id)sender {
}

- (IBAction)Rcancelbtn:(id)sender {
}
- (void)viewDidUnload {
    [self setReqiuremntnamelbl:nil];
    [self setMonthbtnlbl:nil];
    [self setYearbtnlbl:nil];
    [self setVerifctncell:nil];
    [super viewDidUnload];
}

#pragma mark - arvinice
/*arvinices*/



-(void)FetchApplicant{
    testint=1;
    recordResults = FALSE;
    NSString *soapMessage;
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<FetchApplicant xmlns=\"http://arvin.kontract360.com/\">\n"
                   
                   "</FetchApplicant>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://arvin.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://arvin.kontract360.com/FetchApplicant" forHTTPHeaderField:@"Soapaction"];
    
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

-(void)selectrequirements{
    recordResults = FALSE;
    NSString *soapMessage;
    NSLog(@"Array%@",_Fetchdetailsarray);
   
    Verfymdl*verfy=(Verfymdl *)[_Fetchdetailsarray objectAtIndex:0];
    NSLog(@"%d",verfy.Selectedapplicantid);
    NSLog(@"%@",verfy.jobsiteid);
    NSLog(@"%@",verfy.craftid);

    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<InsertApplicantRequirements xmlns=\"http://arvin.kontract360.com/\">\n"
                   "<JobId>%d</JobId>\n"
                   "<CraftId>%d</CraftId>\n"
                   "<AppId>%d</AppId>\n"
                   "</InsertApplicantRequirements>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[verfy.jobsiteid integerValue],[verfy.craftid integerValue] ,verfy.Selectedapplicantid ];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://arvin.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://arvin.kontract360.com/InsertApplicantRequirements" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)FetchImage{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
              
        //  NSString *imagename=[NSString stringWithFormat:@"Photo_%@.png",_ssntxtfld.text];
        
        
        // NSString *cmpnyname=@"arvin";
        
        soapMessage = [NSString stringWithFormat:
                       
                       @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                       "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                       
                       
                       "<soap:Body>\n"
                       
                       "<FetchImage xmlns=\"http://arvin.kontract360.com/\">\n"
                       
                       "<appid>%d</appid>\n"
                       "</FetchImage>\n"
                       "</soap:Body>\n"
                       "</soap:Envelope>\n",_applicantid];
        NSLog(@"soapmsg%@",soapMessage);
        
        
        // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
        NSURL *url = [NSURL URLWithString:@"http://arvin.kontract360.com/service.asmx"];
        
        NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
        
        NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
        
        [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
        
        [theRequest addValue: @"http://arvin.kontract360.com/FetchImage" forHTTPHeaderField:@"Soapaction"];
        
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
-(void)selectdocs
{
    poptype=3;
    recordResults = FALSE;
    NSString *soapMessage;
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   "<soap:Body>\n"
                   "<SelectDocs xmlns=\"http://arvin.kontract360.com/\">\n"
                   "<AppId>%d</AppId>\n"
                   "</SelectDocs>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_applicantid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://arvin.kontract360.com/service.asmx"];
    
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://arvin.kontract360.com/SelectDocs" forHTTPHeaderField:@"Soapaction"];
    
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
    [_popOverTableView reloadData];
    if (testint==1) {
        
        //[self FetchImage];
        [self selectrequirements];
        testint=3;
    }
    
    
    [_requirementtable reloadData];
    }


#pragma mark - XMLParser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"FetchApplicantResult"])
    {
        _Fetchdetailsarray=[[NSMutableArray alloc]init];
                if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"applicant_Id"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"applicant_FirstName"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"applicant_LastName"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"applicant_SSN"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    
    if([elementName isEqualToString:@"applicant_CellPhone"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"applicant_Address"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"applicant_City"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"applicant_State"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"applicant_Zip"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
       if([elementName isEqualToString:@"NameSuffix"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    
    if([elementName isEqualToString:@"jobSite_Id"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"applicant_OtherCrafts"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    
    if([elementName isEqualToString:@"InsertApplicantRequirementsResult"])
    {
        _requirementArray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Requirement_Id"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    
    if([elementName isEqualToString:@"ItemName"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"Code"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"Type"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"ApplyToAllCraft"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"HaveExpiryDate"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"expir_date"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"course_status"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    

    
    if([elementName isEqualToString:@"FetchImageResult"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    
    
    if([elementName isEqualToString:@"url"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ApplicantID"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"SelectDocsResult"])
    {
        _docsarray=[[NSMutableArray alloc]init];
        _docspathDict=[[NSMutableDictionary alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Column1"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"FolderName"])
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
    if([elementName isEqualToString:@"applicant_Id"])
    {
        recordResults = FALSE;
        if (_applicantid==[_soapResults integerValue]) {
                          _verfymdl=[[Verfymdl alloc]init];
            _verfymdl.Selectedapplicantid=[_soapResults integerValue];
            
_verfymdl.applicantid=[_soapResults integerValue];
            
        }
        else{
        _verfymdl.applicantid=[_soapResults integerValue];
        }
                        _soapResults = nil;
    }
       if([elementName isEqualToString:@"applicant_FirstName"])
    {
        recordResults = FALSE;
        if (_applicantid==  _verfymdl.applicantid) {
        _verfymdl.firstname=_soapResults;
        _firstnametxtfld.text=_verfymdl.firstname;
        }
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"applicant_LastName"])
    {
        recordResults = FALSE;
        if (_applicantid==  _verfymdl.applicantid) {
        _verfymdl.lastname=_soapResults;
        _lastnametxtfld.text= _verfymdl.lastname;
        }
                _soapResults = nil;
    }
    if([elementName isEqualToString:@"applicant_SSN"])
    {
        recordResults = FALSE;
        if (_applicantid==  _verfymdl.applicantid) {
        _verfymdl.ssn=_soapResults;
        _ssntxtfld.text=  _verfymdl.ssn;
        }
      
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"applicant_CellPhone"])
    { recordResults = FALSE;
        if (_applicantid==  _verfymdl.applicantid) {
        _verfymdl.Phonenumber=_soapResults;
        }
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"applicant_Address"])
    {
        recordResults = FALSE;
        if (_applicantid==  _verfymdl.applicantid) {
        _verfymdl.address=_soapResults;
        _Addresstxtfld.text=  _verfymdl.address;
        }
        _soapResults = nil;
        
        
    }
    if([elementName isEqualToString:@"applicant_City"])
    {
        recordResults = FALSE;
        if (_applicantid==  _verfymdl.applicantid) {
        _verfymdl.city=_soapResults;
        _citytxtfld.text=_verfymdl.city;
        }
        _soapResults = nil;
        
        
    }
    if([elementName isEqualToString:@"applicant_State"])
    {
        recordResults = FALSE;
        if (_applicantid==  _verfymdl.applicantid) {
        _verfymdl.state=_soapResults;
        _statetxtfld.text= _verfymdl.state;
        }
        _soapResults = nil;
        

        
    }
    if([elementName isEqualToString:@"applicant_Zip"])
    {
        recordResults = FALSE;
        if (_applicantid==  _verfymdl.applicantid) {
        _verfymdl.zip=_soapResults;
        _ziptextfld.text=_verfymdl.zip;
        }
        _soapResults = nil;
        

        
    }
        if([elementName isEqualToString:@"NameSuffix"])
    {
        recordResults = FALSE;
        if (_applicantid==  _verfymdl.applicantid) {
        _verfymdl.suffix=_soapResults;
        _suffixtxtfld.text=_verfymdl.suffix;
        
        }
        _soapResults = nil;
        
        
    }
    if([elementName isEqualToString:@"jobSite_Id"])
    {
        recordResults = FALSE;
        if (_applicantid==  _verfymdl.applicantid) {
        _verfymdl.jobsiteid=_soapResults;
        }
        _soapResults = nil;
             
    }
    if([elementName isEqualToString:@"applicant_OtherCrafts"])
    {
       recordResults = FALSE;
           NSLog(@"Appid%d",_verfymdl.applicantid);
        NSLog(@"Appid%d",_applicantid);

        
        if (_applicantid==  _verfymdl.applicantid) {
        _verfymdl.craftid=_soapResults;
       
              [_Fetchdetailsarray addObject:_verfymdl];
              NSLog(@"%d",_verfymdl.applicantid);
              NSLog(@"%d",_verfymdl.Selectedapplicantid);
              NSLog(@"%@",_verfymdl.jobsiteid);
             NSLog(@"%@",_verfymdl.craftid);
            
            NSLog(@"%@",_Fetchdetailsarray);
            
        }
          
        _soapResults = nil;

    }
    

    if([elementName isEqualToString:@"Requirement_Id"])
    {
        _coursemdl=[[Coursemdl alloc]init];
        recordResults = FALSE;
        _coursemdl.reqid=[_soapResults integerValue];
        
        _soapResults=nil;
    }
    
    
    if([elementName isEqualToString:@"ItemName"])
    {
        recordResults = FALSE;
        _coursemdl.itemname=_soapResults;
        _soapResults=nil;
    }
    
    if([elementName isEqualToString:@"Code"])
    {
        recordResults = FALSE;
        _coursemdl.Code=_soapResults;
        
        _soapResults=nil;
    }
    
    if([elementName isEqualToString:@"Type"])
    {
        recordResults = FALSE;
        _coursemdl.Type=_soapResults;
        
        _soapResults=nil;    }
    
    if([elementName isEqualToString:@"ApplyToAllCraft"])
    {
        recordResults = FALSE;
        
        _coursemdl.ApplyToAllCraft=_soapResults;
        _soapResults=nil;    }
    
    if([elementName isEqualToString:@"HaveExpiryDate"])
    {
        recordResults = FALSE;
        _coursemdl.HaveExpiryDate=_soapResults;
        
        
        _soapResults=nil;
    }
    if([elementName isEqualToString:@"expir_date"])
    {
        recordResults = FALSE;
        NSArray *dateArray=[[NSArray alloc]init];
        dateArray=[_soapResults componentsSeparatedByString:@"T"];
        NSString *date1 =[dateArray objectAtIndex:0];
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"yyyy-MM-dd"];
        NSDate *dates = [dateFormat dateFromString:date1];
        [dateFormat setDateFormat:@"MM-dd-yyy"];
        NSString *myFormattedDate = [dateFormat stringFromDate:dates];
        // _drugmdl.drugdate=
        
        
        _coursemdl.expdate=myFormattedDate;
        NSArray*newarray=[myFormattedDate componentsSeparatedByString:@"-"];
        //        _coursemdl.month=[newarray objectAtIndex:0];
        //        _coursemdl.year=[newarray objectAtIndex:2];
        _coursemdl.month=[_remonthDictionary objectForKey:[newarray objectAtIndex:0]];
        _coursemdl.year=[newarray objectAtIndex:2];
        
        _soapResults=nil;
    }
    if([elementName isEqualToString:@"course_status"])
    {
        recordResults = FALSE;
        
        if ([_soapResults isEqualToString:@"true"]) {
            _coursemdl.course_status=1;
            
        }
        
        else if ([_soapResults isEqualToString:@"false"]){
            _coursemdl.course_status=0;
            
        }
        
        [_requirementArray addObject:_coursemdl];
        NSLog(@"mdl%@",_requirementArray);
        _soapResults=nil;
    }
    if([elementName isEqualToString:@"ApplicantID"])
    {
        recordResults = FALSE;
        
      //  [_imageArraydict setObject:_newid forKey:_soapResults];
        
        
        _soapResults = nil;
    }
    
    
    if([elementName isEqualToString:@"url"])
    {
        
        recordResults = FALSE;
      //  _newid=_soapResults;
        
        
          NSData *data1=[_soapResults base64DecodedData];
        
      
        UIImage *image1=[[UIImage alloc]initWithData:data1];
                _profileimg.image=image1;

        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Column1"])
    {
        recordResults=FALSE;
        NSLog(@"key%@",_soapResults);
        docsstring=_soapResults;

       
        _soapResults=nil;
    }

    if([elementName isEqualToString:@"FolderName"])
    {
        recordResults=FALSE;
        [_docsarray addObject:_soapResults];
         [_docspathDict setObject:docsstring forKey:_soapResults];
        NSLog(@"soap%@",_soapResults);
        _soapResults=nil;
    }

    
   


}






- (IBAction)monthbtn:(id)sender {
    poptype=1;
    
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 60, 250)];
    //200,250
    popoverView.backgroundColor = [UIColor lightTextColor];
    _popOverTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 60, 250)];
    _popOverTableView.delegate=(id)self;
    _popOverTableView.dataSource=(id)self;
    _popOverTableView.rowHeight= 32;
    _popOverTableView.separatorColor=[UIColor cyanColor];
    
    [popoverView addSubview:_popOverTableView];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(60, 250);
    
    //create a popover controller
    self.popOverController = [[UIPopoverController alloc]
                               initWithContentViewController:popoverContent];
    
    
    button = (UIButton *)sender;
    
    UITableViewCell *cell = (UITableViewCell *)[[button superview] superview];
    
    
    
    [self.popOverController presentPopoverFromRect:_monthbtnlbl.frame
                                             inView:cell
                           permittedArrowDirections:UIPopoverArrowDirectionUp
                                           animated:YES];

    
}

- (IBAction)yearbtn:(id)sender {
    poptype=2;
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 60, 250)];
    //200,250
    popoverView.backgroundColor = [UIColor lightTextColor];
    _popOverTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 60, 250)];
    _popOverTableView.delegate=(id)self;
    _popOverTableView.dataSource=(id)self;
    _popOverTableView.rowHeight= 32;
    _popOverTableView.separatorColor=[UIColor cyanColor];
    
    [popoverView addSubview:_popOverTableView];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(60, 250);
    
    //create a popover controller
    self.popOverController = [[UIPopoverController alloc]
                               initWithContentViewController:popoverContent];
    
    
    yearbutton = (UIButton *)sender;
    
    UITableViewCell *cell = (UITableViewCell *)[[yearbutton superview] superview];
    
    
    
    
    
    [self.popOverController presentPopoverFromRect:_yearbtnlbl.frame
                                             inView:cell
                           permittedArrowDirections:UIPopoverArrowDirectionUp
                                           animated:YES];

}


@end
