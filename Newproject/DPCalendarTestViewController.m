//
//  DPCalendarTestViewController.m
//  DPCalendar
//
//  Created by Ethan Fang on 19/12/13.
//  Copyright (c) 2013 Ethan Fang. All rights reserved.
//

#import "DPCalendarTestViewController.h"
#import "DPCalendarMonthlySingleMonthViewLayout.h"

#import "DPCalendarMonthlyView.h"
#import "DPCalendarEvent.h"
#import "DPCalendarIconEvent.h"
#import "NSDate+DP.h"
#import "DPCalendarTestOptionsViewController.h"
#import "DPCalendarTestCreateEventViewController.h"

@interface DPCalendarTestViewController ()<DPCalendarMonthlyViewDelegate>

@property (nonatomic, strong) UILabel *monthLabel;
@property (nonatomic, strong) UIButton *previousButton;
@property (nonatomic, strong) UIButton *nextButton;
@property (nonatomic, strong) UIButton *todayButton;
@property (nonatomic, strong) UIButton *createEventButton;
@property (nonatomic, strong) UIButton *optionsButton;

@property (nonatomic, strong) NSArray *events;
@property (nonatomic, strong) NSArray *iconEvents;

@property (nonatomic, strong) DPCalendarMonthlyView *monthlyView;

@end

@implementation DPCalendarTestViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self commonInit];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self commonInit];
    }
    return self;
}

-(void) commonInit {
    [self generateMonthlyView];
    [self updateLabelWithMonth:self.monthlyView.seletedMonth];
  
}

- (void) generateMonthlyView {
    CGFloat width = self.view.bounds.size.height;
    CGFloat height = self.view.bounds.size.width;
    
    [self.previousButton removeFromSuperview];
    [self.nextButton removeFromSuperview];
    [self.monthLabel removeFromSuperview];
    [self.todayButton removeFromSuperview];
    [self.optionsButton removeFromSuperview];
    [self.createEventButton removeFromSuperview];
    
    self.previousButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.nextButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.todayButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.optionsButton  = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.createEventButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.previousButton.frame = CGRectMake(0, 20, 100, 20);
    self.nextButton.frame = CGRectMake(width - 50, 20, 50, 20);
    self.todayButton.frame = CGRectMake(width - 50 * 2, 20, 50, 20);
    self.optionsButton.frame = CGRectMake(width - 50 * 3, 20, 50, 20);
    self.createEventButton.frame = CGRectMake(width - 50 * 5, 20, 100, 20);
    [self.previousButton setTitle:@"Previous" forState:UIControlStateNormal];
    [self.nextButton setTitle:@"Next" forState:UIControlStateNormal];
    //[self.todayButton setTitle:@"Today" forState:UIControlStateNormal];
    //[self.optionsButton setTitle:@"Option" forState:UIControlStateNormal];
    [self.createEventButton setTitle:@"DONE" forState:UIControlStateNormal];
    
    
    self.monthLabel = [[UILabel alloc] initWithFrame:CGRectMake((width - 200) / 2, 20, 200, 20)];
    [self.monthLabel setTextAlignment:NSTextAlignmentCenter];
    
    [self.previousButton addTarget:self action:@selector(previousButtonSelected:) forControlEvents:UIControlEventTouchUpInside];
    [self.nextButton addTarget:self action:@selector(nextButtonSelected:) forControlEvents:UIControlEventTouchUpInside];
    [self.todayButton addTarget:self action:@selector(todayButtonSelected:) forControlEvents:UIControlEventTouchUpInside];
    [self.optionsButton addTarget:self action:@selector(optionsButtonSelected:) forControlEvents:UIControlEventTouchUpInside];
    [self.createEventButton addTarget:self action:@selector(createEventButtonSelected:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.view addSubview:self.monthLabel];
    [self.view addSubview:self.previousButton];
    [self.view addSubview:self.nextButton];
    [self.view addSubview:self.todayButton];
    [self.view addSubview:self.optionsButton];
    [self.view addSubview:self.createEventButton];
    [self.monthlyView removeFromSuperview];
    self.monthlyView = [[DPCalendarMonthlyView alloc] initWithFrame:CGRectMake(0, 45, width, height - 45) delegate:self];
    [self.view addSubview:self.monthlyView];
}

- (void) updateData {
    NSMutableArray *events = @[].mutableCopy;
    NSMutableArray *iconEvents = @[].mutableCopy;
    
    
    NSDate *date = [[NSDate date] dateByAddingYears:0 months:0 days:0];
    NSLog(@"%@",date);
 
    
    
       for (int i = 0; i < [_datearray count]; i++) {
           NSDate *date1 = [NSDate date];
           NSUInteger componentFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit;
           NSDateComponents *components = [[NSCalendar currentCalendar] components:componentFlags fromDate:date1];
           NSInteger year1 = [components year];
           NSInteger month1 = [components month];
           NSInteger day1 = [components day];
           NSArray*newdate=[[_datearray objectAtIndex:i]componentsSeparatedByString:@"-"];
           NSInteger year2=[[newdate objectAtIndex:0]integerValue];
           NSInteger month2=[[newdate objectAtIndex:1]integerValue];
        NSInteger day2=[[newdate objectAtIndex:2]integerValue];

           
           
            NSInteger year=year1-year2;
           NSInteger month=month1-month2;
           NSInteger day=day1-day2;
           
           if (year1>year2) {
               year=-1*year;
           }
           if (month1>month2) {
               month=-1*month;
           }
           if (day1>day2) {
               day=-1*day;
           }

           NSDate*eventdate=[date dateByAddingYears:year months:month days:day];
           
           
           if ([_previousdate isEqualToDate:eventdate]) {
               
           }
           
           else{
                [_eventdatearray addObject:eventdate];
           }
           _previousdate=eventdate;
          
            // NSDateComponents *components = [[NSCalendar currentCalendar] components:componentFlags fromDate:date1];
           
           
       }
    
    //UIImage *icon = [UIImage imageNamed:@"IconPubHol"];
    //UIImage *greyIcon = [UIImage imageNamed:@"IconDateGrey"];
    //NSArray*datearray=[[NSArray alloc]initWithObjects:[date dateByAddingYears:0 months:0 days:1],[date dateByAddingYears:0 months:0 days:4],[date dateByAddingYears:0 months:0 days:3] ,nil];
    
    //NSArray *titles = @[@"Manpower", @"Materials", @"ThirdParty",@"Consumbles",@"Third party"];
    
    for (int i = 0; i < [_eventdatearray count]; i++) {
        for (int x=0; x<[_titlearray count]; x++) {
            
        
            int index = x;
            DPCalendarEvent *event = [[DPCalendarEvent alloc] initWithTitle:[_titlearray objectAtIndex:index] startTime:[_eventdatearray objectAtIndex:i] endTime:[_eventdatearray objectAtIndex:i]  colorIndex:index];
            [events addObject:event];
        }
        
//        if (arc4random() % 2 > 0) {
//            DPCalendarIconEvent *iconEvent = [[DPCalendarIconEvent alloc] initWithStartTime:date endTime:date icon:icon];
//            [iconEvents addObject:iconEvent];
//            
//            
//            iconEvent = [[DPCalendarIconEvent alloc] initWithTitle:[NSString stringWithFormat:@"%d", i] startTime:date endTime:date icon:greyIcon bkgColorIndex:1];
//            [iconEvents addObject:iconEvent];
//        }
        
        date = [date dateByAddingYears:0 months:0 days:1];
    }
    
    [self.monthlyView setEvents:events complete:nil];
   // [self.monthlyView setIconEvents:iconEvents complete:nil];
}

-(void) previousButtonSelected:(id)button {
    [self.monthlyView scrollToPreviousMonthWithComplete:nil];
}

-(void) nextButtonSelected:(id)button {
    [self.monthlyView scrollToNextMonthWithComplete:nil];
}

-(void) todayButtonSelected:(id)button {
    [self.monthlyView clickDate:[NSDate date]];
}

-(void) optionsButtonSelected:(id)button {
    DPCalendarTestOptionsViewController *optionController = [DPCalendarTestOptionsViewController new];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:optionController];
    navController.modalPresentationStyle = UIModalPresentationFormSheet;
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn setTitle:@"TEST" forState:UIControlStateNormal];
    rightBtn.frame = CGRectMake(0, 0, 70, 40 );
    UIBarButtonItem *rightBarBtn = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    navController.navigationItem.rightBarButtonItem = rightBarBtn;
    if (IDIOM == IPAD) {
        [self presentViewController:navController animated:YES completion:nil];
    } else {
        
    }
}

- (void) createEventButtonSelected:(id)button {
    [self dismissViewControllerAnimated:YES completion:nil];
//    DPCalendarTestCreateEventViewController *createEventController = [DPCalendarTestCreateEventViewController new];
//    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:createEventController];
//    navController.modalPresentationStyle = UIModalPresentationFormSheet;
//    
//    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    [rightBtn setTitle:@"Done" forState:UIControlStateNormal];
//    rightBtn.frame = CGRectMake(0, 0, 70, 40 );
//    UIBarButtonItem *rightBarBtn = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
//    navController.navigationItem.rightBarButtonItem = rightBarBtn;
//    if (IDIOM == IPAD) {
//        [self presentViewController:navController animated:YES completion:nil];
//    } else {
//        
//    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self updateLabelWithMonth:self.monthlyView.seletedMonth];
    [self CalenderSelect];
    _eventdatearray=[[NSMutableArray alloc]init];
   }

- (void) updateLabelWithMonth:(NSDate *)month {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MMMM YYYY"];
    NSString *stringFromDate = [formatter stringFromDate:month];
    [self.monthLabel setText:stringFromDate];
}

#pragma DPCalendarMonthlyViewDelegate
-(void)didScrollToMonth:(NSDate *)month firstDate:(NSDate *)firstDate lastDate:(NSDate *)lastDate{
    [self updateLabelWithMonth:month];
}

-(BOOL)shouldHighlightItemWithDate:(NSDate *)date {
    return YES;
}

-(BOOL)shouldSelectItemWithDate:(NSDate *)date {
    return YES;
}

-(void)didSelectItemWithDate:(NSDate *)date {
    
    if (!self.calctrl) {
        self.calctrl=[[CalEventDetailViewController alloc]initWithNibName:@"CalEventDetailViewController" bundle:nil];
    }
    [self presentViewController:_calctrl
                       animated:YES completion:NULL];
    

//    UIActionSheet *popup = [[UIActionSheet alloc] initWithTitle:@"Select options:" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:
//                            @"Manpower",
//                            @"Material",
//                            @"Equipment",
//                          
//                        nil];
//    popup.tag = 1;
//    [popup showInView:[UIApplication sharedApplication].keyWindow];
//    
//    
//    NSLog(@"Select date %@", date);
    
}


- (void)actionSheet:(UIActionSheet *)popup clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    switch (popup.tag) {
        case 1: {
            switch (buttonIndex) {
                case 0:
                    NSLog(@"Manpower");
                    break;
                case 1:
                     NSLog(@"Material");
                    break;
                case 2:
                  NSLog(@"Equipment");
                    break;
                    default:
                    break;
            }
            break;
        }
        default:
            break;
    }
}
-(NSDictionary *) ipadMonthlyViewAttributes {
    return @{
             DPCalendarMonthlyViewAttributeCellRowHeight: @23,
//             DPCalendarMonthlyViewAttributeEventDrawingStyle: [NSNumber numberWithInt:DPCalendarMonthlyViewEventDrawingStyleUnderline],
             
             DPCalendarMonthlyViewAttributeWeekdayFont: [UIFont systemFontOfSize:18],
             DPCalendarMonthlyViewAttributeDayFont: [UIFont systemFontOfSize:14],
             DPCalendarMonthlyViewAttributeEventFont: [UIFont systemFontOfSize:14],
             DPCalendarMonthlyViewAttributeMonthRows:@5,
             DPCalendarMonthlyViewAttributeIconEventBkgColors: @[[UIColor clearColor], [UIColor colorWithRed:239/255.f green:239/255.f blue:244/255.f alpha:1]]
             };
}

-(NSDictionary *) iphoneMonthlyViewAttributes {
    return @{
             DPCalendarMonthlyViewAttributeEventDrawingStyle: [NSNumber numberWithInt:DPCalendarMonthlyViewEventDrawingStyleUnderline],
             DPCalendarMonthlyViewAttributeCellNotInSameMonthSelectable: @YES,
             DPCalendarMonthlyViewAttributeMonthRows:@3
             };
    
}

-(BOOL)shouldAutorotate {
    return NO;
}


-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    [self commonInit];
}

-(NSDictionary *)monthlyViewAttributes {
    if (IDIOM == IPAD) {
        return [self ipadMonthlyViewAttributes];
    } else {
        return [self iphoneMonthlyViewAttributes];
    }
}
#pragma mark-webservice

-(void)CalenderSelect{
    recordResults = FALSE;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString*estmtn = [defaults objectForKey:@"Estimationid"];

    NSString *soapMessage;
 
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<CalenderSelect xmlns=\"http://ios.kontract360.com/\">\n"
                    "<LeadID>%d</LeadID>\n"
                   "</CalenderSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[estmtn integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.100/service.asmx"];;
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/CalenderSelect" forHTTPHeaderField:@"Soapaction"];
    
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
    [self updateData];
    
}
#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"CalenderSelectResponse"])
    {
        _datearray=[[NSMutableArray alloc]init];
        _titlearray=[[NSMutableArray alloc]init];
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Start"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"end1"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Title"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"sum1"])
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
    
      if([elementName isEqualToString:@"Start"])
    {
        
        recordResults = FALSE;
        NSArray*array=[_soapresults componentsSeparatedByString:@"T"];
        NSString*new=[array objectAtIndex:0];
        [_datearray addObject:new];
        _soapresults = nil;

    }
    
    if([elementName isEqualToString:@"end1"])
    {
        
        recordResults = FALSE;
        _soapresults = nil;

    }
    if([elementName isEqualToString:@"Title"])
    {
        
        recordResults = FALSE;
      
        NSArray*array=[_soapresults componentsSeparatedByString:@" "];
        NSString*newtitile=[array objectAtIndex:0];
        if ([newtitile isEqualToString:@"Manpower"]||[newtitile isEqualToString:@"Equipment"]||[newtitile isEqualToString:@"Material"]||[newtitile isEqualToString:@"Consumbles"]) {
            newtitile=@"Cost";
            }
        
        if ([previoustitle isEqualToString:@"Cost"]) {
            
            
        }
        else{
              [_titlearray addObject:newtitile];
        }
        
      
        
        previoustitle=newtitile;
        
        _soapresults = nil;

    }
    if([elementName isEqualToString:@"sum1"])
    {
        
        recordResults = FALSE;
        _soapresults = nil;

    }

}

@end
