//
//  CrewsetupViewController.m
//  Newproject
//
//  Created by GMSIndia1 on 3/5/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "CrewsetupViewController.h"

@interface CrewsetupViewController ()

@end

@implementation CrewsetupViewController
#define kCellHeight 44
#define kNavBarHeight 30

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
    self.view.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    _touchview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
  
    _navbar.tintColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _manpwrtable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:250.0/255.0f alpha:1.0f].CGColor;
    _manpwrtable.layer.borderWidth=3.0f;
    _crewnametable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _crewnametable.layer.borderWidth=2.0f;
    
    
  
    
    UIPanGestureRecognizer* panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanning:)];
    panGesture.delegate=self;
    [self.touchview addGestureRecognizer:panGesture];

        }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self setupSourceTableWithFrame:CGRectMake(0, 0, 266,610)];
    [self setupDestinationTableWithFrame:CGRectMake(0, 0, 460, 533)];

   
    [self AllSkills];
   
}

#pragma mark-Popover
-(void)createpopover{
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 200, 120)];
    
    popoverView.backgroundColor = [UIColor whiteColor];
    _popOverTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 200, 120)];
    
    _popOverTableView.delegate=(id)self;
    _popOverTableView.dataSource=(id)self;
    _popOverTableView.rowHeight= 32;
    _popOverTableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    
    
    // CGRect rect = frame;
    [popoverView addSubview:_popOverTableView];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(200, 120);
    
    //create a popover controller
    
    self.popOverController = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    
    //
    //    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    //    CGRect rect=CGRectMake(cell.bounds.origin.x+90, cell.bounds.origin.y+10, 50, 30);
    //    [self.popOverController presentPopoverFromRect:_disclsurelbl.bounds inView:self.view permittedArrowDirections:nil animated:YES];
    
    
    
    
    
    
    [self.popOverController presentPopoverFromRect:_servicebtnlbl.frame
                                            inView:self.view
                          permittedArrowDirections:UIPopoverArrowDirectionUp
                                          animated:YES];
    
    
}
-(void)createcrewpopover{
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 200, 120)];
    
    popoverView.backgroundColor = [UIColor whiteColor];
    _popOverTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 200, 120)];
    
    _popOverTableView.delegate=(id)self;
    _popOverTableView.dataSource=(id)self;
    _popOverTableView.rowHeight= 32;
    _popOverTableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    
    
    // CGRect rect = frame;
    [popoverView addSubview:_popOverTableView];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(200, 120);
    
    //create a popover controller
    
    self.popOverController = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    
    //
    //    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    //    CGRect rect=CGRectMake(cell.bounds.origin.x+90, cell.bounds.origin.y+10, 50, 30);
    //    [self.popOverController presentPopoverFromRect:_disclsurelbl.bounds inView:self.view permittedArrowDirections:nil animated:YES];
    
    
    
    
    
    
    [self.popOverController presentPopoverFromRect:_crewbtnlbl.frame
                                            inView:self.view
                          permittedArrowDirections:UIPopoverArrowDirectionUp
                                          animated:YES];
    
    
}

#pragma mark-textfield delegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    _autocompleteTableView.hidden = NO;
    NSString *substring = [NSString stringWithString:textField.text];
    substring = [substring stringByReplacingCharactersInRange:range withString:string];
    [self searchAutocompleteEntriesWithSubstring:substring];
    return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField{
     }
#pragma mark-tableview datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if (tableView==_popOverTableView) {
        switch (poptype) {
            case 1:
                 return [_skillarray count];
                break;
            case 2:
                return [_crenamearray count];
                break;

            default:
                break;
        }
        
       
        
        
    }

    if (tableView==_manpwrtable) {
        return [_manpwrarray count];
        
        
    }
    if (tableView==_crewnametable) {
        
        return [_crewmembersarray count];
        
    }
    
    return YES;
    
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
        if (tableView==_manpwrtable) {
            [[NSBundle mainBundle]loadNibNamed:@"Cmanpwrcell" owner:self options:nil];
           cell=_manpwrcell;
            
        }
        if (tableView==_crewnametable) {
            [[NSBundle mainBundle]loadNibNamed:@"Namecrewcell" owner:self options:nil];
            
           cell=_crewnamecell;
        }
        
        cell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12];
        
    }
    
    
    if (tableView==_popOverTableView) {
        switch (poptype) {
            case 1:
                 cell.textLabel.text = [_skillarray objectAtIndex:indexPath.row];
                break;
            case 2:
                cell.textLabel.text = [_crenamearray objectAtIndex:indexPath.row];
                break;
            default:
                break;
        }
        
        
        
        
    }

    
    if (tableView==_manpwrtable) {
        Manpwr *manpwr=(Manpwr *)[_manpwrarray objectAtIndex:indexPath.row];
        _manpwritmlbl=(UILabel *)[cell viewWithTag:1];
        _manpwritmlbl.text=manpwr.itemcode;
        _manpwrdeslbl=(UILabel *)[cell viewWithTag:2];
        _manpwrdeslbl.text=manpwr.itemdescptn;
        _hurlyratelbl=(UILabel *)[cell viewWithTag:3];
        _hurlyratelbl.text= [NSString stringWithFormat:@"$%@",manpwr.unitcost];
       
    }
    
      if (tableView==_crewnametable) {
          
          Crewmodel *crewmdl1=(Crewmodel *)[_crewmembersarray objectAtIndex:indexPath.row];
          _crwmanpwrlbl=(UILabel *)[cell viewWithTag:1];
          _crwmanpwrlbl.text=crewmdl1.manpower;
          _crwdeslbl1=(UILabel *)[cell viewWithTag:2];
          _crwdeslbl1.text=crewmdl1.mandescptn;
          _crwdeslbl2=(UILabel *)[cell viewWithTag:3];
          
       
          _crwdeslbl2.text=[_revcrewdict objectForKey:crewmdl1.crewname];


      }
    return cell;
}
#pragma mark UITableViewDelegate methods
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle==UITableViewCellEditingStyleDelete) {
        Deletepath=indexPath.row;
        
        if (tableView==_crewnametable) {
            [self Crewdelete];
           // [_crewmembersarray removeObject:indexPath];
            
        }
        
    }
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //alternating cell back ground color
    if(tableView==_crewnametable||tableView==_manpwrtable)
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


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (tableView==_popOverTableView) {
        switch (poptype) {
            case 1:
              
                [_servicebtnlbl setTitle:[_skillarray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
                 [self CrewManPowerSelect];
                break;
            case 2:
             
                 [_crewbtnlbl setTitle:[_crenamearray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
                [self Selectcrewname];
                break;

            default:
                break;
        }
        
        [self.popOverController dismissPopoverAnimated:YES];
        
        
        
    }

    
}


- (void)searchAutocompleteEntriesWithSubstring:(NSString *)substring {
    
    // Put anything that starts with this substring into the autocompleteUrls array
    // The items in this array is what will show up in the table view
    [_autocompltearray removeAllObjects];
    for(NSString * curString in _crenamearray) {
        NSRange substringRange = [curString rangeOfString:substring];
        if (substringRange.location == 0) {
            
            [_autocompltearray addObject:curString];
            
        }
           }
    if ([_autocompltearray count]==0) {
        _autocompleteTableView.hidden=YES;
    }
    [_autocompleteTableView reloadData];
}

#pragma mark -
#pragma mark UIGestureRecognizer

- (void)handlePanning:(UIPanGestureRecognizer *)gestureRecognizer
{
    switch ([gestureRecognizer state]) {
        case UIGestureRecognizerStateBegan:
            [self startDragging:gestureRecognizer];
            break;
        case UIGestureRecognizerStateChanged:
            [self doDrag:gestureRecognizer];
            break;
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateFailed:
            [self stopDragging:gestureRecognizer];
            break;
        default:
            break;
    }
}
#pragma mark -
#pragma mark Helper methods for initialization

- (void)setupSourceTableWithFrame:(CGRect)frame
{
    
    [self.touchview addSubview:_manpwrtable];
}

- (void)setupDestinationTableWithFrame:(CGRect)frame
{
    
    CGRect dropAreaFrame = frame;
    dropAreaFrame.origin.y = kNavBarHeight;
    dropAreaFrame.size.height -= kNavBarHeight;
    
    dropArea = [[UIView alloc] initWithFrame:CGRectMake(540, 30, 460, 700)];
    [dropArea setBackgroundColor:[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f]];
    [self.touchview addSubview:dropArea];
    
    CGRect contentFrame = dropAreaFrame;
    contentFrame.origin = CGPointMake(0, 0);
    
    UILabel* dropAreaLabel = [[UILabel alloc] initWithFrame:contentFrame];
    dropAreaLabel.backgroundColor = [UIColor clearColor];
    dropAreaLabel.font = [UIFont boldSystemFontOfSize:12];
    dropAreaLabel.textAlignment = NSTextAlignmentCenter;
    dropAreaLabel.textColor = [UIColor whiteColor];
    // dropAreaLabel.text = @"Drop items here...";
    [dropArea addSubview:dropAreaLabel];
    
    [dropArea addSubview:_crewnametable];
  
}

- (void)initDraggedCellWithCell:(UITableViewCell*)cell AtPoint:(CGPoint)point
{
    NSIndexPath* indexPath = [_manpwrtable indexPathForRowAtPoint:point];
    //UITableViewCell* cell = [_subtypetable cellForRowAtIndexPath:indexPath];
    // get rid of old cell, if it wasn't disposed already
    if(draggedCell != nil)
    {
        [draggedCell removeFromSuperview];
        // [draggedCell release];
        draggedCell = nil;
    }
    
    CGRect frame = CGRectMake(point.x, point.y, cell.frame.size.width-5, cell.frame.size.height-10);
    
    draggedCell = [[UITableViewCell alloc] init];
    draggedCell.selectionStyle = UITableViewCellSelectionStyleGray;
    Manpwr*manmdl1=(Manpwr *)[_manpwrarray objectAtIndex:indexPath.row];
    draggedCell.textLabel.text =manmdl1.itemcode;
    draggedCell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12];
    
    draggedCell.textLabel.textColor = cell.textLabel.textColor;
    draggedCell.highlighted = YES;
    draggedCell.frame = frame;
    draggedCell.alpha = 0.8;
    
    [self.touchview addSubview:draggedCell];
}


#pragma mark Helper methods for dragging

- (void)startDragging:(UIPanGestureRecognizer *)gestureRecognizer
{
    
    
    CGPoint pointInSrc = [gestureRecognizer locationInView:_manpwrtable];
    CGPoint pointInDst = [gestureRecognizer locationInView:_crewnametable];
    
    if([_manpwrtable pointInside:pointInSrc withEvent:nil])
    {
        [self startDraggingFromSrcAtPoint:pointInSrc];
        dragFromSource = YES;
    }
    else if([_crewnametable pointInside:pointInDst withEvent:nil])
    {
        //[self startDraggingFromDstAtPoint:pointInDst];
        dragFromSource = NO;
    }
    
}

- (void)startDraggingFromSrcAtPoint:(CGPoint)point{

    if ([_crewbtnlbl.titleLabel.text isEqualToString:@"Select"]) {
        
        UIAlertView*alert=[[UIAlertView alloc]initWithTitle:nil message:@"Please select Crew Name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        
    }
    else{

    NSIndexPath* indexPath = [_manpwrtable indexPathForRowAtPoint:point];
    UITableViewCell* cell = [_manpwrtable cellForRowAtIndexPath:indexPath];
    
    if(cell != nil)
    {
        CGPoint origin = cell.frame.origin;
        origin.x += _manpwrtable.frame.origin.x;
        origin.y += _manpwrtable.frame.origin.y;
        
        [self initDraggedCellWithCell:cell AtPoint:origin];
        cell.highlighted = NO;
        
        if(draggedData != nil)
        {
            //[draggedData release];
            draggedData = nil;
        }
        
        crewpath=indexPath.row;
        
        Manpwr*manmdl1=(Manpwr *)[_manpwrarray objectAtIndex:crewpath];
        
        draggedData = manmdl1.itemcode;
        NSLog(@"%@",manmdl1.itemdescptn);
    }
    }
    
}

- (void)startDraggingFromDstAtPoint:(CGPoint)point
{
    
    NSIndexPath* indexPath = [_crewnametable indexPathForRowAtPoint:point];
    UITableViewCell* cell = [_crewnametable cellForRowAtIndexPath:indexPath];
    if(cell != nil)
    {
        CGPoint origin = cell.frame.origin;
        origin.x += dropArea.frame.origin.x;
        origin.y += dropArea.frame.origin.y;
        
        [self initDraggedCellWithCell:cell AtPoint:origin];
        cell.highlighted = NO;
        
        if(draggedData != nil)
        {
            //[draggedData release];
            draggedData = nil;
        }
         Manpwr*manmdl1=(Manpwr *)[_manpwrarray objectAtIndex:indexPath.row];
        draggedData = manmdl1.itemcode;

                       // remove old cell
       [_crewmembersarray removeObjectAtIndex:indexPath.row];
        [_crewnametable deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationMiddle];
        pathFromDstTable = indexPath;
        
        [UIView animateWithDuration:0.2 animations:^
         {
             CGRect frame = _crewnametable.frame;
             //frame.size.height = kCellHeight * [dstData count];
             _crewnametable.frame = frame;
         }];
        
    }
    
    
}

- (void)doDrag:(UIPanGestureRecognizer *)gestureRecognizer
{
    if(draggedCell != nil && draggedData != nil)
    {
        CGPoint translation = [gestureRecognizer translationInView:[draggedCell superview]];
        [draggedCell setCenter:CGPointMake([draggedCell center].x + translation.x,
                                                 [draggedCell center].y + translation.y)];
        [gestureRecognizer setTranslation:CGPointZero inView:[draggedCell superview]];
    }
}

- (void)stopDragging:(UIPanGestureRecognizer *)gestureRecognizer
{
    if(draggedCell != nil && draggedData != nil)
    {
        
        //NSLog(@"%d",[gestureRecognizer state]);
        //NSLog(@"%hhd",[dropArea pointInside:[gestureRecognizer locationInView:dropArea] withEvent:nil]);

        
        if([gestureRecognizer state] == UIGestureRecognizerStateEnded
           && [dropArea pointInside:[gestureRecognizer locationInView:dropArea] withEvent:nil])
        {
            NSIndexPath* indexPath = [_crewnametable indexPathForRowAtPoint:[gestureRecognizer locationInView:_crewnametable]];
            if(indexPath != nil)
            {
                Crewmodel *crewmdl1=(Crewmodel *)[_crewmembersarray objectAtIndex:indexPath.row];
                crewmdl1.manpower=draggedData;
                [_crewmembersarray addObject:crewmdl1];

              //  [_crewmembersarray insertObject:draggedData atIndex:indexPath.row];
                [_crewnametable insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationMiddle];
            }
            else
            {
                if ([_crewmembersarray count]==0) {
                    Crewmodel *crewmdl1=[[Crewmodel alloc]init];
                    crewmdl1.manpower=draggedData;
                    [_crewmembersarray addObject:crewmdl1];
                    
                }
                else{
            Crewmodel *crewmdl1=(Crewmodel *)[_crewmembersarray objectAtIndex:indexPath.row];
                crewmdl1.manpower=draggedData;
                [_crewmembersarray addObject:crewmdl1];
                }
                
                [self crewinsert];
                          }
        }
        else if(!dragFromSource && pathFromDstTable != nil)
        {
            // insert cell back where it came from
            [_crewmembersarray insertObject:draggedData atIndex:pathFromDstTable.row];
            [_crewnametable insertRowsAtIndexPaths:[NSArray arrayWithObject:pathFromDstTable] withRowAnimation:UITableViewRowAnimationMiddle];
            
            //[pathFromDstTable release];
            pathFromDstTable = nil;
        }
        
        [UIView animateWithDuration:0.3 animations:^
         {
             CGRect frame = _crewnametable.frame;
             //frame.size.height = kCellHeight * [_Maintablescflddetailsarray count];
             _crewnametable.frame = frame;
         }];
        
        [draggedCell removeFromSuperview];
        //[draggedCell release];
        draggedCell = nil;
        
        //[draggedData release];
        draggedData = nil;
    }
}


#pragma mark- WebService
-(void)CrewManPowerSelect{
    webpath=1;
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<CrewManPowerSelect xmlns=\"http://test.kontract360.com/\">\n"
                    "<SubType>%@</SubType>\n"
                   "</CrewManPowerSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[_skilldict objectForKey:_servicebtnlbl.titleLabel.text]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
     NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/CrewManPowerSelect" forHTTPHeaderField:@"Soapaction"];
    
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

-(void)CrewSave{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<CrewSave xmlns=\"http://test.kontract360.com/\">\n"
                    "<CrewName>%@</CrewName>\n"
                   "</CrewSave>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_crewnametxtfld.text];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
     NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/CrewSave" forHTTPHeaderField:@"Soapaction"];
    
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

-(void)CrewSetUpSelect{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<CrewSetUpSelect xmlns=\"http://test.kontract360.com/\">\n"
                   
                   "</CrewSetUpSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
     NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/CrewSetUpSelect" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)Selectcrewname{
    
    webpath=2;
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<Selectcrewname xmlns=\"http://test.kontract360.com/\">\n"
                    "<crewname>%@</crewname>\n"
                   "</Selectcrewname>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[_crewdict objectForKey:_crewbtnlbl.titleLabel.text]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
     NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/Selectcrewname" forHTTPHeaderField:@"Soapaction"];
    
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

-(void)crewinsert{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
      Manpwr *manpwr=(Manpwr *)[_manpwrarray objectAtIndex:crewpath];
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<crewinsert xmlns=\"http://test.kontract360.com/\">\n"
                   "<Manpower>%@</Manpower>\n"
                   "<Description>%@</Description>\n"
                   "<Type>%@</Type>\n"
                   "<LeadId>%d</LeadId>\n"
                   "<unitcost>%f</unitcost>\n"
                   "<Name>%@</Name>\n"
                   "<daystype>%d</daystype>\n"
                   "<dayscount>%d</dayscount>\n"
                   "<CrewName>%@</CrewName>\n"
                   "</crewinsert>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",manpwr.itemcode,manpwr.itemdescptn,@"MP",0,[manpwr
                   .unitcost floatValue],@"crewname",0,0,[_crewdict objectForKey:_crewbtnlbl.titleLabel.text]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
     NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/crewinsert" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)Crewdelete{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    Crewmodel *crewmdl1=(Crewmodel *)[_crewmembersarray objectAtIndex:Deletepath];

    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<Crewdelete xmlns=\"http://test.kontract360.com/\">\n"
                   "<ID>%d</ID>\n"
                   "</Crewdelete>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[crewmdl1.ID integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
     NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/Crewdelete" forHTTPHeaderField:@"Soapaction"];
    
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

-(void)AllSkills{
  
    recordResults = FALSE;
    NSString *soapMessage;
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<AllSkills xmlns=\"http://test.kontract360.com/\">\n"
                   
                   "</AllSkills>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
     NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/AllSkills" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)CrewSetUpDelete{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
  //  Crewmodel *crewmdl1=(Crewmodel *)[_crewmembersarray objectAtIndex:path];
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<CrewSetUpDelete xmlns=\"http://test.kontract360.com/\">\n"
                   "<CrewId>%d</CrewId>\n"
                   "</CrewSetUpDelete>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[[_crewdict objectForKey:_crewbtnlbl.titleLabel.text]integerValue ]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
     NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/CrewSetUpDelete" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)AllCrewDelete{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    //  Crewmodel *crewmdl1=(Crewmodel *)[_crewmembersarray objectAtIndex:path];
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<AllCrewDelete xmlns=\"http://test.kontract360.com/\">\n"
                   "<CrewId>%d</CrewId>\n"
                   "</AllCrewDelete>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[[_crewdict objectForKey:_crewbtnlbl.titleLabel.text]integerValue ]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
     NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/AllCrewDelete" forHTTPHeaderField:@"Soapaction"];
    
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
    if (webpath==1) {
          [_manpwrtable reloadData];
        webpath=0;
    }
    
    if (webpath==2) {
        [_crewnametable reloadData];

    }
   // [_autocompleteTableView reloadData];
       [_popOverTableView reloadData];
    }
#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"CrewManPowerSelectResponse"])
    {
        _manpwrarray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"EntryId"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ItemCode"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Description"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"UnitCost"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"SubType"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }


    if([elementName isEqualToString:@"CrewSetUpSelectResponse"])
    {_crenamearray=[[NSMutableArray alloc]init];
        _crewdict=[[NSMutableDictionary alloc]init];
        _revcrewdict=[[NSMutableDictionary alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"CrewId"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;

    }
    if([elementName isEqualToString:@"Crewname"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"SelectcrewnameResponse"])
    {
        _crewmembersarray=[[NSMutableArray alloc]init];
        
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
    if([elementName isEqualToString:@"Manpower"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    

    if([elementName isEqualToString:@"CrDescription"])
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
    if([elementName isEqualToString:@"UnitCost"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"Name"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"CrewName"])
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

    if([elementName isEqualToString:@"AllSkillsResult"])
    {
        _skilldict=[[NSMutableDictionary alloc]init];
        _skillarray=[[NSMutableArray alloc]init];
        //_revskilldict=[[NSMutableDictionary alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"SkillId"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
        
    }
    if([elementName isEqualToString:@"SkillName"])
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
    if([elementName isEqualToString:@"EntryId"])
    {
        _manpwrmdl=[[Manpwr alloc]init];
        
        recordResults = FALSE;
        
        _manpwrmdl.entryid=[_soapResults integerValue];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"ItemCode"])
    {
        
        recordResults = FALSE;
        _manpwrmdl.itemcode=_soapResults;
          [_manpwrarray addObject:_manpwrmdl];
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Description"])
    {
        
        recordResults = FALSE;
        
        _manpwrmdl.itemdescptn=_soapResults;
        NSLog(@"%@",_manpwrmdl.itemdescptn);
        
       
     
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"SubType"])
    {
        
        recordResults = FALSE;
        _manpwrmdl.subtype=_soapResults;
        _soapResults = nil;;
    }

    if([elementName isEqualToString:@"UnitCost"])
    {
        
        recordResults = FALSE;
         _manpwrmdl.unitcost=_soapResults;
        
        
         _soapResults = nil;
    }
    if([elementName isEqualToString:@"CrewId"])
    {
        recordResults =FALSE;
        crewid=_soapResults;
        _soapResults = nil;
        
        
    }

    if([elementName isEqualToString:@"Crewname"])
    {
        
        recordResults = FALSE;
        [_crenamearray addObject:_soapResults];
        [_crewdict setObject:crewid forKey:_soapResults];
        [_revcrewdict setObject:_soapResults forKey:crewid];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"ID"])
    {
        _crewmdl1=[[Crewmodel alloc]init];
        recordResults = FALSE;
        _crewmdl1.ID=_soapResults;
        _soapResults = nil;
    }
        if([elementName isEqualToString:@"Manpower"])
    {
        recordResults = FALSE;
         _crewmdl1.manpower=_soapResults;
    
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"CrDescription"])
    {
        recordResults = FALSE;
        _crewmdl1.mandescptn=_soapResults;
        
        _soapResults = nil;
    }

    
//    if([elementName isEqualToString:@"Description"])
//    {
//        recordResults = FALSE;
//        
//        _soapResults = nil;
//    }
    
    if([elementName isEqualToString:@"Type"])
    {
        
        recordResults = FALSE;
         _crewmdl1.type=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"unitCost"])
    {
        
        recordResults = FALSE;
         _crewmdl1.unitcost=_soapResults;
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"Name"])
    {
        
        recordResults = FALSE;
         _crewmdl1.name=_soapResults;
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"CrewName"])
    {
        
        recordResults = FALSE;
         _crewmdl1.crewname=_soapResults;
        [_crewmembersarray addObject:_crewmdl1];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"result"])
    {
        
        recordResults = FALSE;
        
           if ([_soapResults isEqualToString:@"Deleted CrewSetUp"]) {
               
               [self AllCrewDelete];
               [_crewbtnlbl setTitle:@"Select" forState:UIControlStateNormal];
               
              

           }
       else if ([_soapResults isEqualToString:@"insertcrew"]) {
            
            [self Selectcrewname];
          
            
            
            
        }

        
       else if ([_soapResults isEqualToString:@"Inserted Crew"]||[_soapResults isEqualToString:@"Deleted All Members"]||[_soapResults isEqualToString:@"deletedcrew"]) {
            
            _crewnametxtfld.text=@"";
            [self Selectcrewname];
        }
        else{
            UIAlertView*alert=[[UIAlertView alloc]initWithTitle:nil message:_soapResults delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            
        }
               _soapResults = nil;
    }
    if([elementName isEqualToString:@"SkillId"])
    {
        recordResults = FALSE;
       skill=_soapResults;
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"SkillName"])
    {        recordResults =FALSE;
        
        [_skilldict setObject:skill forKey:_soapResults];
      //  [_revskilldict setObject:_soapResults forKey:skill];
        [_skillarray addObject:_soapResults];
        _soapResults = nil;
        
        
    }
  

}
#pragma mark-buttons

- (IBAction)clsebtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)clearbtn:(id)sender {
        [self CrewSetUpDelete];
    
    
}

- (IBAction)deletebtn:(id)sender {
          if (self.editing) {
            [super setEditing:NO animated:NO];
            [_crewnametable setEditing:NO animated:NO];
            [_crewnametable reloadData];
            
            
            
        }
        
        else{
            [super setEditing:YES animated:YES];
            [_crewnametable setEditing:YES animated:YES];
            [_crewnametable reloadData];
            
            
        }
        
    }

- (IBAction)servicebtn:(id)sender {
    poptype=1;
    [self createpopover];
}

- (IBAction)savebtn:(id)sender {
    [self CrewSave];
}

- (IBAction)crewbtn:(id)sender {
    poptype=2;
    [self createcrewpopover];
     [self CrewSetUpSelect];
}

- (IBAction)alldeletebtn:(id)sender {
    [self AllCrewDelete];
}


@end
