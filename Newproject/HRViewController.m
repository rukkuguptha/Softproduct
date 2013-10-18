//
//  HRViewController.m
//  Newproject
//
//  Created by GMSIndia1 on 9/24/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import "HRViewController.h"
#import "Base64.h"

@interface HRViewController ()

@end

@implementation HRViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title=NSLocalizedString(@"Registered Applicants", @"Registered Applicants");
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
       _imageArraydict=[[NSMutableDictionary alloc]init];
    _employeestable.rowHeight=130;
    
    /*tablewidth*/
    
    _employeestable.layer.borderWidth = 2.0;
    _employeestable.layer.borderColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    
    
    /*searchbar*/
    _SearchingBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 220, 44)];
    _SearchingBar.delegate = (id)self;
    _SearchingBar.tintColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    
    self.employeestable.tableHeaderView =_SearchingBar;
    
    UISearchDisplayController* searchController = [[UISearchDisplayController alloc] initWithSearchBar:_SearchingBar contentsController:self];
    searchController.searchResultsDataSource = (id)self;
    searchController.searchResultsDelegate =(id)self;
    searchController.delegate = (id)self;
    
    
    
   /*scroll*/
    
    //_scroll.frame=CGRectMake(0, 0, 1004,768);
   // [_scroll setContentSize:CGSizeMake(1500,768)];
    
    
    
    
    /*Arrays*/
    _listarray=[[NSMutableArray alloc]initWithObjects:@"verification details",@"Upload Documents",@"Convert as an Employee", nil];
    

}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self FetchApplicant];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - ButtonActions

- (IBAction)disclurebtn:(id)sender {
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 160, 90)];
    
    popoverView.backgroundColor = [UIColor whiteColor];
    _popOverTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 160, 90)];
    
    _popOverTableView.delegate=(id)self;
    _popOverTableView.dataSource=(id)self;
    _popOverTableView.rowHeight= 32;
    _popOverTableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    
    
    [popoverView addSubview:_popOverTableView];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(160, 90);
    
    //create a popover controller
    
    self.popOverController = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    
       
    UIButton *button = (UIButton *)sender;
    
    UITableViewCell *cell = (UITableViewCell *)[[button superview] superview];
    UITableView *table = (UITableView *)[cell superview];
    NSIndexPath *IndexPath = [table indexPathForCell:cell];
    
   
    Empdetails*empdetls1=(Empdetails *)[_empnameArray objectAtIndex:IndexPath.row];
    _applicantid=empdetls1.applicantid;
    _ssnstring=empdetls1.ssn;
    

    
    [self.popOverController presentPopoverFromRect:__disclyrebtnlbl.frame
                                            inView:cell
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
    if (tableView==_popOverTableView) {
        return [_listarray count];
    }
    else{
        return [_empnameArray count];
    }
    // Return the number of rows in the section.
    return YES;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
   
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        if (tableView==_employeestable) {
            
        
        [[NSBundle mainBundle]loadNibNamed:@"HRcellview" owner:self options:nil];
        cell=_employeecell;
        }
    }
    if (tableView==_employeestable) {
        
        
        Empdetails*empdetls1=(Empdetails *)[_empnameArray objectAtIndex:indexPath.row];
        _empolyeename=(UILabel *)[cell viewWithTag:1];
        
               _empolyeename.text=[NSString stringWithFormat:@"%@ %@",empdetls1.firstname,empdetls1.lastname];
        _ssnlbl=(UILabel *)[cell viewWithTag:2];
        _ssnlbl.text=empdetls1.ssn;
        _phonelbl=(UILabel *)[cell viewWithTag:3];
        if (empdetls1.emp==1) {
            
            _empolyeename.textColor=[UIColor greenColor];
            _ssnlbl.textColor=[UIColor greenColor];
            _phonelbl.textColor=[UIColor greenColor];
            
        }

        _phonelbl.text=empdetls1.Phonenumber;
        
//        NSLog(@"%d",empdetls1.applicantid);
//        NSData *data1=[[_imageArraydict objectForKey:[NSString stringWithFormat:@"%d",empdetls1.applicantid]]base64DecodedData];
//        
//        //NSData *data1=[_imageArray objectAtIndex:indexPath.row];
//        UIImage *image1=[[UIImage alloc]initWithData:data1];
//        _empImgview=(UIImageView *)[cell viewWithTag:5];
//        _empImgview.image=image1;

//        if([imgString isEqualToString:@"img"])
//        {
//            
//                Empdetails*empdetls1=(Empdetails *)[_empnameArray objectAtIndex:indexPath.row];
//            
//                        
//           
//            
//            
//           
//            NSData *data1=[[_imageArraydict objectForKey:[NSString stringWithFormat:@"%d",empdetls1.applicantid]]base64DecodedData];
//            //NSData *data1=[_imageArray objectAtIndex:indexPath.row];
//            UIImage *image1=[[UIImage alloc]initWithData:data1];
//            _empImgview=(UIImageView *)[cell viewWithTag:5];
//            _empImgview.image=image1;
//    }
    
    }

    if (tableView==_popOverTableView) {
        
        cell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12.0f];

        cell.textLabel.text=[_listarray objectAtIndex:indexPath.row];
    }
    return cell;
}

#pragma mark - Table View delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    if (tableView==_popOverTableView) {
        
       
        if (indexPath.row==0) {
            if (!self.verifctnVCtrl) {
                _verifctnVCtrl=[[VerificationViewController alloc]initWithNibName:@"VerificationViewController" bundle:nil];
            }
            [self.popOverController dismissPopoverAnimated:YES];
            _verifctnVCtrl.applicantid=_applicantid;
            NSLog(@" _verifctnVCtrl.applicantid%d", _verifctnVCtrl.applicantid);
                        [self.navigationController pushViewController:_verifctnVCtrl animated:YES];
            
        }
        if (indexPath.row==1) {
            if (!self.uploadVCtrl) {
                _uploadVCtrl=[[UploadDocViewController alloc]initWithNibName:@"UploadDocViewController" bundle:nil];
            }
            [self.popOverController dismissPopoverAnimated:YES];
              _uploadVCtrl.applicantid=_applicantid;
            _uploadVCtrl.ssnstring=_ssnstring;
            [self.navigationController pushViewController:_uploadVCtrl animated:YES];
            
        }

        
        if (indexPath.row==2) {
            /*Webservice*/
            [self UpdateApplicantEmployeeStatus];
            
            [_employeestable reloadData];
            
        }
    }
    
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //alternating cell back ground color
    if(tableView==_employeestable)
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


#pragma mark - SearchBar

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    
}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    
}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    if ([_SearchingBar.text length]==0) {
        
             [searchBar resignFirstResponder];
        
        
    }
    else  if ([_SearchingBar.text length]>0) {
        
        
        
        
        _searchstring=_SearchingBar.text;
        
        
        }
    
    }


#pragma mark - Webservice
/*webservices*/
-(void)UpdateApplicantEmployeeStatus{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UpdateApplicantEmployeeStatus xmlns=\"http://webserv.kontract360.com/\">\n"
                   "<AppId>%d</AppId>\n"
                   "</UpdateApplicantEmployeeStatus>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_applicantid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://arvin.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://arvin.kontract360.com/UpdateApplicantEmployeeStatus" forHTTPHeaderField:@"Soapaction"];
    
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

-(void)FetchApplicant{
    imgString=@"Fetchapp";
    recordResults = FALSE;
    NSString *soapMessage;
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<FetchApplicant xmlns=\"http://webserv.kontract360.com/\">\n"
                   
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
   
    if([imgString isEqualToString:@"Fetchapp"])
    {
    [_employeestable reloadData];
           imgString=@"";
    
    }
//    if([imgString isEqualToString:@"img"])
//    {
//        if (x==[_empnameArray count]) {
//             [_employeestable reloadData];
//        }
//       
//
//       // imgString=@"";
//        
//    }

    

}
#pragma mark - XMLParser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"FetchApplicantResult"])
    {
        _empnameArray=[[NSMutableArray alloc]init];
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
    
       
    if([elementName isEqualToString:@"EmployeeStatus"])
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
        _empdetl=[[Empdetails alloc]init];
        recordResults = FALSE;
               _empdetl.applicantid=[_soapResults integerValue];
       
        //[self FetchImage];
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"applicant_FirstName"])
    {
        recordResults = FALSE;
        _teststrng=_soapResults;
        _empdetl.firstname=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"applicant_LastName"])
    {
        recordResults = FALSE;
      //  [_empnameArray addObject:[NSString stringWithFormat:@"%@ %@",_teststrng,_soapResults]];
        _empdetl.lastname=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"applicant_SSN"])
    {
         recordResults = FALSE;
        _empdetl.ssn=_soapResults;
        _soapResults = nil;

    }
    if([elementName isEqualToString:@"applicant_CellPhone"])
    { recordResults = FALSE;
        _empdetl.Phonenumber=_soapResults;
        [_empnameArray addObject:_empdetl];
         _soapResults = nil;
    }
    if([elementName isEqualToString:@"EmployeeStatus"])
    {
         recordResults = FALSE;
        _empdetl.empstatus=_soapResults;
        if ([_empdetl.empstatus isEqualToString:@"true"]) {
            _empdetl.emp=1;
            
        }
        else{
            _empdetl.emp=0;
        }
        _soapResults = nil;
        
    }



}
@end
