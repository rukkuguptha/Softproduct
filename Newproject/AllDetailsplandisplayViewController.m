//
//  AllDetailsplandisplayViewController.m
//  Newproject
//
//  Created by GMSIndia 2 on 24/02/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "AllDetailsplandisplayViewController.h"
#define kCellHeight 44
#define kNavBarHeight 30
@interface AllDetailsplandisplayViewController ()

@end

@implementation AllDetailsplandisplayViewController

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
    self.subtypetable.layer.borderWidth=3.0;
    self.subtypetable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    self.maintable.layer.borderWidth=3.0;
    self.maintable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    
srcData = [NSMutableArray arrayWithObjects:@"item0", @"item1", @"item2", @"item3", @"item4", nil];
     dstData = [NSMutableArray arrayWithObjects:@"item5", @"item6", nil];
    
    [self setupSourceTableWithFrame:CGRectMake(0, 0, 161,340)];
    [self setupDestinationTableWithFrame:CGRectMake(0, 0, 732, 340)];
    
//    _droptable = [[DroptableViewController alloc] initWithFrame:CGRectMake(100, 100, 600, 500) SourceData:srcData DestinationData:dstData];
//   // [_droptable setSrcTableTitle:@"Bla"];
//    //[_droptable setDstTableTitle:@"Blub"];
//    [[_droptable.view layer] setBorderColor:[[UIColor darkGrayColor] CGColor]];
//    [[_droptable.view layer] setBorderWidth:1];
//    [[_droptable.view layer] setCornerRadius:2];
//    [self.tuchgview addSubview:_droptable.view];
    
    UIPanGestureRecognizer* panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanning:)];
    panGesture.delegate=self;
    [self.tuchgview addGestureRecognizer:panGesture];
    [self ScaffoldingSelectScaffoldsubtype];
    [self Selectcheight];


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark-tableview datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView==_subtypetable) {
        return[_subtypdict count];
        
        
    }
    if (tableView==_maintable) {
        
         return[dstData count];
        
    }
    return YES;

    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
        if (tableView==_subtypetable) {
            [[NSBundle mainBundle]loadNibNamed:@"Subtypecell" owner:self options:nil];
            cell=_subtypecell;
            
        }
        if (tableView==_maintable) {
            [[NSBundle mainBundle]loadNibNamed:@"maintablecell" owner:self options:nil];

            cell=_maintblecell;
        }

        cell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12];

    }
  if (tableView==_subtypetable) {
      //cell.textLabel.text=[srcData objectAtIndex:indexPath.row];
      
      NSArray *newarray=[_subtypdict allKeys];
      _scfldtypesublbl=(UILabel *)[cell viewWithTag:1];
      _scfldtypesublbl.text=[newarray objectAtIndex:indexPath.row];
      
  }
    if (tableView==_maintable) {
        
        //cell.textLabel.text=[dstData objectAtIndex:indexPath.row];
        _scffoldtypemainlbl=(UILabel *)[cell viewWithTag:1];
        _scffoldtypemainlbl.text=[dstData objectAtIndex:indexPath.row];
        _lngtnlbl=(UILabel *)[cell viewWithTag:2];
        _widthlbl=(UILabel *)[cell viewWithTag:3];
        _heihtlbl=(UILabel *)[cell viewWithTag:4];
        _numbrlbl=(UILabel *)[cell viewWithTag:5];
        _manhrslbl=(UILabel *)[cell viewWithTag:6];
        _ercthrslbl=(UILabel *)[cell viewWithTag:7];
        _dismntlehrslbl=(UILabel *)[cell viewWithTag:8];
        
    }
    
   
return cell;
}

-(IBAction)clsebtn:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
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
   
    [self.tuchgview addSubview:_subtypetable];
}

- (void)setupDestinationTableWithFrame:(CGRect)frame
{
    
    CGRect dropAreaFrame = frame;
    dropAreaFrame.origin.y = kNavBarHeight;
    dropAreaFrame.size.height -= kNavBarHeight;
    
    dropArea = [[UIView alloc] initWithFrame:CGRectMake(242, 63, 732, 340)];
    [dropArea setBackgroundColor:[UIColor whiteColor]];
    [self.tuchgview addSubview:dropArea];
    
    CGRect contentFrame = dropAreaFrame;
    contentFrame.origin = CGPointMake(0, 0);
    
    UILabel* dropAreaLabel = [[UILabel alloc] initWithFrame:contentFrame];
    dropAreaLabel.backgroundColor = [UIColor clearColor];
    dropAreaLabel.font = [UIFont boldSystemFontOfSize:12];
    dropAreaLabel.textAlignment = NSTextAlignmentCenter;
    dropAreaLabel.textColor = [UIColor whiteColor];
   // dropAreaLabel.text = @"Drop items here...";
    [dropArea addSubview:dropAreaLabel];

    [dropArea addSubview:_maintable];
}

- (void)initDraggedCellWithCell:(UITableViewCell*)cell AtPoint:(CGPoint)point
{
    // get rid of old cell, if it wasn't disposed already
    if(draggedCell != nil)
    {
        [draggedCell removeFromSuperview];
        // [draggedCell release];
        draggedCell = nil;
    }
    
    CGRect frame = CGRectMake(point.x, point.y, cell.frame.size.width, cell.frame.size.height);
    
    draggedCell = [[UITableViewCell alloc] init];
    draggedCell.selectionStyle = UITableViewCellSelectionStyleGray;
    NSArray *newarray=[_subtypdict allKeys];
    draggedCell.textLabel.text =[newarray objectAtIndex:path];
    draggedCell.textLabel.textColor = cell.textLabel.textColor;
    draggedCell.highlighted = YES;
    draggedCell.frame = frame;
    draggedCell.alpha = 0.8;
    
    [self.tuchgview addSubview:draggedCell];
}


#pragma mark Helper methods for dragging

- (void)startDragging:(UIPanGestureRecognizer *)gestureRecognizer
{
    CGPoint pointInSrc = [gestureRecognizer locationInView:_subtypetable];
    CGPoint pointInDst = [gestureRecognizer locationInView:_maintable];
    
    if([_subtypetable pointInside:pointInSrc withEvent:nil])
    {
        [self startDraggingFromSrcAtPoint:pointInSrc];
        dragFromSource = YES;
    }
    else if([_maintable pointInside:pointInDst withEvent:nil])
    {
        [self startDraggingFromDstAtPoint:pointInDst];
        dragFromSource = NO;
    }
}

- (void)startDraggingFromSrcAtPoint:(CGPoint)point
{
    NSIndexPath* indexPath = [_subtypetable indexPathForRowAtPoint:point];
        UITableViewCell* cell = [_subtypetable cellForRowAtIndexPath:indexPath];
    path=indexPath.row;

    if(cell != nil)
    {
        CGPoint origin = cell.frame.origin;
        origin.x += _subtypetable.frame.origin.x;
        origin.y += _subtypetable.frame.origin.y;
        
        [self initDraggedCellWithCell:cell AtPoint:origin];
        cell.highlighted = NO;
        
        if(draggedData != nil)
        {
            //[draggedData release];
            draggedData = nil;
        }
          NSArray *newarray=[_subtypdict allKeys];
        draggedData = [newarray objectAtIndex:indexPath.row];
    }
}

- (void)startDraggingFromDstAtPoint:(CGPoint)point
{
    NSIndexPath* indexPath = [_maintable indexPathForRowAtPoint:point];
    UITableViewCell* cell = [_maintable cellForRowAtIndexPath:indexPath];
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
        draggedData = [dstData objectAtIndex:indexPath.row];
        
        // remove old cell
        [dstData removeObjectAtIndex:indexPath.row];
        [_maintable deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationMiddle];
        pathFromDstTable = indexPath;
        
        [UIView animateWithDuration:0.2 animations:^
         {
             CGRect frame = _maintable.frame;
             frame.size.height = kCellHeight * [dstData count];
             _maintable.frame = frame;
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
        
        NSLog(@"%d",[gestureRecognizer state]);
     
        if([gestureRecognizer state] == UIGestureRecognizerStateEnded
           && [dropArea pointInside:[gestureRecognizer locationInView:dropArea] withEvent:nil])
        {
            NSIndexPath* indexPath = [_maintable indexPathForRowAtPoint:[gestureRecognizer locationInView:_maintable]];
            if(indexPath != nil)
            {
                [dstData insertObject:draggedData atIndex:indexPath.row];
                [_maintable insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationMiddle];
            }
            else
            {
                [dstData addObject:draggedData];
                
                [self calulatemanhrs];

                [_maintable reloadData];
            }
        }
        else if(!dragFromSource && pathFromDstTable != nil)
        {
            // insert cell back where it came from
            [dstData insertObject:draggedData atIndex:pathFromDstTable.row];
            [_maintable insertRowsAtIndexPaths:[NSArray arrayWithObject:pathFromDstTable] withRowAnimation:UITableViewRowAnimationMiddle];
            
            //[pathFromDstTable release];
            pathFromDstTable = nil;
        }
        
        [UIView animateWithDuration:0.3 animations:^
         {
             CGRect frame = _maintable.frame;
             frame.size.height = kCellHeight * [dstData count];
             _maintable.frame = frame;
         }];
        
        [draggedCell removeFromSuperview];
        //[draggedCell release];
        draggedCell = nil;
        
        //[draggedData release];
        draggedData = nil;
    }
}


#pragma mark-WebService

-(void)Selectcheight{
    recordResults = FALSE;
    NSString *soapMessage;
    _customsccfldmdl=(Customscaffoldingplan *)[_Scafldarry objectAtIndex:path];
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<Selectcheight xmlns=\"http://ios.kontract360.com/\">\n"
                   "<ht>%d</ht>\n"
                   "</Selectcheight>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[_customsccfldmdl.elevation integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://ios.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/Selectcheight" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)ScaffoldingSelectScaffoldsubtype{
    recordResults = FALSE;
    NSString *soapMessage;
  
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<ScaffoldingSelectScaffoldsubtype xmlns=\"http://ios.kontract360.com/\">\n"
                                 "</ScaffoldingSelectScaffoldsubtype>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://ios.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/ScaffoldingSelectScaffoldsubtype" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)ScaffoldDetailinsert{
    recordResults = FALSE;
    NSString *soapMessage;
    // _sccfldtypemdl=(Scaffoldtypemdl *)[];
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<ScaffoldDetailinsert xmlns=\"http://ios.kontract360.com/\">\n"
                   "<mainscaffid>%d</mainscaffid>\n"
                   "<subscaffid>%d</subscaffid>\n"
                   "<length>%d</length>\n"
                   "<width>%d</width>\n"
                   "<height>%d</height>\n"
                   "<numb>%d</numb>\n"
                   "<ManHours>%f</ManHours>\n"
                   "<ErectHours>%f</ErectHours>\n"
                   "<DismantleHours>%f</DismantleHours>\n"
                   "</ScaffoldDetailinsert>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://ios.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/ScaffoldDetailinsert" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)connection:(NSURLConnection*)connection didReceiveResponse:(NSURLResponse *)response
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
	
	
	if( _xmlparser )
	{
		
	}
	
	_xmlparser = [[NSXMLParser alloc] initWithData: _webData];
	[_xmlparser setDelegate:(id)self];
	[_xmlparser setShouldResolveExternalEntities: YES];
	[_xmlparser parse];
    [_subtypetable reloadData];
       
    
}
#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"ScaffoldingSelectScaffoldsubtypeResult"])
    {
        _subtypdict=[[NSMutableDictionary alloc]init];
       
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"scaffoldsubtypeId"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"scaffoldtypename"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"SelectcheightResult"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"rate"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

}
-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    
    
    
	if( recordResults )
        
	{
        [_soapresults appendString: string];
    }
}
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if([elementName isEqualToString:@"scaffoldsubtypeId"])
    {
        recordResults = FALSE;
        scfldid=_soapresults;
        
        _soapresults = nil;
    }
    
    if([elementName isEqualToString:@"scaffoldtypename"])
    {
        recordResults = FALSE;
        [_subtypdict setObject:scfldid forKey:_soapresults];
        
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"rate"])
    {
        
        recordResults = FALSE;
        chrate=[_soapresults integerValue];
        _soapresults = nil;
    }

}
#pragma mark-Equatn
-(void)calulatemanhrs{
    int iwf;
    int spf;
    int upw;
    if (btntouch%2) {
        iwf=1;
    }
    else{
        iwf=0;
    }
    
    if (chektouch%2) {
        spf=1;
    }
    else{
        spf=0;
    }
    if (ticktouch%2) {
        upw=1;
    }
    else{
        upw=0;
    }
    NSInteger sf=[_sitefctrfld.text integerValue];

    NSInteger result1=(chrate+iwf+spf+upw+1)*sf;
    NSLog(@"re%d",result1);
    
    
    
    
}

- (IBAction)updatebtn:(id)sender {
}

- (IBAction)iwfbtn:(id)sender {
    btntouch++;
    if (btntouch%2) {
        
        [_iwfbtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
     
        
    }
    
    else{
        [_iwfbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        
        
    }

    
}

- (IBAction)spfbtn:(id)sender {
    chektouch ++;
    if (chektouch%2) {
        
        [_spfbtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        
    }
    
    else{
        [_spfbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        
        
    }

}

- (IBAction)upwbtn:(id)sender {
    ticktouch ++;
    if (ticktouch%2) {
        
        [_upwbtnlbl setImage:[UIImage imageNamed:@"cb_mono_on"] forState:UIControlStateNormal];
        
    }
    
    else{
        [_upwbtnlbl setImage:[UIImage imageNamed:@"cb_mono_off"] forState:UIControlStateNormal];
        
              
    }

}
@end
