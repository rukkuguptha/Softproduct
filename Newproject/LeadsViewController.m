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
        self.title=NSLocalizedString(@"Leads", @"Leads");
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    self.scroll.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    _view2.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    _composecmtview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    [[self.prjctdscptntxtfld layer] setBorderColor:[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor];
    [[self.prjctdscptntxtfld layer] setBorderWidth:2];
    [[self.prjctdscptntxtfld layer] setCornerRadius:10];
    

    _SearchingBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 220, 44)];
    _SearchingBar.delegate = (id)self;
    _SearchingBar.tintColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    //searchBar.tintColor=[UIColor cyanColor];
    self.leadTable.tableHeaderView =_SearchingBar;
    
        UISearchDisplayController* searchController = [[UISearchDisplayController alloc] initWithSearchBar:_SearchingBar contentsController:self];
    searchController.searchResultsDataSource = (id)self;
    searchController.searchResultsDelegate =(id)self;
    searchController.delegate = (id)self;

    
    
    _scroll.frame=CGRectMake(0, 44, 715,768);
    [_scroll setContentSize:CGSizeMake(715,1125)];
    //self.navigationController.navigationBar.tintColor= [UIColor colorWithRed:135.0/255.0f green:206.0/255.0f blue:250.0/255.0f alpha:1.0f];
    _leadTable.layer.borderWidth = 2.0;
    _leadTable.layer.borderColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _cmttable.layer.borderWidth = 2.0;
    _cmttable.layer.borderColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
//    _leadTable.separatorColor= [UIColor colorWithRed:219.0/255.0f green:236.0/255.0f blue:244.0/255.0f alpha:1.0f];
    
            [[self.cmttxtbox layer] setBorderColor:[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor];
            [[self.cmttxtbox layer] setBorderWidth:2];
            [[self.cmttxtbox layer] setCornerRadius:10];
    
    
    self.view3.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:251.0/255.0f alpha:1.0f];
         _popoverArray=[[NSMutableArray alloc]initWithObjects:@"Activity",@"Comments" ,nil];
    // Do any additional setup after loading the view from its nib.
    
    _btnArray=[[NSMutableArray alloc]initWithObjects:@"Create LeadInfo",@"Edit Leads",@"Delete Leads" ,nil];
    
    
    _leadtypeArray=[[NSMutableArray alloc]initWithObjects:@"Referral",@"Database",@"Repeat Customer",@"Phone Request", nil];
    _projecttypeArray=[[NSMutableArray alloc]initWithObjects:@"TurnAround",@"Maintenance",@"Capital Work",@"New Construction",@"Unknown", nil];
    _industrytypeArray=[[NSMutableArray alloc]initWithObjects:@"Chemical",@"Refining",@"Pulp",@"Paper",@"Power" ,nil];
    _prjctexcutnArray=[[NSMutableArray alloc]initWithObjects:@"Immediate",@"First Quarter", @"Second Quarter",@"Third Quarter",@"Fourth Quarter of that calender year", nil];
    _leadStatusArray=[[NSMutableArray alloc]initWithObjects:@"Open",@"Close",@"Active",@"Hot",@"Cold", nil];
    
    _view2.hidden=YES;

    
     
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
   [self Stateselect];
    [self getLeads];
   
    
    _view2.hidden=YES;

    
}

-(IBAction)addnewlead:(id)sender
{
       _ancelbtnlbl.enabled=YES;
    [self SelectAllCustomer];
    
     self.navbaritem.title = @"Create";
    
    butnidtfr=1;
    
    [_companybtn setTitle:@"Select" forState:UIControlStateNormal];
    _contactnametxtfld.text=@"";
    _phonetxtfld.text=@"";
    
    _citytxtfld.text=@"";
    [_leadtypebtnlbl setTitle:@"Select" forState:UIControlStateNormal];
    [_projecttype setTitle:@"Select" forState:UIControlStateNormal];
    
    
    _prjctyeartxtfld.text=@"";
    
    _prjctdscptntxtfld.text=@"";
    
    _locationtxtfld.text=@"";
    _contacttiletxtfld.text=@"";
    _emailidtxtfld.text=@"";
   
    [_statebutton setTitle:@"Select" forState:UIControlStateNormal];
    [_industrytypetxtfld setTitle:@"Select" forState:UIControlStateNormal];
    [_prjctexcutntxtfld setTitle:@"Select" forState:UIControlStateNormal];
    _leadassigntotextfld.text=@"";
    [_leadstatusBtn setTitle:@"Select" forState:UIControlStateNormal];
    
    _view2.hidden=NO;
//    _view2.frame = CGRectMake(512, 384, 0, 0);
//    //    CGPoint origin = _hidenview.frame.origin;
//    [UIView animateWithDuration: 1.0f animations:^{
//        _view2.frame = CGRectMake(195, 100, 692, 816);
//        //        _hidenview.center = origin;
//        _view2.alpha = 1.0;
//        
//    }];
    

}
-(IBAction)deletelead:(id)sender
{
    if (self.editing) {
        [super setEditing:NO animated:NO];
        [_leadTable setEditing:NO animated:NO];
        [_leadTable reloadData];
        
        
        
    }
    
    else{
        [super setEditing:YES animated:YES];
        [_leadTable setEditing:YES animated:YES];
        [_leadTable reloadData];
        
        
        
        
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
             case 6:
                return [_leadStatusArray count];
                break;
            case 7:
                return [_companylistArray count];
                break;
                case 8:
                return [_statearray count];
                break;

            default:
                break;
        }
        
    }
    if (tableView==_leadTable) {
         return [_leadinfoArray count];
    }
    if (tableView==_cmttable) {
        return [_CommentsArray count];
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
         if (tableView==_cmttable) {
             [[NSBundle mainBundle]loadNibNamed:@"CommentsCells" owner:self options:nil];
             [self.cmttable.layer setBorderColor:[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor];

             cell=_cmtcell;
             
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
    _editbtncelllbl=(UIButton *)[cell viewWithTag:8];
    [cell.contentView addSubview:_editbtncelllbl];
    
    }
    
        
    if (tableView==_popOverTableView) {
        cell.textLabel.font = [UIFont fontWithName:@"Helvetica Neue Light" size:12];
        cell.textLabel.font = [UIFont systemFontOfSize:12.0];

        
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
            case 6:
                cell.textLabel.text=[_leadStatusArray objectAtIndex:indexPath.row];
                
                break;
                
            case 7:
                cell.textLabel.text=[_companylistArray objectAtIndex:indexPath.row];
                
                break;
                case 8:
                cell.textLabel.text=[_statearray objectAtIndex:indexPath.row];
                break;

                
            default:
                break;
        }

        
        
    }
    
    
    if (tableView==_cmttable) {
    commentmdl*cmtmdl=(commentmdl *)[_CommentsArray  objectAtIndex:indexPath.row];
       
      _commenttextview=(UITextView*)[cell viewWithTag:1];
//        [[self.commenttextview layer] setBorderColor:[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor];
//        [[self.commenttextview layer] setBorderWidth:2];
//        [[self.commenttextview layer] setCornerRadius:10];

       _commenttextview.text=cmtmdl.comments;
        _titilelbl=(UILabel*)[cell viewWithTag:2];
        _titilelbl.text=cmtmdl.commentdate;

    }

    
    
    
    
    
    return cell;
    
    
}

#pragma mark - Table View delegate

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //alternating cell back ground color
    if(tableView==_leadTable)
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
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
      if (tableView==_leadTable) {
          
          
     
  
      }
    
     if (tableView==_popOverTableView) {
         
         
         
         switch (poptype) {
             case 1:
                 
                 [_leadtypebtnlbl setTitle:[_leadtypeArray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
                 
                           [self.popOverController dismissPopoverAnimated:YES];
                 break;
             case 2:
                 
                 [_projecttype setTitle:[_projecttypeArray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
 [self.popOverController dismissPopoverAnimated:YES];
                                
                 
                 break;
             case 3:
                 [_industrytypetxtfld setTitle:[_industrytypeArray objectAtIndex:indexPath.row] forState:UIControlStateNormal];

                 [self.popOverController dismissPopoverAnimated:YES];
                 
                 break;
             case 4:
                 
                 [_prjctexcutntxtfld setTitle:[_prjctexcutnArray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
                 [self.popOverController dismissPopoverAnimated:YES];
                 
                 
                 break;
             case 5:
          
                 if (indexPath.row==0) {
                     
                     //if (!self.activityVCtrl) {
                         self.activityVCtrl=[[ActivityViewController alloc]initWithNibName:@"ActivityViewController" bundle:nil];
                     //}
                   Infoleads*infomdl=(Infoleads *)[_leadinfoArray objectAtIndex:btnindex];
                     _activityVCtrl.leadid=infomdl.leadid;
                     NSLog(@"leadid%d",_activityVCtrl.leadid);
                    
                     //_activityVCtrl.modalPresentationStyle = UIModalPresentationPageSheet;
                     
//                     [self dismissViewControllerAnimated:YES completion:^{ [self presentViewController:_activityVCtrl
//                                                                                              animated:YES completion:NULL];}];
                     [self presentViewController:_activityVCtrl
                                        animated:YES completion:NULL];
                     [self.popOverController dismissPopoverAnimated:YES];

                 }
                 
                 if (indexPath.row==1) {
                     _composecmtview.hidden=YES;
                        [self.popOverController dismissPopoverAnimated:YES];
                  [self commentpopover];
                    

                     
                     
                     [self LeadCommentsList];
                

//                     if (!self.cmtsVCtrl) {
//                         self.cmtsVCtrl=[[CommentsViewController alloc]initWithNibName:@"CommentsViewController" bundle:nil];
//                     }
//                     [self.navigationController pushViewController:self.cmtsVCtrl animated:YES];
                     //
                     
                                         
                 }

                 break;
             case 6:
                 
                 [_leadstatusBtn setTitle:[_leadStatusArray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
                 
                 [self.popOverController dismissPopoverAnimated:YES];

                 
                 break;

             case 7:
                 
                 [_companybtn setTitle:[_companylistArray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
                 
                 [self.popOverController dismissPopoverAnimated:YES];

                 
                 break;
             case 8:
                 
                 [_statebutton setTitle:[_statearray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
                 
                 [self.popOverController dismissPopoverAnimated:YES];

                 
                 break;

             default:
                 break;
         }
         

         
         
         

         
         
     }
    
    
        
    

    
    
}


-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle==UITableViewCellEditingStyleDelete) {
        path=indexPath.row;
      
        [self DeleteLead];
        [_leadinfoArray removeObject:indexPath];
        
        
        
        //[self getLeads];
        
        
    }
    
}


#pragma mark - Buttons

- (IBAction)editcellbtn:(id)sender {
    butnidtfr=2;
    _ancelbtnlbl.enabled=NO;
    
     self.navbaritem.title = @"Edit";
    _view2.hidden=NO;
//    _view2.frame = CGRectMake(512, 384, 0, 0);
//    //    CGPoint origin = _hidenview.frame.origin;
//    [UIView animateWithDuration: 1.0f animations:^{
//        _view2.frame = CGRectMake(195, 100, 692, 816);
//        //        _hidenview.center = origin;
//        _view2.alpha = 1.0;
//        
//    }];

    button = (UIButton *)sender;
    CGPoint center= button.center;
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.leadTable];
    NSIndexPath *textFieldIndexPath = [self.leadTable indexPathForRowAtPoint:rootViewPoint];
    NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
    btnindex=textFieldIndexPath.row;
    
    
    Infoleads*info1=(Infoleads*)[_leadinfoArray objectAtIndex:btnindex];
    
    
    _contactnametxtfld.text=info1.contactName;
    
    _phonetxtfld.text=info1.phone;
    
    _citytxtfld.text=info1.city;
    [_leadtypebtnlbl setTitle:info1.Typeoflead forState:UIControlStateNormal];
    [_projecttype setTitle:info1.projecttype forState:UIControlStateNormal];
    [_companybtn setTitle:info1.companyname forState:UIControlStateNormal];


    _prjctyeartxtfld.text=info1.projectexecutionyear;
    
    _prjctdscptntxtfld.text=info1.projectdescription;
    
    _locationtxtfld.text=info1.location;
    _contacttiletxtfld.text=info1.contacttitle;
    _emailidtxtfld.text=info1.emailid;
    [_statebutton setTitle:[_reversedict objectForKey:info1.state]forState:UIControlStateNormal];
    NSLog(@"%@",info1.state);
    _leadassigntotextfld.text=info1.leadassignto;
    [_leadstatusBtn setTitle:info1.leadstatus forState:UIControlStateNormal];
    [_industrytypetxtfld setTitle:info1.Industrytype forState:UIControlStateNormal];
    [_prjctexcutntxtfld setTitle:info1.projectexecution forState:UIControlStateNormal];
    [self SelectAllCustomer];
     [self Stateselect];


   
}
- (IBAction)cancelbtn:(id)sender {
    [_companybtn setTitle:@"Select" forState:UIControlStateNormal];
    _contactnametxtfld.text=@"";    
    _phonetxtfld.text=@"";
    
    _citytxtfld.text=@"";
    [_leadtypebtnlbl setTitle:@"Select" forState:UIControlStateNormal];
    [_projecttype setTitle:@"Select" forState:UIControlStateNormal];
    [_leadstatusBtn setTitle:@"Select" forState:UIControlStateNormal];
    _leadassigntotextfld.text=@"";
    
    _prjctyeartxtfld.text=@"";
    
    _prjctdscptntxtfld.text=@"";
    
    _locationtxtfld.text=@"";
    _contacttiletxtfld.text=@"";
    _emailidtxtfld.text=@"";
     [_statebutton setTitle:@"Select" forState:UIControlStateNormal];
    
    [_industrytypetxtfld setTitle:@"Select" forState:UIControlStateNormal];
    [_prjctexcutntxtfld setTitle:@"Select" forState:UIControlStateNormal];

    
    
    
    
}

-(IBAction)closeleadpage:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (IBAction)clsebtn:(id)sender {
    butnidtfr=0;
    _view2.hidden=YES;
//    _view2.frame = CGRectMake(250, 250, 384, 356);
//    //    CGPoint origin = _hidenview.frame.origin;
//    [UIView animateWithDuration: 1.0f animations:^{
//        _view2.frame = CGRectMake(512, 384, 0, 0);
//        //        _hidenview.center = origin;
//        _view2.alpha = 0;
//        
//    }];

    
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
   
   
    [popoverView addSubview:_popOverTableView];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(200, 250);
    
    //create a popover controller
    self.popOverController = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    [self.popOverController presentPopoverFromRect:_leadtypebtnlbl.frame
                                            inView:self.scroll
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
    
    [popoverView addSubview:_popOverTableView];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(200, 250);
    
    //create a popover controller
    self.popOverController = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    [self.popOverController presentPopoverFromRect:_projecttype.frame
                                            inView:self.scroll
                          permittedArrowDirections:UIPopoverArrowDirectionUp
                                          animated:YES];
    

}
-(IBAction)selectLeadStatus:(id)sender
{   poptype=6;
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 200, 250)];
    
    popoverView.backgroundColor = [UIColor lightTextColor];
    _popOverTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 200, 250)];
    _popOverTableView.delegate=(id)self;
    _popOverTableView.dataSource=(id)self;
    _popOverTableView.rowHeight= 32;
    
    [popoverView addSubview:_popOverTableView];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(200, 250);
    
    //create a popover controller
    self.popOverController = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    [self.popOverController presentPopoverFromRect:_leadstatusBtn.frame
                                            inView:self.scroll
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
   
   
    [popoverView addSubview:_popOverTableView];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(200, 250);
    
    //create a popover controller
    self.popOverController = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    [self.popOverController presentPopoverFromRect:_industrytypetxtfld.frame
                                            inView:self.scroll
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
   

    [popoverView addSubview:_popOverTableView];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(200, 250);
    
    //create a popover controller
    self.popOverController = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    [self.popOverController presentPopoverFromRect:_prjctexcutntxtfld.frame
                                            inView:self.scroll
                          permittedArrowDirections:UIPopoverArrowDirectionUp
                                          animated:YES];
    

}


- (IBAction)disclosurebtn:(id)sender {
    poptype=5;
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 120, 82)];
    
    popoverView.backgroundColor = [UIColor whiteColor];
    _popOverTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 120, 82)];
    
    _popOverTableView.delegate=(id)self;
    _popOverTableView.dataSource=(id)self;
    _popOverTableView.rowHeight= 42;
    _popOverTableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    
    
    // CGRect rect = frame;
    [popoverView addSubview:_popOverTableView];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(120, 82);
    
    //create a popover controller
    
    self.popOverController = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    
     button = (UIButton *)sender;
    UITableViewCell *cell = (UITableViewCell *)[[button superview] superview];
    CGPoint center= button.center;
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.leadTable];
    NSIndexPath *textFieldIndexPath = [self.leadTable indexPathForRowAtPoint:rootViewPoint];
    NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
    btnindex=textFieldIndexPath.row;

    // _Path=IndexPath;
   Infoleads*infomdl=(Infoleads *)[_leadinfoArray objectAtIndex:btnindex];
    NSInteger l;
    l=infomdl.leadid;

    
    [self.popOverController presentPopoverFromRect:_disclsurelbl.frame
                                            inView:cell
                          permittedArrowDirections:UIPopoverArrowDirectionLeft
                                          animated:YES];
    
    
      

    
    
}

-(void)createpopover{
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 120, 82)];
    
    popoverView.backgroundColor = [UIColor whiteColor];
    _popOverTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 120, 82)];
    
    _popOverTableView.delegate=(id)self;
    _popOverTableView.dataSource=(id)self;
    _popOverTableView.rowHeight= 42;
    _popOverTableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    
    
    // CGRect rect = frame;
    [popoverView addSubview:_popOverTableView];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(120, 82);
    
    //create a popover controller
    
    self.popOverController = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    
//    button = (UIButton *)sender;
//    UITableViewCell *cell = (UITableViewCell *)[[button superview] superview];
//    CGPoint center= button.center;
//    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.leadTable];
//    NSIndexPath *textFieldIndexPath = [self.leadTable indexPathForRowAtPoint:rootViewPoint];
//    NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
//    btnindex=textFieldIndexPath.row;
//    
//    // _Path=IndexPath;
//    Infoleads*infomdl=(Infoleads *)[_leadinfoArray objectAtIndex:btnindex];
//    NSInteger l;
//    l=infomdl.leadid;
    
    
    [self.popOverController presentPopoverFromRect:_disclsurelbl.frame
                                            inView:self.view
                          permittedArrowDirections:UIPopoverArrowDirectionLeft
                                          animated:YES];

    
}
- (IBAction)Addcmtbtn:(id)sender {
    _composecmtview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];

    _composecmtview.hidden=NO;
    
    _cmttxtbox.text=@"";
//   _composecmtview.frame = CGRectMake(512, 384, 0, 0);
//    //    CGPoint origin = _hidenview.frame.origin;
//    [UIView animateWithDuration: 1.0f animations:^{
//      _composecmtview.frame = CGRectMake(195, 60, 431, 233);
//        //        _hidenview.center = origin;
//      _composecmtview.alpha = 1.0;
//        
//    }];

}

- (IBAction)savecmtbtn:(id)sender {
         butnidtfr=3;
    [self Saveleadcomment];
    
    
}

- (IBAction)cancelcmtbtn:(id)sender {
    _cmttxtbox.text=@"";
     butnidtfr=0;
    _composecmtview.hidden=YES;

}



- (IBAction)updatebtn:(id)sender {
    Validation *val=[[Validation alloc]init];
    if([_companybtn.titleLabel.text isEqualToString:@""]||[_companybtn.titleLabel.text isEqualToString:@"Select"])
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Company Name is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else if([_phonetxtfld.text isEqualToString:@""])
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Phone Number is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else if(![_prjctyeartxtfld.text isEqualToString:@""]||![_emailidtxtfld.text isEqualToString:@""])
    {
        int value1 = [val isNumeric:_prjctyeartxtfld.text];
        int value2 = [val validEmailAddress:_emailidtxtfld.text];
        if(value1==0)
        {
            
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid Year" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert1 show];
        }
        else if(value2==0)
        {
            
            if([_emailidtxtfld.text length]==0)
            {
                
            }
            else
            {
                UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid Email" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
            }

        }
        else
        {
            if (butnidtfr==1) {
                [self Addlead];
            }
            else  if(butnidtfr==2)
            {
                
                [self updatelead];
            }

        }

        
        
        
    
    
    }
    else
    {
        if (butnidtfr==1) {
            [self Addlead];
        }
        else  if(butnidtfr==2)
        {
            
            [self updatelead];
        }

    }
}
- (IBAction)selectcompany:(id)sender
{
    poptype=7;
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 200, 250)];
    
    popoverView.backgroundColor = [UIColor lightTextColor];
    _popOverTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 200, 250)];
    _popOverTableView.delegate=(id)self;
    _popOverTableView.dataSource=(id)self;
    _popOverTableView.rowHeight= 32;
    
    
    [popoverView addSubview:_popOverTableView];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(200, 250);
    
    //create a popover controller
    self.popOverController = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    [self.popOverController presentPopoverFromRect:_companybtn.frame
                                            inView:self.scroll
                          permittedArrowDirections:UIPopoverArrowDirectionUp
                                          animated:YES];
    

}
- (IBAction)selectstate:(id)sender
{
    

    poptype=8;
    UIViewController *popovercontent=[[UIViewController alloc]init];
    UIView *popoverview=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 250)];
    popoverview.backgroundColor=[UIColor lightTextColor];
    _popOverTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 200, 250)];
    _popOverTableView.delegate=(id)self;
    _popOverTableView.dataSource=(id)self;
    _popOverTableView.rowHeight=32;
    [popoverview addSubview:_popOverTableView];
    popovercontent.view=popoverview;
    popovercontent.contentSizeForViewInPopover=CGSizeMake(200, 250);
    self.popOverController=[[UIPopoverController alloc]initWithContentViewController:popovercontent];
    [self.popOverController presentPopoverFromRect:_statebutton.frame inView:_scroll permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
    
    
}


#pragma mark - webservice
/*arvinices*/
-(void)Stateselect
{
    recordResults=FALSE;
    NSString *soapmessage;
    soapmessage=[NSString stringWithFormat:
                 @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                 "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                 "<soap:Body>\n"
                 "<Stateselect xmlns=\"http://test.kontract360.com/\">\n"
                 "</Stateselect>\n"
                 "</soap:Body>\n"
                 "</soap:Envelope>\n"];
    NSLog(@"soapmessage%@",soapmessage);
   // NSURL *url=[NSURL URLWithString:@"http://192.168.0.125/service.asmx"];
      NSURL *url = [NSURL URLWithString:@"test.kontract360.com/service.asmx"];
    NSMutableURLRequest *theRequest=[NSMutableURLRequest requestWithURL:url];
    NSString *msglength=[NSString stringWithFormat:@"%d",[soapmessage length]];
    [theRequest addValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [theRequest addValue: @"http://test.kontract360.com/Stateselect" forHTTPHeaderField:@"Soapaction"];
    
    [theRequest addValue: msglength forHTTPHeaderField:@"Content-Length"];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setHTTPBody: [soapmessage dataUsingEncoding:NSUTF8StringEncoding]];
    
    
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


-(void)getLeads{
    recordResults = FALSE;
    NSString *soapMessage;
      
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                                 
                   "<soap:Body>\n"
                   
                   "<GetLeads xmlns=\"http://test.kontract360.com/\">\n"
                  
                   "</GetLeads>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
     NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/GetLeads" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)updatelead{
     webtype=1;
    Infoleads*info2=(Infoleads*)[_leadinfoArray objectAtIndex:btnindex];
    NSString *stid;
    
    stid=[_statedict objectForKey:_statebutton.titleLabel.text];

    recordResults = FALSE;
    NSString *soapMessage;
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UpdateCLMDemo xmlns=\"http://test.kontract360.com/\">\n"
                   
                   "<LeadId>%d</LeadId>\n"
                   "<CompanyName>%@</CompanyName>\n"
                   "<Location>%@</Location>\n"
                   "<ContactName>%@</ContactName>\n"
                   "<ContactTitle>%@</ContactTitle>\n"
                   "<Phone>%@</Phone>\n"
                   "<EmailId>%@</EmailId>\n"
                   "<City>%@</City>\n"
                   "<State>%d</State>\n"
                   "<TypeOfLead>%@</TypeOfLead>\n"
                   "<IndustryType>%@</IndustryType>\n"
                   "<ProjectType>%@</ProjectType>\n"
                   "<Projectdescription>%@</Projectdescription>\n"
                   "<ProjectExecution>%@</ProjectExecution>\n"
                  " <ProjectExecutionYear>%d</ProjectExecutionYear>\n"
                   "<LeadAssignTo>%@</LeadAssignTo>\n"
                   "<LeadStatus>%@</LeadStatus>\n"
                   "<BidStatus>%D</BidStatus>\n"
                   "<ID>%@</ID>\n"
                   "</UpdateCLMDemo>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",info2.leadid,_companybtn.titleLabel.text,_locationtxtfld.text,_contactnametxtfld.text,_contacttiletxtfld.text,_phonetxtfld.text,_emailidtxtfld.text,_citytxtfld.text,[stid integerValue],_leadtypebtnlbl.titleLabel.text,_industrytypetxtfld.titleLabel.text,_projecttype.titleLabel.text,_prjctdscptntxtfld.text,_prjctexcutntxtfld.titleLabel.text,[_prjctyeartxtfld.text  integerValue],_leadassigntotextfld.text,_leadstatusBtn.titleLabel.text,[info2.bidstatus integerValue ],info2.idvalue];
                                                                                                                                                                                                                                    
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/UpdateCLMDemo" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)Addlead{
    webtype=1;
    recordResults = FALSE;
    NSString *soapMessage;
    NSInteger Leadid=0;
    NSString *bidstatus=@"0";
     NSString *idvalue=@"Bid-0000";
    NSString *stid;
   
    stid=[_statedict objectForKey:_statebutton.titleLabel.text];
    

    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SaveLead xmlns=\"http://test.kontract360.com/\">\n"
                   
                   "<leadid>%d</leadid>\n"
                   "<Companyname>%@</Companyname>\n"
                   "<Location>%@</Location>\n"
                   "<Contactname>%@</Contactname>\n"
                   "<Contacttitle>%@</Contacttitle>\n"
                   "<Phone>%@</Phone>\n"
                   "<MailId>%@</MailId>\n"
                   "<City>%@</City>\n"
                   "<State>%d</State>\n"
                   "<LeadType>%@</LeadType>\n"
                   "<IndustryType>%@</IndustryType>\n"
                   "<ProjectType>%@</ProjectType>\n"
                   "<PrjectDescription>%@</PrjectDescription>\n"
                   "<ProjectExecution>%@</ProjectExecution>\n"
                   "<ProjectExecutionYear>%d</ProjectExecutionYear>\n"
                   "<LeadAssignTo>%@</LeadAssignTo>\n"
                   "<LeadStatus>%@</LeadStatus>\n"
                   "<Bidstatus>%d</Bidstatus>\n"
                   "<ID>%@</ID>\n"
                   "</SaveLead>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",Leadid,_companybtn.titleLabel.text,_locationtxtfld.text,_contactnametxtfld.text,_contacttiletxtfld.text,_phonetxtfld.text,_emailidtxtfld.text,_citytxtfld.text,[stid integerValue],_leadtypebtnlbl.titleLabel.text,_industrytypetxtfld.titleLabel.text,_projecttype.titleLabel.text,_prjctdscptntxtfld.text,_prjctexcutntxtfld.titleLabel.text,[_prjctyeartxtfld.text  integerValue],_leadassigntotextfld.text,_leadstatusBtn.titleLabel.text,[bidstatus integerValue],idvalue];
    
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
     NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/SaveLead" forHTTPHeaderField:@"Soapaction"];
    
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

-(void)SearchLead{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SearchLead1 xmlns=\"http://test.kontract360.com/\">\n"
                    "<searchtext>%@</searchtext>\n"
                   "</SearchLead1>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_searchstring];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
     NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue:@"http://test.kontract360.com/SearchLead1" forHTTPHeaderField:@"Soapaction"];
    
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
                   
                   "<SelectAllCustomer xmlns=\"http://test.kontract360.com/\">\n"
                   
                   "</SelectAllCustomer>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
     NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/SelectAllCustomer" forHTTPHeaderField:@"Soapaction"];
    
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


-(void)DeleteLead{
     webtype=1;
    recordResults = FALSE;
    NSString *soapMessage;
      Infoleads*info=(Infoleads*)[_leadinfoArray objectAtIndex:path];
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<DeleteLead xmlns=\"http://test.kontract360.com/\">\n"
                   "<leadid>%d</leadid>\n"
                  
                   "</DeleteLead>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",info.leadid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
     NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/DeleteLead" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)LeadCommentsList{
    recordResults = FALSE;
    NSString *soapMessage;
    Infoleads*info=(Infoleads*)[_leadinfoArray objectAtIndex:btnindex];
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<LeadCommentsList xmlns=\"http://test.kontract360.com/\">\n"
                   "<leadId>%d</leadId>\n"
                   
                   "</LeadCommentsList>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",info.leadid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
     NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/LeadCommentsList" forHTTPHeaderField:@"Soapaction"];
    
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

-(void)Saveleadcomment{
    
        
    NSDate*curntdate=[NSDate date];
    NSLog(@"%@",curntdate);
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
    [dateFormat setDateFormat:@"HH:mm:ss a"];
    NSLog(@"curntdate%@",[dateFormat stringFromDate:curntdate]);
    NSString*time=[dateFormat stringFromDate:curntdate];
    [dateFormat setDateFormat:@"MM/dd/ yyyy"];
    NSString*date1=[dateFormat stringFromDate:curntdate];
    NSString*today=[NSString stringWithFormat:@"%@ %@",date1,time];
    recordResults = FALSE;
    NSString *soapMessage;
    NSInteger userid=100;
    Infoleads*info=(Infoleads*)[_leadinfoArray objectAtIndex:btnindex];
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SaveLeadComment xmlns=\"http://test.kontract360.com/\">\n"
                   "<LeadId>%d</LeadId>\n"
                   "<Comments>%@</Comments>\n"
                   "<UserId>%d</UserId>\n"
                   "<CommentDate>%@</CommentDate>\n"
                   "</SaveLeadComment>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",info.leadid,_cmttxtbox.text,userid,today];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
     NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/SaveLeadComment" forHTTPHeaderField:@"Soapaction"];
    
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
   
    [_cmttable reloadData];

    if (butnidtfr==3) {
        [self LeadCommentsList];
        butnidtfr=6;
    }
    if (webtype==1) {
        [self getLeads];
        webtype=0;
    }
     [_leadTable reloadData];
    [_popOverTableView reloadData];
      
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
    if([elementName isEqualToString:@"SearchLead1Response"])
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
    if([elementName isEqualToString:@"phone"])
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
    if([elementName isEqualToString:@"TypeofLead"])
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
    if([elementName isEqualToString:@"LeadAssignTo"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"LeadStatus"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"BidStatus"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ID"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    

    if([elementName isEqualToString:@"SaveLeadResult"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
//
//
//    if([elementName isEqualToString:@"Column1"])
//    {
//        if(!_soapResults)
//        {
//            _soapResults = [[NSMutableString alloc] init];
//        }
//        recordResults = TRUE;
//
//    }
//
//    
//    
//    if([elementName isEqualToString:@"DeleteLeadResult"])
//    {
//        if(!_soapResults)
//        {
//            _soapResults = [[NSMutableString alloc] init];
//        }
//        recordResults = TRUE;
//          }
//    if([elementName isEqualToString:@"msg"])
//    {
//        if(!_soapResults)
//        {
//            _soapResults = [[NSMutableString alloc] init];
//        }
//        recordResults = TRUE;
//    }
//    if([elementName isEqualToString:@"LeadId"])
//    {
//        if(!_soapResults)
//        {
//            _soapResults = [[NSMutableString alloc] init];
//        }
//        recordResults = TRUE;
//    }
//    
//    
        if([elementName isEqualToString:@"LeadCommentsListResponse"])
    {
        _CommentsArray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"commentId"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"LEADID"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    
    if([elementName isEqualToString:@"Comments"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"UserId"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"CommentDate"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"SelectAllCustomerResult"])
    {
        _companylistArray=[[NSMutableArray alloc]init];
        _companydict=[[NSMutableDictionary alloc]init];
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
    if([elementName isEqualToString:@"UpdateCLMDemoResult"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"result"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"StateselectResult"])
    {
        _statearray=[[NSMutableArray alloc]init];
         _statedict=[[NSMutableDictionary alloc]init];
        _reversedict=[[NSMutableDictionary alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"state_id"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"state_name"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"SaveLeadCommentResult"])
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
    
    
    if([elementName isEqualToString:@"phone"])
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
    if([elementName isEqualToString:@"TypeofLead"])
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
               _soapResults = nil;
    }
    if([elementName isEqualToString:@"LeadAssignTo"])
    {
        
        recordResults = FALSE;
        _infoleads.leadassignto=_soapResults;
        _soapResults = nil;
    }

    if([elementName isEqualToString:@"LeadStatus"])
    {
        
        recordResults = FALSE;
        _infoleads.leadstatus=_soapResults;
        _soapResults = nil;
    }

    if([elementName isEqualToString:@"BidStatus"])
    {
        
        recordResults = FALSE;
        _infoleads.bidstatus=_soapResults;
        //[_leadinfoArray addObject:_infoleads];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"ID"])
    {
        
        recordResults = FALSE;
        _infoleads.idvalue=_soapResults;
        [_leadinfoArray addObject:_infoleads];
        _soapResults = nil;
    }


    if([elementName isEqualToString:@"SaveLeadResult"])
    {
        
        recordResults = FALSE;
              _soapResults = nil;
    }
    if([elementName isEqualToString:@"UpdateCLMDemoResult"])
    {
        
        recordResults = FALSE;
        _soapResults = nil;
    }

//    if([elementName isEqualToString:@"Column1"])
//    {
//        
//        recordResults = FALSE;
//        UIAlertView*alert=[[UIAlertView alloc]initWithTitle:nil message:_soapResults delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
//        [alert show];
//        _soapResults = nil;
//    }
//
//
//      if([elementName isEqualToString:@"msg"])
//    {
//        
//       
//        recordResults = FALSE;
//        UIAlertView*alert=[[UIAlertView alloc]initWithTitle:nil message:_soapResults delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
//        [alert show];
//        _soapResults = nil;
//    }
    
//    if([elementName isEqualToString:@"LeadId"])
//    {
//      
//        _infoleads=[[Infoleads alloc]init];
//        recordResults = FALSE;
//        _infoleads.leadid=[_soapResults integerValue];
//       
//        _soapResults = nil;
//    }
//    
//
//
    if([elementName isEqualToString:@"Comments"])
    {
     recordResults = FALSE;
        _cmtmdl.comments=_soapResults;
        
         _soapResults = nil;
    }
    if([elementName isEqualToString:@"LEADID"])
    {
        recordResults = FALSE;
        _cmtmdl.leadid=[_soapResults integerValue];
        
        _soapResults = nil;
    }

    
    if([elementName isEqualToString:@"CommentDate"])
    {
        recordResults = FALSE;
        _cmtmdl.commentdate=_soapResults;
        [_CommentsArray addObject:_cmtmdl];
        
        _soapResults = nil;    }
    
    
    if([elementName isEqualToString:@"UserId"])
    {
        recordResults = FALSE;
        _cmtmdl.userid=[_soapResults integerValue];
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"commentId"])
    {
        _cmtmdl=[[commentmdl alloc]init];
        recordResults = FALSE;
        _cmtmdl.commentId=[_soapResults integerValue];

        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Id"])
    {
        
        recordResults = FALSE;
        _companystring=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"CustomerName"])
    {
        
        recordResults = FALSE;
        [_companydict setObject:_companystring forKey:_soapResults];
        [_companylistArray addObject:_soapResults];
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"result"])
    {
        recordResults=FALSE;
        _msgstring=_soapResults;
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:_soapResults delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        _soapResults=nil;
    }
    if([elementName isEqualToString:@"StateselectResult"])
    {
        
        recordResults = FALSE;
       
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"state_id"])
    {
        
        recordResults = FALSE;
         _stateid=_soapResults;
        _soapResults = nil;
    }

    if([elementName isEqualToString:@"state_name"])
    {
        
        recordResults = FALSE;
        [_statearray addObject:_soapResults];
         [_statedict setObject:_stateid forKey:_soapResults];
        [_reversedict setObject:_soapResults forKey:_stateid];
        _soapResults = nil;
    }
    


    

    
}
-(void)alertView:(UIAlertView*)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
   if([alertView.message isEqualToString:_msgstring])
   {
       [_companybtn setTitle:@"Select" forState:UIControlStateNormal];
       _contactnametxtfld.text=@"";
       _phonetxtfld.text=@"";
       
       _citytxtfld.text=@"";
       [_leadtypebtnlbl setTitle:@"Select" forState:UIControlStateNormal];
       [_projecttype setTitle:@"Select" forState:UIControlStateNormal];
       
       
       _prjctyeartxtfld.text=@"";
       
       _prjctdscptntxtfld.text=@"";
       
       _locationtxtfld.text=@"";
       _contacttiletxtfld.text=@"";
       _emailidtxtfld.text=@"";
        [_statebutton setTitle:@"Select" forState:UIControlStateNormal];
       [_industrytypetxtfld setTitle:@"Select" forState:UIControlStateNormal];
       [_prjctexcutntxtfld setTitle:@"Select" forState:UIControlStateNormal];
       _leadassigntotextfld.text=@"";
       [_leadstatusBtn setTitle:@"Select" forState:UIControlStateNormal];
       _cmttxtbox.text=@"";
       _composecmtview.hidden=YES;
       

   }
    if([alertView.message isEqualToString:@"Invalid Email"])
    {
        _emailidtxtfld.text=@"";
    }
    if ([alertView.message isEqualToString:@"Invalid PhoneNumber"]) {
    _phonetxtfld.text=@"";
            
    }
    if ([alertView.message isEqualToString:@"Invalid Year"]) {
           
        {
           _prjctyeartxtfld.text=@"";
        }

        
    
}
    }

#pragma mark - SearchBar

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    _searchstring=_SearchingBar.text;
    //NSLog(@"search%@",searchstring);
    [self SearchLead];
    [searchBar resignFirstResponder];
    
}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    [self getLeads];
    
}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    if ([_SearchingBar.text length]==0) {
        
        [self getLeads];
        // [searchBar resignFirstResponder];
        
        
    }
    //[searchBar resignFirstResponder];
    
}


-(void)commentpopover{
    
    
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 520, 530)];
    
    popoverView.backgroundColor = [UIColor whiteColor];
   
    
    [popoverView addSubview:self.commentview];
    self.commentview.hidden=NO;
    // CGRect rect = frame;
      popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(520, 530);
    
    //create a popover controller
    
    self.popOverController1 = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    
    //
    //    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    //    CGRect rect=CGRectMake(cell.bounds.origin.x+90, cell.bounds.origin.y+10, 50, 30);
    //    [self.popOverController presentPopoverFromRect:_disclsurelbl.bounds inView:self.view permittedArrowDirections:nil animated:YES];
    
    
//    UIButton *button=(UIButton *)nil;
//    
//    UITableViewCell *cell = (UITableViewCell *)[[button superview] superview];
//    UITableView *table = (UITableView *)[cell superview];
//    NSIndexPath *IndexPath = [table indexPathForCell:cell];
//    
   
    
//    [self.popOverController1 presentPopoverFromRect: CGRectMake(350, 120, 300, 500)                                        inView:self.view
//                          permittedArrowDirections:UIPopoverArrowDirectionDown
//                                          animated:YES];
    
    
    [self.popOverController1 presentPopoverFromRect: CGRectMake(0, 120, 300, 500)                                        inView:self.view
                           permittedArrowDirections:UIPopoverArrowDirectionAny
                                           animated:YES];
    

}

#pragma mark-textfld delegates
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    
    if(textField==_locationtxtfld)
    {
        NSUInteger newLength = [_locationtxtfld.text length] + [string length] - range.length;
        return (newLength > 100) ? NO : YES;
    }
    if(textField==_contactnametxtfld)
    {
        NSUInteger newLength = [_contactnametxtfld.text length] + [string length] - range.length;
        return (newLength > 100) ? NO : YES;
    }
    if(textField==_contacttiletxtfld)
    {
        NSUInteger newLength = [_contacttiletxtfld.text length] + [string length] - range.length;
        return (newLength > 100) ? NO : YES;
    }
    
    if(textField==_emailidtxtfld)
    {
        NSUInteger newLength = [_emailidtxtfld.text length] + [string length] - range.length;
        return (newLength > 100) ? NO : YES;
    }
    
    if(textField==_citytxtfld)
    {
        NSUInteger newLength = [_citytxtfld.text length] + [string length] - range.length;
        return (newLength > 50) ? NO : YES;
    }
    if(textField==_leadassigntotextfld)
    {
        NSUInteger newLength = [_leadassigntotextfld.text length] + [string length] - range.length;
        return (newLength > 50) ? NO : YES;
    }
    if(textField==_prjctyeartxtfld)
    {
        NSUInteger newLength = [_prjctyeartxtfld.text length] + [string length] - range.length;
        return (newLength > 30) ? NO : YES;
    }
    if(textField==_phonetxtfld)
    {
        NSUInteger newLength = [_phonetxtfld.text length] + [string length] - range.length;
        return (newLength > 12) ? NO : YES;
    }
    
    return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
     if(textField==_prjctyeartxtfld){
         Validation *val=[[Validation alloc]init];
         int value1=[val isNumeric:_prjctyeartxtfld.text];
        
         if(value1==0)
         {
             
             UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid Year" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
             [alert1 show];
             
             
         }
         
     }
    
    if(textField==_emailidtxtfld){
        
        Validation *val=[[Validation alloc]init];
        BOOL bEmailValid = [val validEmailAddress:_emailidtxtfld.text];
        if(bEmailValid)
        {
            // email valid, other validations in the form
        }
        else
        {
            if([_emailidtxtfld.text length]==0)
            {
            
            }
            else
            {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid Email" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            }
        }
        
        
    }

    if(textField==_phonetxtfld)
    {
        
        phonenostring=_phonetxtfld.text;
        
        
        if ([phonenostring length]<10) {
            if([phonenostring isEqualToString:@""])
            {
                
            }
            else
            {
                fmt=1;
                UIAlertView*alert=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid PhoneNumber" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil , nil];
                
                [alert show];
                
            }
            
            
            
        }
        else
        {
            
            Validation*val=[[Validation alloc]init];
            int value1=[val isdataformat:_phonetxtfld.text];
            if(value1==0)
            {
                UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid PhoneNumber" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert1 show];
                
                
            }
            else
            {
                
                phonenostring=_phonetxtfld.text;
                //checking a particular charector
                // NSString *connectstring;
                NSString*new=[phonenostring substringWithRange:NSMakeRange(3, 1)];
                NSString*new1=[phonenostring substringWithRange:NSMakeRange(7, 1)];
                
                
                
                NSCharacterSet *notAllowedChars = [[NSCharacterSet characterSetWithCharactersInString:@"1234567890"] invertedSet];
                NSString *resultString = [[phonenostring componentsSeparatedByCharactersInSet:notAllowedChars] componentsJoinedByString:@""];
                NSLog (@"Result: %@", resultString);
                if ([resultString length]==9){
                    
                    
                    fmt=1;
                    UIAlertView*alert=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid PhoneNumber" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil , nil];
                    
                    [alert show];
                    
                }
                
                
                if ([phonenostring length]==12) {
                    
                    
                    
                    
                    
                    
                    if ([new  isEqualToString:@"-"]&&[new1  isEqualToString:@"-"]) {
                        _phonenofmtstring=phonenostring;
                        fmt=2;
                    }
                    else
                    { fmt=1;
                        UIAlertView*alert=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid PhoneNumber" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil , nil];
                        
                        [alert show];
                    }
                    
                }
                
                
                
                if ([resultString length]==10){
                    
                    
                    fmt=2;
                    
                    NSString *subString = [resultString substringWithRange:NSMakeRange(0,3)];
                    NSLog(@"%@",subString);
                    NSString *substring2=[resultString  substringWithRange:NSMakeRange(3,3)];
                    NSLog(@"%@",substring2);
                    NSString *substring3=[resultString  substringWithRange:NSMakeRange(6,4)];
                    NSLog(@"%@",substring3);
                    _phonenofmtstring=[NSString stringWithFormat:@"%@-%@-%@",subString,substring2,substring3];
                    NSLog(@"%@",_phonenofmtstring);
                    
                    
                    
                    
                    _phonetxtfld.text=_phonenofmtstring;
                    
                }
                
                
                
                
                
                if ([resultString length]==11){
                    
                    
                    fmt=1;
                    UIAlertView*alert=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid PhoneNumber" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil , nil];
                    
                    [alert show];
                    
                }
                
            }
        }
    }
    
    
}

- (IBAction)closecomments:(id)sender
{
    [self.popOverController1 dismissPopoverAnimated:YES];
}

@end
