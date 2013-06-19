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
  //  UIBarButtonItem*actionbtn=[[UIBarButtonItem alloc]initWithImage:nil style:UIBarButtonItemStylePlain target:self action:@selector(butnaction)];
    
    
    UIBarButtonItem*actionbtn=[[UIBarButtonItem alloc]initWithTitle:@"Add" style:UIBarButtonItemStylePlain target:self action:@selector(butnaction)];
    [self.navigationItem setRightBarButtonItem:actionbtn animated:YES];

    
}

-(void)butnaction{
    
      _view2.hidden=NO;
//    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"EDIT"
//                                                             delegate:self
//                                                    cancelButtonTitle:nil
//                                               destructiveButtonTitle:nil
//                                                    otherButtonTitles:nil];
//    for (NSString *btn in self.btnArray) {
//        [actionSheet addButtonWithTitle:btn];
//    }
//    actionSheet.cancelButtonIndex = [actionSheet addButtonWithTitle:@"Cancel"];
//    [actionSheet showFromRect:CGRectMake(1004,0, 10, 10) inView:self.view animated:YES];
//    [actionSheet showInView:self.scroll];
//    actionSheet.layer.backgroundColor=[UIColor colorWithRed:210.0/255.0f green:230.0/255.0f blue:450.0/255.0f alpha:1.0f].CGColor;
   // actionSheet.actionSheetStyle=UIActionSheetStyleDefault;
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
         return 20;
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
     //cell.textLabel.text=@"Leads";
    if (tableView==_leadTable) {
    _leadName=(UILabel*)[cell viewWithTag:1];
    

    _leadName.text=@"Valero";
    _imgview=(UIImageView *)[cell viewWithTag:2];
       
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
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //alternating cell back ground color
    if (indexPath.row%2 == 0) {
        [cell setBackgroundColor:[UIColor whiteColor]];
        
          }else
    {
        
        //[cell setBackgroundColor:[UIColor colorWithRed:247.0/255.0f green:247.0/255.0f blue:247.0/255.0f alpha:1.0f]];
        [cell setBackgroundColor:[UIColor colorWithRed:210.0/255.0f green:230.0/255.0f blue:450.0/255.0f alpha:1.0f]];

        
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
      if (tableView==_leadTable) {
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
  
//    [self.popOverController presentPopoverFromRect:rect
//                                            inView:self.leadTable
//                          permittedArrowDirections:UIPopoverArrowDirectionLeft
//                                          animated:YES];
//
  //  [self MenuAction];
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
-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
      
    
}



- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSString *buttonTitle = [actionSheet buttonTitleAtIndex:buttonIndex];
    if  ([buttonTitle isEqualToString:@"Edit Leads"]) {
        NSLog(@"Destructive pressed --> Delete Something");
    }
    if ([buttonTitle isEqualToString:@"Create LeadInfo"]) {
        
       // self.leadTable.userInteractionEnabled=NO;
            }
   
}




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



@end
