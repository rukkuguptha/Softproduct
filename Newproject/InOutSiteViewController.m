//
//  InOutSiteViewController.m
//  Newproject
//
//  Created by GMSIndia 2 on 12/06/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "InOutSiteViewController.h"

@interface InOutSiteViewController ()

@end

@implementation InOutSiteViewController

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
    [[self.notetextview layer] setBorderColor:[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor];
    [[self.notetextview layer] setBorderWidth:2];
    [[self.notetextview layer] setCornerRadius:10];
    
    [[self.outnotetextview layer] setBorderColor:[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor];
    [[self.outnotetextview layer] setBorderWidth:2];
    [[self.outnotetextview layer] setCornerRadius:10];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)closethepage:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}
-(IBAction)confirmcheckaction:(id)sender
{
    if(confirmcheck==0)
    {
        
        [_cnfrmbtn setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        
        
        confirmcheck=1;
        
        
    }
    else
    {
        [_cnfrmbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        confirmcheck=0;
        
    }

}
-(IBAction)tojobsiteaction:(id)sender
{
    UIViewController *popovercontent=[[UIViewController alloc]init];
    UIView *popoverview=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 210, 120)];
    popoverview.backgroundColor=[UIColor whiteColor];
    _popovertableview=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 210, 120)];
    _popovertableview.delegate=(id)self;
    _popovertableview.dataSource=(id)self;
    _popovertableview.rowHeight=32;
    _popovertableview.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    [popoverview addSubview:_popovertableview];
    popovercontent.view=popoverview;
    popovercontent.contentSizeForViewInPopover=CGSizeMake(210, 120);
    self.popovercontroller=[[UIPopoverController alloc]initWithContentViewController:popovercontent];
    [self.popovercontroller presentPopoverFromRect:_tojobbtn.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
    
    
 
}
-(IBAction)outconfirmcheckaction:(id)sender
{
    if(outconfirmcheck==0)
    {
        
        [_outcnfrmbtn setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        
        
        outconfirmcheck=1;
        
        
    }
    else
    {
        [_outcnfrmbtn setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        outconfirmcheck=0;
        
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
    
    // Return the number of rows in the section.
    if(tableView==_popovertableview)
        
    {
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
    }
    
    if(tableView==_popovertableview)
    {  cell.textLabel.font = [UIFont fontWithName:@"Helvetica Neue Light" size:12];
        cell.textLabel.font = [UIFont systemFontOfSize:12.0];
      
                //cell.textLabel.text=[_statearray objectAtIndex:indexPath.row];
        
                
        
        }
    
    
    
    
    
    
    
    
    
    return cell;
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (tableView==_popovertableview) {
        
        
       
        
        
        
    }
    [self.popovercontroller dismissPopoverAnimated:YES];
    
}
//-(void)insertplans
//{
//    
//    recordResults = FALSE;
//    NSString *soapMessage;
//    
//   
//    
//    
//    soapMessage = [NSString stringWithFormat:
//                   
//                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
//                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
//                   
//                   
//                   "<soap:Body>\n"
//                   
//                   "<InsertPlan xmlns=\"http://ios.kontract360.com/\">\n"
//                   "<customername>%@</customername>\n"
//                   "<leadid>%d</leadid>\n"
//                   "<cusid>%d</cusid>\n"
//                   "<id>%d</id>\n"
//                   "<Fold_ID>%d</Fold_ID>\n"
//                   "<WorkType>%d</WorkType>\n"
//                   "<SiteFactor>%f</SiteFactor>\n"
//                   "<Location>%@</Location>\n"
//                   "<Zip>%@</Zip>\n"
//                   "<Complexity>%@</Complexity>\n"
//                   "<lead>%d</lead>\n"
//                   "<customer>%d</customer>\n"
//                   "</InsertPlan>\n"
//                   "</soap:Body>\n"
//                   "</soap:Envelope>\n",_planselectionbtn.titleLabel.text,[ledid integerValue],[custid integerValue],0,0,[[_typelistdict objectForKey:_typebtnlbl.titleLabel.text]integerValue],[_sitefactortxtfld.text floatValue],_loctntxtfld.text,_ziptxtfld.text,_cmplexitybtnlbl.titleLabel.text,lead,customer];
//    NSLog(@"soapmsg%@",soapMessage);
//    
//    
//    //NSURL *url = [NSURL URLWithString:@"http://192.168.0.100/service.asmx"];
//    NSURL *url = [NSURL URLWithString:@"http://192.168.0.100/service.asmx"];
//    
//    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
//    
//    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
//    
//    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
//    
//    [theRequest addValue: @"http://ios.kontract360.com/InsertPlan" forHTTPHeaderField:@"Soapaction"];
//    
//    [theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];
//    [theRequest setHTTPMethod:@"POST"];
//    [theRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
//    
//    
//    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
//    
//    if( theConnection )
//    {
//        _webData = [NSMutableData data];
//    }
//    else
//    {
//        ////NSLog(@"theConnection is NULL");
//    }
//    
//}



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
    
}
#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"SelectAllLeadsResult"])
    {


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
}


@end
