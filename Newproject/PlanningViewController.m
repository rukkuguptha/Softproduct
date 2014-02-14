//
//  PlanningViewController.m
//  Newproject
//
//  Created by GMSIndia1 on 2/12/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "PlanningViewController.h"

@interface PlanningViewController ()

@end

@implementation PlanningViewController

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
     _titleview.backgroundColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _tabletitleview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _plangtable.layer.borderWidth=2.0f;
    _plangtable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _disclosurearry=[[NSMutableArray alloc]initWithObjects:@"Add Services",@"Site Visit",@"Plan",nil];
    _searchbar=[[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, 220, 44)];
    _searchbar.delegate=(id)self;
    _searchbar.tintColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    self.plangtable.tableHeaderView=_searchbar;
    UISearchDisplayController *searchctrlr=[[UISearchDisplayController alloc]initWithSearchBar:_searchbar contentsController:self];
    searchctrlr.searchResultsDelegate=(id)self;
    searchctrlr.searchResultsDataSource=(id)self;
    searchctrlr.delegate=(id)self;

}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self SelectAllPlans];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}

#pragma mark-Tableview
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(tableView==_plangtable)
    {
        return [_planlistarray count];
    }
    if(tableView==_popovertableview)
    {
        switch (poptype) {
                case 1:
                return [_customerlistarray count];
                break;
                case 2:
                return [_leadlistarray count];
                break;
                case 3:
               return[_disclosurearry count];
                break;
                
            default:
                break;
        }
    }
    return YES;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellidentifier=@"mycell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellidentifier];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellidentifier];
    
    if(tableView==_plangtable)
    {
        [[NSBundle mainBundle]loadNibNamed:@"customplancell" owner:self options:nil];
        cell=_planingcell;
    }
    }
    if(tableView==_popovertableview)
    {
        
        
        cell.textLabel.font = [UIFont fontWithName:@"Helvetica Neue Light" size:12];
        cell.textLabel.font = [UIFont systemFontOfSize:12.0];

    

        switch (poptype) {
            case 1:
                cell.textLabel.text=[_customerlistarray objectAtIndex:indexPath.row];
                break;
            case 2:
                cell.textLabel.text=[_leadlistarray objectAtIndex:indexPath.row];
                break;
            case 3:
                cell.textLabel.text=[_disclosurearry objectAtIndex:indexPath.row];
                break;
            default:
                break;
        }
    }
     if(tableView==_plangtable)
     {  planmodel*planmdl=(planmodel *)[_planlistarray objectAtIndex:indexPath.row];
         _organizationname=(UILabel*)[cell viewWithTag:1];
         cell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12];
         _organizationname.text=planmdl.customername;
         _leadlabel=(UILabel*)[cell viewWithTag:2];
         NSString *led=[NSString stringWithFormat:@"%d",planmdl.leadid];
         _leadlabel.text=led;
             }
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView==_popovertableview) {
        
        //Coursemdl*coursemdl2=(Coursemdl *)[_requirementArray objectAtIndex:textFieldIndexPath.row];
        
        switch (poptype) {
                
            case 1:
                

                [_customerselectionBtn setTitle:[_customerlistarray objectAtIndex:indexPath.row]forState:UIControlStateNormal];
                
                
                break;
            case 2:
                [_leadselectionBtn setTitle:[_leadlistarray objectAtIndex:indexPath.row]forState:UIControlStateNormal];
                
                break;
            case 3:
                 if (indexPath.row==0) {
                if (!self.servVctrl) {
                    self.servVctrl=[[AddserviceViewController alloc]initWithNibName:@"AddserviceViewController" bundle:nil];
                }
                     
                _servVctrl.modalPresentationStyle=UIModalPresentationPageSheet;
                _servVctrl.modalTransitionStyle=UIModalTransitionStyleCoverVertical;
                [self presentViewController:_servVctrl
                                   animated:YES completion:NULL];
                 }
                if (indexPath.row==1) {
                    if (!self.sitevisitVctrl) {
                        self.sitevisitVctrl=[[SitevisitViewController alloc]initWithNibName:@"SitevisitViewController" bundle:nil];
                    }
                    _sitevisitVctrl.modalPresentationStyle=UIModalPresentationPageSheet;
                    _sitevisitVctrl.modalTransitionStyle=UIModalTransitionStyleCoverVertical;
                    [self presentViewController:_sitevisitVctrl
                                       animated:YES completion:NULL];
                }
                if (indexPath.row==2) {
                    if (!self.DetailplanVctrl) {
                        self.DetailplanVctrl=[[DetailplanViewController alloc]initWithNibName:@"DetailplanViewController" bundle:nil];
                    }
                    _DetailplanVctrl.modalPresentationStyle=UIModalPresentationPageSheet;
                    _DetailplanVctrl.modalTransitionStyle=UIModalTransitionStyleCoverVertical;
                    [self presentViewController:_DetailplanVctrl
                                       animated:YES completion:NULL];
                }
                

                


                
                break;
            default:
                break;
        }
        [self.popovercontroller dismissPopoverAnimated:YES];

        
        
    }
    

    
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //alternating cell back ground color
    if(tableView==_plangtable)
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




#pragma mark-Button Actions
- (IBAction)clseVCtrlbtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)addplan:(id)sender {
    [self SelectAllCustomer];
    _addplanview.hidden=NO;
}
-(IBAction)closeaddview:(id)sender
{
    _addplanview.hidden=YES;
    
}
-(IBAction)checkleadaction:(id)sender
{
    if(leadcheck==0)
    {
        [_leadcheckbtn setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        leadcheck=1;
        _selectionlabel.text=@"Select Lead";
        _customerselectionBtn.enabled=NO;
        
    }
    else
    {
        [_leadcheckbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        leadcheck=0;
        _customerselectionBtn.enabled=YES;
    }
    
}
-(IBAction)checkcustomeraction:(id)sender
{
    if(customercheck==0)
    {
        [_custcheckbtn setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        customercheck=1;
        _selectionlabel.text=@"Select Customer";
        _leadselectionBtn.enabled=NO;
    }
    else
    {
        [_custcheckbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        customercheck=0;
        _leadselectionBtn.enabled=YES;
    }
    
}
-(IBAction)selectcustomer:(id)sender
{
    poptype=1;
    UIViewController *popovercontent=[[UIViewController alloc]init];
    UIView *popoverview=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 210, 100)];
    popoverview.backgroundColor=[UIColor whiteColor];
    _popovertableview=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 210, 100)];
    _popovertableview.delegate=(id)self;
    _popovertableview.dataSource=(id)self;
    _popovertableview.rowHeight=32;
    _popovertableview.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    [popoverview addSubview:_popovertableview];
    popovercontent.view=popoverview;
    popovercontent.contentSizeForViewInPopover=CGSizeMake(210, 90);
    self.popovercontroller=[[UIPopoverController alloc]initWithContentViewController:popovercontent];
    [self.popovercontroller presentPopoverFromRect:_customerselectionBtn.frame inView:_addplanview permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
    
    
    
}
-(IBAction)selectlead:(id)sender
{
    [self SelectAllLeads];
    poptype=2;
    UIViewController *popovercontent=[[UIViewController alloc]init];
    UIView *popoverview=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 160, 90)];
    popoverview.backgroundColor=[UIColor whiteColor];
    _popovertableview=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 160, 90)];
    _popovertableview.delegate=(id)self;
    _popovertableview.dataSource=(id)self;
    _popovertableview.rowHeight=32;
    _popovertableview.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    [popoverview addSubview:_popovertableview];
    popovercontent.view=popoverview;
    popovercontent.contentSizeForViewInPopover=CGSizeMake(160, 90);
    self.popovercontroller=[[UIPopoverController alloc]initWithContentViewController:popovercontent];
    [self.popovercontroller presentPopoverFromRect:_leadselectionBtn.frame inView:_addplanview permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
    
    
    
}
-(IBAction)selectdisclosure:(id)sender
{
    poptype=3;
    UIViewController* popoverContent = [[UIViewController alloc]init];
    UIView* popoverView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 120, 90)];
    popoverView.backgroundColor = [UIColor whiteColor];
    _popovertableview=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 120, 90)];
    _popovertableview.delegate=(id)self;
    _popovertableview.dataSource=(id)self;
    _popovertableview.rowHeight= 30;
    _popovertableview.separatorColor=[UIColor cyanColor];
    [popoverView addSubview:_popovertableview];
    popoverContent.view = popoverView;
    popoverContent.contentSizeForViewInPopover = CGSizeMake(120, 90);
    button = (UIButton *)sender;
    UITableViewCell *cell = (UITableViewCell *)[[button superview] superview];
    //UITableView *table = (UITableView *)[cell superview];
    self.popovercontroller = [[UIPopoverController alloc]initWithContentViewController:popoverContent];
    [self.popovercontroller presentPopoverFromRect:_disclosurebtn.frame inView:cell permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
    //[_popovertableview reloadData];
}

-(IBAction)updateplanning:(id)sender
{
    
}
-(IBAction)cancelplanning:(id)sender
{
    
}
#pragma mark - SearchBar

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    //[self SearchApplicants];
    
}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    //[self ListAllApplicants];
    
}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    if ([_searchbar.text length]==0) {
        
        [searchBar resignFirstResponder];
        
        
    }
    else  if ([_searchbar.text length]>0) {
        
        
        
        
        _searchstring=_searchbar.text;
        
        
    }
    
}
/*webservices*/
-(void)SelectAllPlans
{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SelectAllPlans xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</SelectAllPlans>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://ios.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/SelectAllPlans" forHTTPHeaderField:@"Soapaction"];
    
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

-(void)SelectAllCustomer{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SelectAllCustomer xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</SelectAllCustomer>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://ios.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/SelectAllCustomer" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)SelectAllLeads{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SelectAllLeads xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</SelectAllLeads>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://ios.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/SelectAllLeads" forHTTPHeaderField:@"Soapaction"];
    
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
    UIAlertView *  Alert=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"ERROR with the Connection" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    
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
    [_popovertableview reloadData];
    [_plangtable reloadData];
    
}
#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"SelectAllLeadsResult"])
    {
        _leadlistarray=[[NSMutableArray alloc]init];
        _leaddict=[[NSMutableDictionary alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"LeadId"])
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
    if([elementName isEqualToString:@"SelectAllCustomerResult"])
    {
        _customerlistarray=[[NSMutableArray alloc]init];
        _customerdict=[[NSMutableDictionary alloc]init];
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
    if([elementName isEqualToString:@"CustomerName"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"SelectAllPlansResult"])
    {
        _planlistarray=[[NSMutableArray alloc]init];
       
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"planid"])
    {
       
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"customername"])
    {
       
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"leadid"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"customerid"])
    {
        
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"id"])
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
    if([elementName isEqualToString:@"SelectAllLeadsResult"])
    {
        
        recordResults = FALSE;
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"LeadId"])
    {
        
        recordResults = FALSE;
        _leadstring=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"CompanyName"])
    {
        
        recordResults = FALSE;
        [_leaddict setObject:_leadstring forKey:_soapResults];
        [_leadlistarray addObject:_soapResults];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"SelectAllLeadsResult"])
    {
        
        recordResults = FALSE;
        
        _soapResults = nil;
    } if([elementName isEqualToString:@"Id"])
    {
        
        recordResults = FALSE;
        _customerstring=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"CustomerName"])
    {
        
        recordResults = FALSE;
        [_customerdict setObject:_customerstring forKey:_soapResults];
        [_customerlistarray addObject:_soapResults];

        _soapResults = nil;
    }
    if([elementName isEqualToString:@"SelectAllPlansResult"])
    {
        
        recordResults = FALSE;
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"planid"])
    {
        
        recordResults = FALSE;
        _plnmdl=[[planmodel alloc]init];
        _plnmdl.planid=[_soapResults integerValue];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"customername"])
    {
        
        recordResults = FALSE;
        _plnmdl.customername=_soapResults;
        _soapResults = nil;
    }

    if([elementName isEqualToString:@"leadid"])
    {
        
        recordResults = FALSE;
        _plnmdl.leadid=[_soapResults integerValue];
        _soapResults = nil;
    }

    if([elementName isEqualToString:@"customerid"])
    {
        
        recordResults = FALSE;
        _plnmdl.customerid=[_soapResults integerValue];
        _soapResults = nil;
    }

    if([elementName isEqualToString:@"id"])
    {
        
        recordResults = FALSE;
        _plnmdl.idvalue=[_soapResults integerValue];
        [_planlistarray addObject:_plnmdl];
        _soapResults = nil;
    }

   




}


@end
