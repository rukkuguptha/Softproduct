//
//  LbrMgmtViewController.m
//  Newproject
//
//  Created by GMSIndia 2 on 30/06/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "LbrMgmtViewController.h"

@interface LbrMgmtViewController ()

@end

@implementation LbrMgmtViewController

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
    
    _mgmttable.layer.borderWidth=3.0f;
    _mgmttable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _checkbtn.enabled=NO;
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
    _checkbtn.enabled=NO;
    check=0;
    _formanbtn.enabled=NO;
    }

- (IBAction)Selectjobsite:(id)sender
{
    [_formanbtn setTitle:@"Select" forState:UIControlStateNormal ];

    btnindex=1;
    [self createpopover];
    [self JobsSelect];
    _formanbtn.enabled=YES;
}

- (IBAction)Selectforman:(id)sender
{
    btnindex=2;
    [self createpopover];
    [self ForemanSelect];
}
-(IBAction)checkaction:(id)sender
{
    _checkstring=@"clickd";
   
    button = (UIButton *)sender;
    CGPoint center= button.center;
    
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.mgmttable];
    NSIndexPath *textFieldIndexPath = [self.mgmttable indexPathForRowAtPoint:rootViewPoint];
    NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
    btnindex=textFieldIndexPath.row;
   
    btnclick++;
    
 LbmgModel*lmdl=(LbmgModel *)[_lbrmgmtarray objectAtIndex:textFieldIndexPath.row];
      if (![fname isEqualToString:lmdl.ForemanName]) {
        
        
    
        
        [_checkbtn setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        
        
        check=1;
        
        
    }
    else
    {
        [_checkbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        check=0;
        
    }

       [self ForemanUpdate];
   
    
    
}
-(IBAction)Editaction:(id)sender
{
    
    button = (UIButton *)sender;
    CGPoint center= button.center;
    
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.mgmttable];
    NSIndexPath *textFieldIndexPath = [self.mgmttable indexPathForRowAtPoint:rootViewPoint];
    NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
    btnindex=textFieldIndexPath.row;
    _checkbtn.enabled=YES;
    
}
- (IBAction)closethepage:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


-(void)createpopover{
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 200, 120)];
    
    popoverView.backgroundColor = [UIColor whiteColor];
    _popovertable=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 200, 120)];
    
    _popovertable.delegate=(id)self;
    _popovertable.dataSource=(id)self;
    _popovertable.rowHeight= 32;
    _popovertable.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    
    
    // CGRect rect = frame;
    [popoverView addSubview:_popovertable];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(200, 120);
    
    //create a popover controller
    self.popover = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    
    //
    //    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    //    CGRect rect=CGRectMake(cell.bounds.origin.x+90, cell.bounds.origin.y+10, 50, 30);
    //    [self.popOverController presentPopoverFromRect:_disclsurelbl.bounds inView:self.view permittedArrowDirections:nil animated:YES];
    
    
    
    
    switch (btnindex) {
        case 1:
            [self.popover presentPopoverFromRect:_jobbtn.frame
                                                    inView:self.view
                                  permittedArrowDirections:UIPopoverArrowDirectionUp
                                                  animated:YES];
            
            break;
        case 2:
            [self.popover presentPopoverFromRect:_formanbtn.frame
                                                    inView:self.view
                                  permittedArrowDirections:UIPopoverArrowDirectionUp
                                                  animated:YES];
            
            break;
            
                default:
            break;
    }
    
    
    
    
    
}
#pragma mark-Tableview
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if (tableView==_popovertable) {
        switch (btnindex) {
            case 1:
                return [_jobarray count];
                break;
            case 2:
                return [_formanarray count];
                break;
            
                default:
                break;
        }
        
    }
    else
    {
        
        return [_lbrmgmtarray count];
    }
    return YES;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellidentifier=@"mycell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellidentifier];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellidentifier];
        
        if(tableView==_mgmttable)
        {
            [[NSBundle mainBundle]loadNibNamed:@"Lbmgcell" owner:self options:nil];
            cell=_mgmtcell;
        }
    }
    cell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12];
    if (tableView==_popovertable) {
        switch (btnindex) {
            case 1:
                
                cell.textLabel.text=[_jobarray objectAtIndex:indexPath.row];
                break;
            case 2:
                
                cell.textLabel.text=[_formanarray objectAtIndex:indexPath.row];
                break;
                
                
            default:
                break;
        }
        
        
    }
    
    if(tableView==_mgmttable)
    {
        LbmgModel*lmdl=(LbmgModel *)[_lbrmgmtarray objectAtIndex:indexPath.row];
        _emplabel=(UILabel*)[cell viewWithTag:1];
        cell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12];
        _emplabel.text=lmdl.EmployeeName;
        _formanlabel=(UILabel*)[cell viewWithTag:2];
        
        _formanlabel.text=lmdl.ForemanName;
        NSLog(@"%@",lmdl.ForemanName);
         NSLog(@"%@",fname);
        
        if ([fname isEqualToString:lmdl.ForemanName]) {
            [_checkbtn setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
            check=1;

        }
        else
        {
            [_checkbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
            check=0;
        }
//        if (indexPath.row==btnindex) {
//                    if(check==0)
//                    {
//                         [_checkbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
//                        check=1;
//                   }
//                else if(check==1)
//                    {
//                         [_checkbtn setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
//                        check=0;
//                    }
//            
//            
//        }

     
        
    }
    
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    if (tableView==_popovertable) {
        switch (btnindex) {
            case 1:
                
                
                [_jobbtn setTitle:[_jobarray objectAtIndex:indexPath.row] forState:UIControlStateNormal ];
                break;
            case 2:
                
                [_formanbtn setTitle:[_formanarray objectAtIndex:indexPath.row] forState:UIControlStateNormal ];
                f=[_formandict objectForKey:[_formanarray objectAtIndex:indexPath.row]];
                fname=[_formanarray objectAtIndex:indexPath.row];
               [self ForemanEmployeenameSelect];
                
                break;
                

                
            default:
                break;
        }
        
        //   [_optionbtnlbl setTitle:[_Optionarray objectAtIndex:indexPath.row] forState:UIControlStateNormal ];
    }
    [self.popover dismissPopoverAnimated:YES];
    
    
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //alternating cell back ground color
    if(tableView==_mgmttable)
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
-(void)JobsSelect{
    recordResults=FALSE;
    NSString *soapMessage;
    
    
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<JobsSelect xmlns=\"http://test.kontract360.com/\">\n"
                   
                   
                   "</JobsSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
     NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/JobsSelect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)ForemanSelect
{
    recordResults=FALSE;
    NSString *soapMessage;
    
    NSArray*array=[_jobbtn.titleLabel.text componentsSeparatedByString:@"-"];
    NSString*jobno=[NSString stringWithFormat:@"%@-%@",[array objectAtIndex:0],[array objectAtIndex:1]];
//    NSInteger job=[jobno integerValue];
//    jobno=[NSString stringWithFormat:@"%d",job];
    NSString *job=[NSString stringWithFormat:@"%@",[_jobiddict objectForKey:jobno]];
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<ForemanSelect xmlns=\"http://test.kontract360.com/\">\n"
                    "<job_id>%@</job_id>\n"
                   
                   "</ForemanSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",job];
    NSLog(@"soapmsg%@",soapMessage);
    
    
     NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/ForemanSelect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)ForemanEmployeenameSelect
{
    recordResults=FALSE;
    NSString *soapMessage;
    NSArray*array=[_jobbtn.titleLabel.text componentsSeparatedByString:@"-"];
    NSString*jobno=[NSString stringWithFormat:@"%@-%@",[array objectAtIndex:0],[array objectAtIndex:1]];
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<ForemanEmployeenameSelect xmlns=\"http://test.kontract360.com/\">\n"
                   "<foremanid>%d</foremanid>\n"
                   "<foremanname>%@</foremanname>\n"
                   "<jobsite>%@</jobsite>\n"
                   "</ForemanEmployeenameSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[f integerValue],fname,jobno];
    NSLog(@"soapmsg%@",soapMessage);
    
    
     NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/ForemanEmployeenameSelect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)ForemanUpdate
{
    webtype=1;
    recordResults=FALSE;
    NSString *soapMessage;
     LbmgModel*lmdl=(LbmgModel *)[_lbrmgmtarray objectAtIndex:btnindex];
    NSInteger lid=[lmdl.lmentryid integerValue];
    NSInteger tick;
    
        if (check==0) {
            tick=0;
        }
        else{
           tick=[f integerValue];
        }
        _checkstring=@"";
    
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<ForemanUpdate xmlns=\"http://test.kontract360.com/\">\n"
                   "<LMEntryId>%d</LMEntryId>\n"
                   "<LMForemanId>%d</LMForemanId>\n"
                   
                   "</ForemanUpdate>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",lid,tick];
    NSLog(@"soapmsg%@",soapMessage);
    
    
     NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/ForemanUpdate" forHTTPHeaderField:@"Soapaction"];
    
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
    UIAlertView *  Alert=[[UIAlertView alloc]initWithTitle:nil message:@"ERROR with the Connection" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    
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
    [_mgmttable reloadData];
    [_popovertable reloadData];
    if (webtype==1) {
        
        [self ForemanEmployeenameSelect];
        webtype=0;
    }
    
    
}
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
            if([elementName isEqualToString:@"JobsSelectResponse"])
    {
        _jobarray=[[NSMutableArray alloc]init];
        _jobiddict=[[NSMutableDictionary alloc]init];
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

    if([elementName isEqualToString:@"JobNumber"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"JobDescDetail"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ForemanSelectResponse"])
    {
        _formanarray=[[NSMutableArray alloc]init];
        _formandict=[[NSMutableDictionary alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"name"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"cemp_id"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ForemanEmployeenameSelectResponse"])
    {
        _lbrmgmtarray=[[NSMutableArray alloc]init];
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"lmentryid"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"LMEmployeeId"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"LMForemanId"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"EmployeeName"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"ForemanName"])
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
    
    if([elementName isEqualToString:@"id"])
    {
        recordResults = FALSE;
        _jobid=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"JobNumber"])
    {
        recordResults = FALSE;
        _jobnumber=_soapResults;
        [_jobiddict setObject:_jobid forKey:_soapResults];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"JobDescDetail"])
    {
        recordResults = FALSE;
        [_jobarray addObject:[NSString stringWithFormat:@"%@-%@",_jobnumber,_soapResults]];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"name"])
    {
        recordResults = FALSE;
        [_formanarray addObject:_soapResults];
        _forman=_soapResults;
        _soapResults = nil;
    }

    if([elementName isEqualToString:@"cemp_id"])
    {
        recordResults = FALSE;
        [_formandict setObject:_soapResults forKey:[_forman stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"lmentryid"])
    {
        recordResults = FALSE;
        _lbmdl=[[LbmgModel alloc]init];
        _lbmdl.lmentryid=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"LMEmployeeId"])
    {
        recordResults = FALSE;
        _lbmdl.LMEmployeeId=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"LMForemanId"])
    {
        recordResults = FALSE;
        _lbmdl.LMForemanId=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"EmployeeName"])
    {
        recordResults = FALSE;
        _lbmdl.EmployeeName=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"ForemanName"])
    {
        recordResults = FALSE;
        _lbmdl.ForemanName=[_soapResults stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        [_lbrmgmtarray addObject:_lbmdl];
        _soapResults = nil;
    }



    
}




@end
