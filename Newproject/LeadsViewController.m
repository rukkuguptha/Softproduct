//
//  LeadsViewController.m
//  Newproject
//
//  Created by GMSIndia1 on 6/14/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import "LeadsViewController.h"

@interface LeadsViewController ()

@end

@implementation LeadsViewController

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
    _scroll.frame=CGRectMake(0, 0, 768,1004);
    [_scroll setContentSize:CGSizeMake(768,1500)];
    _leadTable.layer.borderWidth = 2.0;
    _leadTable.layer.borderColor = [UIColor colorWithRed:210.0/255.0f green:230.0/255.0f blue:450.0/255.0f alpha:1.0f].CGColor;
    _leadTable.separatorColor= [UIColor colorWithRed:210.0/255.0f green:230.0/255.0f blue:450.0/255.0f alpha:1.0f];
    
   // self.navigationController.navigationBar.tintColor=[UIColor colorWithRed:210.0/255.0f green:230.0/255.0f blue:450.0/255.0f alpha:1.0f];
    self.navbar.tintColor=[UIColor colorWithRed:210.0/255.0f green:230.0/255.0f blue:450.0/255.0f alpha:1.0f];
    
    
    self.view3.backgroundColor=[UIColor colorWithRed:210.0/255.0f green:230.0/255.0f blue:450.0/255.0f alpha:1.0f];
    _popoverArray=[[NSMutableArray alloc]initWithObjects:@"Activity",@"Follow Up" ,nil];
    // Do any additional setup after loading the view from its nib.
    
    _btnArray=[[NSMutableArray alloc]initWithObjects:@"Create LeadInfo",@"Edit Leads",@"Delete Leads" ,nil];
    
    
    _leadtypeArray=[[NSMutableArray alloc]initWithObjects:@"Referral",@"Database",@"Repeat Customer",@"Phone Request", nil];
    _projecttypeArray=[[NSMutableArray alloc]initWithObjects:@"TurnAround",@"Maintenance",@"Capital Work",@"New Construction",@"Unknown", nil];
    _industrytypeArray=[[NSMutableArray alloc]initWithObjects:@"Chemical",@"Refining",@"Pulp",@"Paper",@"Power" ,nil];
    _prjctexcutnArray=[[NSMutableArray alloc]initWithObjects:@"Immediate",@"First Quarter", @"Second Quarter",@"Third Quarter",@"Fourth Quarter of that calender year", nil];
    [self getLeads];
    
    
     
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

    
    
    UIBarButtonItem*Addbtn=[[UIBarButtonItem alloc]initWithTitle:@"ADD" style:UIBarButtonItemStylePlain target:self action:@selector(butnaction)];
   
    _Editbtn=[[UIBarButtonItem alloc]initWithTitle:@"EDIT" style:UIBarButtonItemStylePlain target:self action:@selector(editaction)];
      NSArray*barbutns=[[NSArray alloc]initWithObjects:Addbtn,_Editbtn, nil];
    [self.navigationItem setRightBarButtonItems:barbutns animated:YES];


    
}

-(void)butnaction{
    
      _view2.hidden=NO;
}
-(void)editaction{
    
    if ([self.leadTable isEditing]) {
        // If the tableView is already in edit mode, turn it off. Also change the title of the button to reflect the intended verb (‘Edit’, in this case).
        
        [self.leadTable setEditing:NO animated:YES];
        //[_Editbtn setTitle:@"Edit"forState:UIControlStateNormal];
    }
    else {
       // [_Editbtn setTitle:@"Done"forState:UIControlStateNormal];
        
        // Turn on edit mode
        
        [self.leadTable setEditing:YES animated:YES];
    }
}


    
    
   



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Table View
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    // Return the number of rows in the section.
    if (tableView==_popOverTableView) {
        
        switch (poptype) {
            case 1:
                return [_leadtypeArray count];
                break;
            case 2:
                return [_projecttypeArray count];
                break;
            case 3:
                return [_industrytypeArray count];
                break;
            case 4:
                return [_prjctexcutnArray count];
                break;
            case 5:
              return [_popoverArray count];
                break;

            default:
                break;
        }
        
    }
    if (tableView==_leadTable) {
         return [_leadinfoArray count];
    }
    return YES;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        if (tableView==_leadTable) {
         [[NSBundle mainBundle]loadNibNamed:@"CustomLeadCell" owner:self options:nil];
        
        cell=_leadsTablecell;
        }
        
    }
if (tableView==_leadTable) {
        
    Infoleads*info=(Infoleads*)[_leadinfoArray objectAtIndex:indexPath.row];
        _leadName=(UILabel*)[cell viewWithTag:1];
        _leadName.text=info.companyname;
    _Location=(UILabel*)[cell viewWithTag:2];
    _Location.text=info.location;
    _Contract=(UILabel*)[cell viewWithTag:3];
       _Contract.text=info.contactName;
    _EmailId= (UILabel*)[cell viewWithTag:4];
    _EmailId.text=info.emailid;
    _IndustryType=(UILabel*)[cell viewWithTag:5];
    _IndustryType.text=info.Industrytype;
    _ProjectType=(UILabel*)[cell viewWithTag:6];
    _ProjectType.text=info.projecttype;
    _ProjectExecution=(UILabel*)[cell viewWithTag:7];
    _ProjectExecution.text=info.projectexecution;
    }
    
    if (tableView==_popOverTableView) {
        
        switch (poptype) {
            case 1:
                cell.textLabel.text=[_leadtypeArray objectAtIndex:indexPath.row];
             
                break;
            case 2:
                cell.textLabel.text=[_projecttypeArray objectAtIndex:indexPath.row];

                
                break;
            case 3:
                cell.textLabel.text=[_industrytypeArray objectAtIndex:indexPath.row];

                               break;
            case 4:
                cell.textLabel.text=[_prjctexcutnArray objectAtIndex:indexPath.row];

              
                break;
            case 5:
                cell.textLabel.text=[_popoverArray objectAtIndex:indexPath.row];

                              break;
                
            default:
                break;
        }

        
        
    }
    return cell;
    
    
}

#pragma mark - Table View delegate

//-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
//    //alternating cell back ground color
//    if (indexPath.row%2 == 0) {
//        [cell setBackgroundColor:[UIColor whiteColor]];
//        
//          }else
//    {
//        
//        //[cell setBackgroundColor:[UIColor colorWithRed:247.0/255.0f green:247.0/255.0f blue:247.0/255.0f alpha:1.0f]];
//        [cell setBackgroundColor:[UIColor colorWithRed:210.0/255.0f green:230.0/255.0f blue:450.0/255.0f alpha:1.0f]];
//
//        
//    }
//}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
      if (tableView==_leadTable) {
          
          
//          UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//          if ([cell isEditing] == YES) {
//              self.view2.hidden=YES;
//          }
//          else {
//              // Do Something else.
//          }
          
    // CGRect frame = [_popOverTableView cellForRowAtIndexPath:indexPath].frame;
          poptype=5;
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
          
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 120, 70)];
    
    popoverView.backgroundColor = [UIColor whiteColor];
    _popOverTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 120, 70)];
    
    _popOverTableView.delegate=(id)self;
    _popOverTableView.dataSource=(id)self;
    _popOverTableView.rowHeight= 32;
    _popOverTableView.separatorStyle=UITableViewCellSeparatorStyleSingleLineEtched;
   

   // CGRect rect = frame;
    [popoverView addSubview:_popOverTableView];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(120, 70);
    
    //create a popover controller
          
          self.popOverController = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    
  
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    CGRect rect=CGRectMake(cell.bounds.origin.x+90, cell.bounds.origin.y+10, 50, 30);
    [self.popOverController presentPopoverFromRect:rect inView:cell permittedArrowDirections:nil animated:YES];
  
      }
    
     if (tableView==_popOverTableView) {
         if (indexPath.row==0) {
             if (!self.activityVCtrl) {
                 self.activityVCtrl=[[ActivityViewController alloc]initWithNibName:@"ActivityViewController" bundle:nil];
             }
             [self.navigationController pushViewController:self.activityVCtrl animated:YES];
             
         }
         
         if (indexPath.row==1) {
             
             if (!self.followupVCtrl) {
                 self.followupVCtrl=[[FollowupViewController alloc]initWithNibName:@"FollowupViewController" bundle:nil];
             }
             [self.navigationController pushViewController:self.followupVCtrl animated:YES];
             
         

         }
         
         [self.popOverController dismissPopoverAnimated:YES];

         
         
     }
    
    
   
    
    
}




#pragma mark - Buttons

- (IBAction)Addbtn:(id)sender {
 
    
}
- (IBAction)clsebtn:(id)sender {
    _view2.hidden=YES;
}
- (IBAction)leadtypebtn:(id)sender {
    poptype=1;
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 200, 250)];
    
    popoverView.backgroundColor = [UIColor lightTextColor];
    _popOverTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 200, 250)];
    _popOverTableView.delegate=(id)self;
    _popOverTableView.dataSource=(id)self;
    _popOverTableView.rowHeight= 32;
    _popOverTableView.separatorColor=[UIColor cyanColor];
    self.popOverTableView.allowsMultipleSelection=YES;
    [popoverView addSubview:_popOverTableView];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(200, 250);
    
    //create a popover controller
    self.popOverController = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    [self.popOverController presentPopoverFromRect:_leadtypebtnlbl.frame
                                            inView:self.view2
                          permittedArrowDirections:UIPopoverArrowDirectionUp
                                          animated:YES];
    

}

- (IBAction)prjcttypebtn:(id)sender {
     poptype=2;
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 200, 250)];
    
    popoverView.backgroundColor = [UIColor lightTextColor];
    _popOverTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 200, 250)];
    _popOverTableView.delegate=(id)self;
    _popOverTableView.dataSource=(id)self;
    _popOverTableView.rowHeight= 32;
    _popOverTableView.separatorColor=[UIColor cyanColor];
    self.popOverTableView.allowsMultipleSelection=YES;
    [popoverView addSubview:_popOverTableView];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(200, 250);
    
    //create a popover controller
    self.popOverController = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    [self.popOverController presentPopoverFromRect:_projecttype.frame
                                            inView:self.view2
                          permittedArrowDirections:UIPopoverArrowDirectionUp
                                          animated:YES];
    

}

- (IBAction)industrytypetxtfld:(id)sender {
     poptype=3;
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 200, 250)];
    
    popoverView.backgroundColor = [UIColor lightTextColor];
    _popOverTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 200, 250)];
    _popOverTableView.delegate=(id)self;
    _popOverTableView.dataSource=(id)self;
    _popOverTableView.rowHeight= 32;
    _popOverTableView.separatorColor=[UIColor cyanColor];
    self.popOverTableView.allowsMultipleSelection=YES;
    [popoverView addSubview:_popOverTableView];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(200, 250);
    
    //create a popover controller
    self.popOverController = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    [self.popOverController presentPopoverFromRect:_industrytypetxtfld.frame
                                            inView:self.view2
                          permittedArrowDirections:UIPopoverArrowDirectionUp
                                          animated:YES];
    

}

- (IBAction)prjctexcnbtn:(id)sender {
     poptype=4;
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 200, 250)];
    
    popoverView.backgroundColor = [UIColor lightTextColor];
    _popOverTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 200, 250)];
    _popOverTableView.delegate=(id)self;
    _popOverTableView.dataSource=(id)self;
    _popOverTableView.rowHeight= 32;
    _popOverTableView.separatorColor=[UIColor cyanColor];
    self.popOverTableView.allowsMultipleSelection=YES;
    [popoverView addSubview:_popOverTableView];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(200, 250);
    
    //create a popover controller
    self.popOverController = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    [self.popOverController presentPopoverFromRect:_prjctexcutntxtfld.frame
                                            inView:self.view2
                          permittedArrowDirections:UIPopoverArrowDirectionUp
                                          animated:YES];
    

}




- (IBAction)updatebtn:(id)sender {
}

- (IBAction)cancelbtn:(id)sender {
}

#pragma mark - Webservice
/*webservices*/

-(void)getLeads{
    
    recordResults = FALSE;
    NSString *soapMessage;
      
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                                 
                   "<soap:Body>\n"
                   
                   "<GetLeads xmlns=\"http://webserv.kontract360.com/\">\n"
                  
                   "</GetLeads>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://webserv.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://webserv.kontract360.com/GetLeads" forHTTPHeaderField:@"Soapaction"];
    
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
    [_leadTable reloadData];
      
}


#pragma mark - XMLParser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    
    if([elementName isEqualToString:@"GetLeadsResult"])
    {
        _leadinfoArray=[[NSMutableArray alloc]init];
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
    

    if([elementName isEqualToString:@"Location"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"ContactName"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    
    if([elementName isEqualToString:@"ContactTitle"])
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
    if([elementName isEqualToString:@"EmailId"])
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
    if([elementName isEqualToString:@"TypeOfLead"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"IndustryType"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    

    if([elementName isEqualToString:@"ProjectType"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"ProjectDescription"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ProjectExecution"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"ProjectExecutionYear"])
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
    if([elementName isEqualToString:@"GetLeadsResult"])
    {
        
        recordResults = FALSE;
              _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"LeadId"])
    {
        _infoleads=[[Infoleads alloc]init];
        recordResults = FALSE;
        _infoleads.leadid=[_soapResults integerValue];
        _soapResults = nil;
    }
    
    
    if([elementName isEqualToString:@"CompanyName"])
    {
        
        recordResults = FALSE;
        _infoleads.companyname=_soapResults;
        
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"Location"])
    {
        
        recordResults = FALSE;
        _infoleads.location=_soapResults;
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"ContactName"])
    {
        
        recordResults = FALSE;
         _infoleads.contactName=_soapResults;
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"ContactTitle"])
    {
        
        recordResults = FALSE;
         _infoleads.contacttitle=_soapResults;
        _soapResults = nil;
    }
    
    
    if([elementName isEqualToString:@"Phone"])
    {
        
        recordResults = FALSE;
         _infoleads.phone=_soapResults;
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"EmailId"])
    {
        
        recordResults = FALSE;
         _infoleads.emailid=_soapResults;
        _soapResults = nil;
    }
    

    if([elementName isEqualToString:@"City"])
    {
        
        recordResults = FALSE;
         _infoleads.city=_soapResults;
        _soapResults = nil;
    }
    
    
    
    if([elementName isEqualToString:@"State"])
    {
        
        recordResults = FALSE;
         _infoleads.state=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"TypeOfLead"])
    {
        
        recordResults = FALSE;
         _infoleads.Typeoflead=_soapResults;
        _soapResults = nil;
    }


    if([elementName isEqualToString:@"IndustryType"])
    {
        
        recordResults = FALSE;
         _infoleads.Industrytype=_soapResults;
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"ProjectType"])
    {
        
        recordResults = FALSE;
         _infoleads.projecttype=_soapResults;
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"ProjectDescription"])
    {
        
        recordResults = FALSE;
         _infoleads.projectdescription=_soapResults;
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"ProjectExecution"])
    {
        
        recordResults = FALSE;
         _infoleads.projectexecution=_soapResults;
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"ProjectExecutionYear"])
    {
        
        recordResults = FALSE;
         _infoleads.projectexecutionyear=_soapResults;
        [_leadinfoArray addObject:_infoleads];
        _soapResults = nil;
    }
    



    
}


@end
