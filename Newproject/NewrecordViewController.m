//
//  NewrecordViewController.m
//  Newproject
//
//  Created by GMSIndia1 on 2/19/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "NewrecordViewController.h"

@interface NewrecordViewController ()

@end

@implementation NewrecordViewController
@synthesize delegate;

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
    if (_viewtype==4) {
        _meetgdetailslbl.text=_details;
        [_datebtnlbl setTitle:_datendtime forState:UIControlStateNormal];
        [_notedatebtnlbl setTitle:_displaydate forState:UIControlStateNormal];
        _notestxtfld.text=_displaynote;
        _drawmeetingbtn.hidden=YES;
        _drawnotebtn.hidden=YES;
        _cancelmeetingnote.hidden=YES;
        _cancelnotebtn.hidden=YES;
        _updatebtnnote.hidden=YES;
        _updatemmeetingbtn.hidden=YES;
        _datebtnlbl.enabled=NO;
        _notedatebtnlbl.enabled=NO;
        _notestxtfld.editable=NO;
        _meetgdetailslbl.editable=NO;
        
        
    }
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
    [dateFormat setDateFormat:@"MM/dd/YYYY"];
    
    _curntdatestrg= [dateFormat stringFromDate:[NSDate date]];
    
    [_startdatebtnlbl setTitle:_curntdatestrg forState:UIControlStateNormal];
    [_enddatebtnlbl setTitle:_curntdatestrg forState:UIControlStateNormal];
    [_datebtnlbl setTitle:_curntdatestrg forState:UIControlStateNormal];
    [_wethrfrmdatebtnlbl setTitle:_curntdatestrg forState:UIControlStateNormal];
    [_wethrendbtnlbl setTitle:_curntdatestrg forState:UIControlStateNormal];
    [_notedatebtnlbl setTitle:_curntdatestrg forState:UIControlStateNormal];
    
    self.view.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    self.view1.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    self.view2.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    self.view3.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    [[self.meetgdetailslbl layer] setBorderColor:[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor];
    [[self.meetgdetailslbl layer] setBorderWidth:2];
    [[self.meetgdetailslbl layer] setCornerRadius:10];
    [[self.notestxtfld layer] setBorderColor:[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor];
    [[self.notestxtfld layer] setBorderWidth:2];
    [[self.notestxtfld layer] setCornerRadius:10];

    // Do any additional setup after loading the view from its nib.
    
    //_navbar.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark-webservice
-(void)InsertSitevisitProductionRates{
    recordResults = FALSE;
      
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<InsertSitevisitProductionRates xmlns=\"http://test.kontract360.com/\">\n"
                   "<rate>%@</rate>\n"
                   "<description>%@</description>\n"
                   "<value>%f</value>\n"
                   "<planId>%@</planId>\n"
                   "</InsertSitevisitProductionRates>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_ratetxtfld.text,_descptntxtfld.text,[_valuetxtfld.text floatValue],_companyid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
     NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/InsertSitevisitProductionRates" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)SitevisitInsertjobsiterequirements{
    recordResults = FALSE;
    
    NSString *soapMessage;
    NSInteger typeid=[[_JobtypeDic objectForKey:_typeidbtnlbl.titleLabel.text]integerValue];
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SitevisitInsertjobsiterequirements xmlns=\"http://test.kontract360.com/\">\n"
                   "<name>%@</name>\n"
                   "<code>%@</code>\n"
                   "<typeId>%d</typeId>\n"
                   "<cost>%f</cost>\n"
                   "<planId>%@</planId>\n"
                   "</SitevisitInsertjobsiterequirements>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_jobnametxtfld.text,_jobcodetxtfld.text,typeid,[_jobcosttxtfld.text floatValue],_companyid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
     NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/SitevisitInsertjobsiterequirements" forHTTPHeaderField:@"Soapaction"];
    
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

-(void)SitevisitInsertsafetyrules{
    recordResults = FALSE;
    
    NSString *soapMessage;
   
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SitevisitInsertsafetyrules xmlns=\"http://test.kontract360.com/\">\n"
                   "<ruletitle>%@</ruletitle>\n"
                   "<description>%@</description>\n"
                   "<planId>%@</planId>\n"
                   "</SitevisitInsertsafetyrules>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_ruletxtfld.text,_ruldescptn.text,_companyid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
     NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/SitevisitInsertsafetyrules" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)SitevisitInsertequipment{
    recordResults = FALSE;
    
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SitevisitInsertequipment xmlns=\"http://test.kontract360.com/\">\n"
                   "<equipmentnumber>%@</equipmentnumber>\n"
                   "<description>%@</description>\n"
                   "<area>%f</area>\n"
                   "<unit>%@</unit>\n"
                   "<planId>%@</planId>\n"
                   "</SitevisitInsertequipment>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_equpnotxtfld.text,_equpdscptn.text,[_equpareatxtfld.text floatValue],_equnittxtfld.text,_companyid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
     NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/SitevisitInsertequipment" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)SitevisitInsertworkschedule{
    recordResults = FALSE;
    
    NSString *soapMessage;
    
    NSDateFormatter *dateFormat1 = [[NSDateFormatter alloc] init];
    [dateFormat1 setDateFormat:@"MM/dd/yyyy"];
    NSDate *dates = [dateFormat1 dateFromString:_startdatebtnlbl.titleLabel.text];
    NSLog(@"s%@",dates);
    NSDateFormatter *dateFormat2 = [[NSDateFormatter alloc]init];
    [dateFormat2 setDateFormat: @"yyyy-MM-dd"];
    
NSString*    dateString = [dateFormat2 stringFromDate:dates];

    
    NSDateFormatter *dateFormat3 = [[NSDateFormatter alloc] init];
    [dateFormat3 setDateFormat:@"MM/dd/yyyy"];
    NSDate *datesss = [dateFormat1 dateFromString:_enddatebtnlbl.titleLabel.text];
    NSLog(@"s%@",dates);
    NSDateFormatter *dateFormat4 = [[NSDateFormatter alloc]init];
    [dateFormat4 setDateFormat: @"yyyy-MM-dd"];
    
    NSString*    dateString1 = [dateFormat4 stringFromDate:datesss];
    

    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SitevisitInsertworkschedule xmlns=\"http://test.kontract360.com/\">\n"
                   "<Fromdate>%@</Fromdate>\n"
                   "<enddate>%@</enddate>\n"
                   "<description>%@</description>\n"
                   "<planId>%@</planId>\n"
                   "</SitevisitInsertworkschedule>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",dateString, dateString1,_wrkdesctxtfld.text,_companyid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
     NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/SitevisitInsertworkschedule" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)SitevisitInsertmeetingnotes{
    recordResults = FALSE;
    NSString *filename;
    if ([_meetgdetailslbl.text isEqualToString:@""]) {
        
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
 filename = [defaults objectForKey:@"Imagename"];
        
    }
    else{
        
         filename=@"";
    }
        NSInteger typ=0;
    if ([_meetgdetailslbl.text isEqualToString:@""]&&![filename isEqualToString:@""])
    {
        typ=0;
    }
    else if (![_meetgdetailslbl.text isEqualToString:@""]&&[filename isEqualToString:@""])
    {
       typ=1;
    }
    if (_reloadtype==11) {
        filename=@"";
        typ=1;
    }

    NSString *soapMessage;
  
    NSDateFormatter *dateFormat1 = [[NSDateFormatter alloc] init];
    [dateFormat1 setDateFormat:@"MM/dd/yyyy"];
    NSDate *dates = [dateFormat1 dateFromString:_datebtnlbl.titleLabel.text];
    NSLog(@"s%@",dates);
    NSDateFormatter *dateFormat2 = [[NSDateFormatter alloc]init];
    [dateFormat2 setDateFormat: @"yyyy-MM-dd"];
    
    NSString*    dateString = [dateFormat2 stringFromDate:dates];
    _datesstrg=dateString;
    if (_datesstrg.length==0) {
        NSDate *daa=[NSDate date];
        NSLog(@"%@",daa);
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
        [dateFormat setDateFormat:@"yyyy-MM-dd"];
        NSString*curntdate = [dateFormat stringFromDate:daa];
        NSLog(@"%@",curntdate);
        dateString=curntdate;
        
    }
       soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SitevisitInsertmeetingnotes xmlns=\"http://test.kontract360.com/\">\n"
                   "<Datetime>%@</Datetime>\n"
                   "<details>%@</details>\n"
                   "<userId>%d</userId>\n"
                   "<planId>%@</planId>\n"
                   "<FileName>%@</FileName>\n"
                   "<Type>%d</Type>\n"
                   "</SitevisitInsertmeetingnotes>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",   dateString ,_meetgdetailslbl.text,0,_companyid,filename,typ];
    NSLog(@"soapmsg%@",soapMessage);
    
    
   // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
     NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/SitevisitInsertmeetingnotes" forHTTPHeaderField:@"Soapaction"];
    
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

-(void)SitevisitInsertotherbidders{
    recordResults = FALSE;
    
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SitevisitInsertotherbidders xmlns=\"http://test.kontract360.com/\">\n"
                   "<biddername>%@</biddername>\n"
                   "<planId>%@</planId>\n"
                   "</SitevisitInsertotherbidders>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_bidnamelbl.text,_companyid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
     NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/SitevisitInsertotherbidders" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)SitevisitInsertweatheroutlook{
    recordResults = FALSE;
    
    NSString *soapMessage;
    
    NSDateFormatter *dateFormat1 = [[NSDateFormatter alloc] init];
    [dateFormat1 setDateFormat:@"MM/dd/yyyy"];
    NSDate *dates = [dateFormat1 dateFromString:_wethrfrmdatebtnlbl.titleLabel.text];
    NSLog(@"s%@",dates);
    NSDateFormatter *dateFormat2 = [[NSDateFormatter alloc]init];
    [dateFormat2 setDateFormat: @"yyyy-MM-dd"];
    
    NSString*    dateString = [dateFormat2 stringFromDate:dates];
    
    
    NSDateFormatter *dateFormat3 = [[NSDateFormatter alloc] init];
    [dateFormat3 setDateFormat:@"MM/dd/yyyy"];
    NSDate *datesss = [dateFormat1 dateFromString:_wethrendbtnlbl.titleLabel.text];
    NSLog(@"s%@",dates);
    NSDateFormatter *dateFormat4 = [[NSDateFormatter alloc]init];
    [dateFormat4 setDateFormat: @"yyyy-MM-dd"];
    
    NSString*    dateString1 = [dateFormat4 stringFromDate:datesss];
    

    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SitevisitInsertweatheroutlook xmlns=\"http://test.kontract360.com/\">\n"
                   "<WeatherFrom>%@</WeatherFrom>\n"
                   "<WeatherTo>%@</WeatherTo>\n"
                   "<WeatherDescription>%@</WeatherDescription>\n"
                   "<planId>%@</planId>\n"
                   "</SitevisitInsertweatheroutlook>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",   dateString ,dateString1,_wathrcndtnlbl.text,_companyid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
     NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/SitevisitInsertweatheroutlook" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)SitevisitInsertNotes{
    recordResults = FALSE;
    NSString *filename;
    
    if ([_notestxtfld.text isEqualToString:@""]) {
        
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
        filename = [defaults objectForKey:@"Imagename"];
    }
    else{
        filename=@"";
    }
    NSInteger typ=0;
    if ([_notestxtfld.text isEqualToString:@""]&&![filename isEqualToString:@""])
    {
        typ=0;
    }
    else if (![_notestxtfld.text isEqualToString:@""]&&[filename isEqualToString:@""])
    {
        typ=1;
    }
    if(_reloadtype==10)
    {
        filename=@"";
        typ=1;
    }


    NSString *soapMessage;
    
    NSDateFormatter *dateFormat1 = [[NSDateFormatter alloc] init];
    [dateFormat1 setDateFormat:@"MM/dd/yyyy"];
    NSDate *dates = [dateFormat1 dateFromString:_notedatebtnlbl.titleLabel.text];
    NSLog(@"s%@",dates);
    NSDateFormatter *dateFormat2 = [[NSDateFormatter alloc]init];
    [dateFormat2 setDateFormat: @"yyyy-MM-dd"];
    
    NSString*    dateString = [dateFormat2 stringFromDate:dates];
    
    if (dateString.length==0) {
        NSDate *daa=[NSDate date];
        NSLog(@"%@",daa);
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
        [dateFormat setDateFormat:@"yyyy-MM-dd"];
        NSString*curntdate = [dateFormat stringFromDate:daa];
        NSLog(@"%@",curntdate);
        dateString=curntdate;
        
    }

    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SitevisitInsertNotes xmlns=\"http://test.kontract360.com/\">\n"
                   "<NoteDate>%@</NoteDate>\n"
                   "<Notes>%@</Notes>\n"
                   "<UserId>%d</UserId>\n"
                   "<planId>%@</planId>\n"
                   "<DateTime>%@</DateTime>\n"
                   "<FileName>%@</FileName>\n"
                   "<Type>%d</Type>\n"
                    "</SitevisitInsertNotes>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",   dateString ,_notestxtfld.text,0,_companyid,dateString,filename,typ];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
     NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/SitevisitInsertNotes" forHTTPHeaderField:@"Soapaction"];
    
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


-(void)SelectAllItemType{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SelectAllItemType xmlns=\"http://test.kontract360.com/\">\n"
                   
                   "</SelectAllItemType>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    //  NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
     NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/SelectAllItemType" forHTTPHeaderField:@"Soapaction"];
    
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
    UIAlertView *  Alert=[[UIAlertView alloc]initWithTitle:nil message:@"ERROR with the Connection" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    
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
    [_popOverTableView reloadData];
    
}
#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"SelectAllItemTypeResponse"])
    {
        _JobtypeDic=[[NSMutableDictionary alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"entry_id"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"itemtypename"])
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
    if([elementName isEqualToString:@"entry_id"])
    {
        
        recordResults = FALSE;
        jobtypeitm=_soapResults;
        
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"itemtypename"])
    {
        recordResults = FALSE;
        [_JobtypeDic setObject:jobtypeitm forKey:_soapResults];
        
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"result"])
    {
        recordResults = FALSE;
        result=_soapResults;
        UIAlertView *alertview=[[UIAlertView alloc]initWithTitle:nil message:_soapResults delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertview show];
        _soapResults = nil;

    
    }


    
}

#pragma mark-popover
-(void)createpopover{
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 120, 120)];
    
    popoverView.backgroundColor = [UIColor whiteColor];
    _popOverTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 120, 120)];
    
    _popOverTableView.delegate=(id)self;
    _popOverTableView.dataSource=(id)self;
    _popOverTableView.rowHeight= 32;
    _popOverTableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    
    
    // CGRect rect = frame;
    [popoverView addSubview:_popOverTableView];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(120, 120);
    
    //create a popover controller
    
    self.popOverController = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    
    //
    //    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    //    CGRect rect=CGRectMake(cell.bounds.origin.x+90, cell.bounds.origin.y+10, 50, 30);
    //    [self.popOverController presentPopoverFromRect:_disclsurelbl.bounds inView:self.view permittedArrowDirections:nil animated:YES];
    
    
    
    
    
    
    [self.popOverController presentPopoverFromRect:_typeidbtnlbl.frame
                                            inView:self.view
                          permittedArrowDirections:UIPopoverArrowDirectionUp
                                          animated:YES];
    

}
#pragma mark-Tableview Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
     if (tableView==_popOverTableView) {
        return [_JobtypeDic count];
    }
    return YES;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.textLabel.font = [UIFont fontWithName:@"Helvetica Neue Light" size:12];
        cell.textLabel.font=[UIFont systemFontOfSize:12];
    }
    
    if (tableView==_popOverTableView){
        NSArray *array1=[_JobtypeDic allKeys];
        cell.textLabel.text=[array1 objectAtIndex:indexPath.row];
        
    }
           return cell;
}

#pragma mark-Tableview Datasource
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
       if (tableView==_popOverTableView){
            NSArray *array1=[_JobtypeDic allKeys];
           [_typeidbtnlbl setTitle:[array1 objectAtIndex:indexPath.row] forState:UIControlStateNormal];
      
       }
    [self.popOverController dismissPopoverAnimated:YES];

    

}

#pragma mark-Alertview Delegate
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if ([alertView.message isEqualToString:@"Invalid Cost"]) {
        _jobcosttxtfld.text=@"";
        
        
    }
    if ([alertView.message isEqualToString:@"Invalid Value"]) {
        _valuetxtfld.text=@"";
        
        
    }
    if ([alertView.message isEqualToString:@"Invalid Rate"]) {
        _ratetxtfld.text=@"";
        
        
    }
    if ([alertView.message isEqualToString:@"Invalid Area"]) {
        _equpareatxtfld.text=@"";
        
        
    }
    if ([alertView.message isEqualToString:@"From date should be less than or equal to end date"]) {
        [_startdatebtnlbl setTitle:_curntdatestrg forState:UIControlStateNormal];
        [_enddatebtnlbl setTitle:_curntdatestrg forState:UIControlStateNormal];
        
    }
    if ([alertView.message isEqualToString:@"Weather from date should be less than or equal to Weather to date"]) {
        [_wethrfrmdatebtnlbl setTitle:_curntdatestrg forState:UIControlStateNormal];
        [_wethrendbtnlbl setTitle:_curntdatestrg forState:UIControlStateNormal];

        
    }

    
  
//    [_datebtnlbl setTitle:@"Select" forState:UIControlStateNormal];
//    _meetgdetailslbl.text=@"";
//    _ratetxtfld.text=@"";
//    _descptntxtfld.text=@"";
//    _valuetxtfld.text=@"";
//    _jobnametxtfld.text=@"";
//    _jobcodetxtfld.text=@"";
//    _jobcosttxtfld.text=@"";
//    [_typeidbtnlbl setTitle:@"Select" forState:UIControlStateNormal];
//
//    _ruletxtfld.text=@"";
//    _ruldescptn.text=@"";
//_equpnotxtfld.text=@"";
//    _equpareatxtfld.text=@"";
//    _equpdscptn.text=@"";
//    _equnittxtfld.text=@"";
//    [_startdatebtnlbl  setTitle:@"Select" forState:UIControlStateNormal];
//    [_enddatebtnlbl  setTitle:@"Select" forState:UIControlStateNormal];
//    
//    _wrkdesctxtfld.text=@"";
//     _bidnamelbl.text=@"";
//    [_wethrfrmdatebtnlbl  setTitle:@"Select" forState:UIControlStateNormal];
//    [_wethrendbtnlbl  setTitle:@"Select" forState:UIControlStateNormal];
//    
//    _wathrcndtnlbl.text=@"";
//    [_notedatebtnlbl  setTitle:@"Select" forState:UIControlStateNormal];
//    _notestxtfld.text=@"";
    if ([alertView.message isEqualToString:result]) {
        [_datebtnlbl setTitle:@"Select" forState:UIControlStateNormal];
        _meetgdetailslbl.text=@"";
        _ratetxtfld.text=@"";
        _descptntxtfld.text=@"";
        _valuetxtfld.text=@"";
        _jobnametxtfld.text=@"";
        _jobcodetxtfld.text=@"";
        _jobcosttxtfld.text=@"";
        [_typeidbtnlbl setTitle:@"Select" forState:UIControlStateNormal];
        
        _ruletxtfld.text=@"";
        _ruldescptn.text=@"";
        _equpnotxtfld.text=@"";
        _equpareatxtfld.text=@"";
        _equpdscptn.text=@"";
        _equnittxtfld.text=@"";
        [_startdatebtnlbl  setTitle:@"Select" forState:UIControlStateNormal];
        [_enddatebtnlbl  setTitle:@"Select" forState:UIControlStateNormal];
        
        _wrkdesctxtfld.text=@"";
        _bidnamelbl.text=@"";
        [_wethrfrmdatebtnlbl  setTitle:@"Select" forState:UIControlStateNormal];
        [_wethrendbtnlbl  setTitle:@"Select" forState:UIControlStateNormal];
        
        _wathrcndtnlbl.text=@"";
        [_notedatebtnlbl  setTitle:@"Select" forState:UIControlStateNormal];
        _notestxtfld.text=@"";

    if ([self.delegate respondsToSelector:@selector(toreloadatable)]) {
        [self.delegate toreloadatable];
        
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    }
    

}

#pragma mark - Calendar
-(void)createCalenderPopover
{
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 315, 330)];
    
    popoverView.backgroundColor = [UIColor lightTextColor];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(315, 330);
    
    CKCalendarView *calendar = [[CKCalendarView alloc] initWithStartDay:startMonday];
    self.calendar = calendar;
    calendar.delegate =(id) self;
    
    
    NSDate *date = [NSDate date];
    
    // format it
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
    [dateFormat setDateFormat:@"dd/MM/YYYY"];
    
    // convert it to a string
    NSString *dateString = [dateFormat stringFromDate:date];
    //NSLog(@"datestring%@",dateString);
    
    self.dateFormatter = [[NSDateFormatter alloc] init];
    [self.dateFormatter setDateFormat:@"dd/MM/yyyy"];
    
    calendar.selectedDate = [self.dateFormatter dateFromString:dateString];
    
    calendar.minimumDate = [self.dateFormatter dateFromString:@"09/07/2011"];
    calendar.maximumDate = [self.dateFormatter dateFromString:@"1/07/2019"];
    calendar.shouldFillCalendar = YES;
    calendar.adaptHeightToNumberOfWeeksInMonth = NO;
    
    calendar.frame = CGRectMake(10, 10, 300, 320);
    [popoverView addSubview:calendar];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(localeDidChange) name:NSCurrentLocaleDidChangeNotification object:nil];
    
    
    //create a popover controller
    self.popOverController = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    if (istr==1) {

    [self.popOverController presentPopoverFromRect:_startdatebtnlbl.frame
                                            inView:self.view
                          permittedArrowDirections:UIPopoverArrowDirectionUp
                                          animated:YES];
    }
    if (istr==2) {
        [self.popOverController presentPopoverFromRect:_enddatebtnlbl.frame
                                                inView:self.view
                              permittedArrowDirections:UIPopoverArrowDirectionUp
                                              animated:YES];

    }

    if (istr==3) {
        [self.popOverController presentPopoverFromRect:_datebtnlbl.frame
                                                inView:self.view
                              permittedArrowDirections:UIPopoverArrowDirectionUp
                                              animated:YES];
        
    }
    if (istr==4) {
        [self.popOverController presentPopoverFromRect:_wethrfrmdatebtnlbl.frame
                                                inView:self.view
                              permittedArrowDirections:UIPopoverArrowDirectionUp
                                              animated:YES];
        
    }
    
    if (istr==5) {
        [self.popOverController presentPopoverFromRect:_wethrendbtnlbl.frame
                                                inView:self.view
                              permittedArrowDirections:UIPopoverArrowDirectionUp
                                              animated:YES];
        
    }
    
    if (istr==6) {
        [self.popOverController presentPopoverFromRect:_notedatebtnlbl.frame
                                                inView:self.view
                              permittedArrowDirections:UIPopoverArrowDirectionUp
                                              animated:YES];
        
    }
    


}



- (void)localeDidChange {
    [self.calendar setLocale:[NSLocale currentLocale]];
}



#pragma mark - CKCalendarDelegate

- (void)calendar:(CKCalendarView *)calendar didSelectDate:(NSDate *)date {
    if (istr==1) {
        
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
    [dateFormat setDateFormat:@"MM/dd/YYYY"];
    
    NSString *dateString = [dateFormat stringFromDate:date];
    [_startdatebtnlbl setTitle:dateString forState:UIControlStateNormal];
    
    }
    if (istr==2) {
        
        
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
        [dateFormat setDateFormat:@"MM/dd/YYYY"];
        
        NSString *dateString = [dateFormat stringFromDate:date];
        [_enddatebtnlbl setTitle:dateString forState:UIControlStateNormal];
    }
    if (istr==3) {
        
        
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
        [dateFormat setDateFormat:@"MM/dd/YYYY"];
        
        NSString *dateString = [dateFormat stringFromDate:date];
        [_datebtnlbl setTitle:dateString forState:UIControlStateNormal];
    }
    if (istr==4) {
        
        
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
        [dateFormat setDateFormat:@"MM/dd/YYYY"];
        
        NSString *dateString = [dateFormat stringFromDate:date];
        [_wethrfrmdatebtnlbl setTitle:dateString forState:UIControlStateNormal];
    }

    if (istr==5) {
        
        
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
        [dateFormat setDateFormat:@"MM/dd/YYYY"];
        
        NSString *dateString = [dateFormat stringFromDate:date];
        [_wethrendbtnlbl setTitle:dateString forState:UIControlStateNormal];
    }
    if (istr==6) {
        
        
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
        [dateFormat setDateFormat:@"MM/dd/YYYY"];
        
        NSString *dateString = [dateFormat stringFromDate:date];
        [_notedatebtnlbl setTitle:dateString forState:UIControlStateNormal];
    }


}

#pragma mark-Button Action

- (IBAction)clsebtn:(id)sender {
     if ([self.delegate respondsToSelector:@selector(toreloadatable)]) {
          [self.delegate toreloadatable];
         
          [self dismissViewControllerAnimated:YES completion:nil];
    }
   }
- (IBAction)updatepratebtn:(id)sender {
    _reloadtype=1;
   
        Validation*val=[[Validation alloc]init];
        int value1=[val isNumeric:_ratetxtfld.text];
        int value2=[val isNumeric:_valuetxtfld.text];
        if(value1==0)
        {
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid Rate" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert1 show];
            
            
        }
        
    


      else if(value2==0)
        {
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid Value" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert1 show];
            
            
        }
        
    

  else if ([_ratetxtfld.text isEqualToString:@""]) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Rate is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    
    else
    {
    [self InsertSitevisitProductionRates];
    }
}

- (IBAction)pratecancel:(id)sender {
    _ratetxtfld.text=@"";
    _descptntxtfld.text=@"";
    _valuetxtfld.text=@"";
    
    
}
- (IBAction)typeidbtn:(id)sender {
    [self createpopover];
    [self SelectAllItemType];
}

- (IBAction)jobupdatebtn:(id)sender {
    _reloadtype=2;
    if ([_jobnametxtfld.text isEqualToString:@""]) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Name is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else
    {

    [self SitevisitInsertjobsiterequirements];
    }
}

- (IBAction)cancelbtn:(id)sender {
    _jobnametxtfld.text=@"";
    _jobcodetxtfld.text=@"";
    _jobcosttxtfld.text=@"";
    [_typeidbtnlbl setTitle:@"Select" forState:UIControlStateNormal];
    
    
}
- (IBAction)ruleupdte:(id)sender {
    _reloadtype=3;
    if ([_ruletxtfld.text isEqualToString:@""]) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Rule is Required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else
    {
        [self SitevisitInsertsafetyrules];
    }

    
}

- (IBAction)rulecancel:(id)sender {
    
    _ruletxtfld.text=@"";
    _ruldescptn.text=@"";
}
- (IBAction)equupdtebtn:(id)sender {
    _reloadtype=4;
    if ([_equpnotxtfld.text isEqualToString:@""]) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Equipment Number is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else
    {
    [self SitevisitInsertequipment];
    }
}

- (IBAction)equcancelbtn:(id)sender {
    _equpnotxtfld.text=@"";
    _equpareatxtfld.text=@"";
    _equpdscptn.text=@"";
    _equnittxtfld.text=@"";
    
}
- (IBAction)startdatebtn:(id)sender {
    istr=1;
    [self createCalenderPopover];
}
- (IBAction)enddatebtn:(id)sender {
    istr=2;
    [self createCalenderPopover];
}

- (IBAction)wrkupdtebtn:(id)sender {
    _reloadtype=5;
    if ([_startdatebtnlbl.titleLabel.text  compare:_enddatebtnlbl.titleLabel.text] == NSOrderedDescending){
        
        
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"From date should be less than or equal to end date" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else if([_wrkdesctxtfld.text isEqualToString:@""])
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Description is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else{
        
        [self SitevisitInsertworkschedule];
          }

    
}

- (IBAction)wrkschdlecancel:(id)sender {
    [_startdatebtnlbl setTitle:_curntdatestrg forState:UIControlStateNormal];
    [_enddatebtnlbl setTitle:_curntdatestrg forState:UIControlStateNormal];
    _wrkdesctxtfld.text=@"";
   
}
- (IBAction)datebtn:(id)sender {
    istr=3;
    [self createCalenderPopover];
}
- (IBAction)meetgupdatebt:(id)sender {
    _reloadtype=11;
    if ([_meetgdetailslbl.text isEqualToString:@""]) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Detail is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else
    {
    [self SitevisitInsertmeetingnotes];
    }
}

- (IBAction)meetgcancelbtn:(id)sender {
    
    [_datebtnlbl setTitle:_curntdatestrg forState:UIControlStateNormal];
    _meetgdetailslbl.text=@"";
    
}
- (IBAction)bidupdatebtn:(id)sender {
    _reloadtype=7;
    if ([_bidnamelbl.text isEqualToString:@""]) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Bidder Name is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else
    {
    [self SitevisitInsertotherbidders];
    }
}

- (IBAction)bidcancelbtn:(id)sender {
    _bidnamelbl.text=@"";
}
- (IBAction)wetherfrmbtn:(id)sender {
     istr=4;
     [self createCalenderPopover];
}

- (IBAction)weathrtodatebtn:(id)sender {
     istr=5;
     [self createCalenderPopover];
}

- (IBAction)wethrupdatebtn:(id)sender {
    _reloadtype=8;
    if ([_wethrfrmdatebtnlbl.titleLabel.text  compare:_wethrendbtnlbl.titleLabel.text] == NSOrderedDescending){
        
        
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Weather from date should be less than or equal to Weather to date" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else if([_wathrcndtnlbl.text isEqualToString:@""])
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Weather Description is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else{

    [self SitevisitInsertweatheroutlook];
    }
}

- (IBAction)weathrcancelbtn:(id)sender {
    [_wethrfrmdatebtnlbl setTitle:_curntdatestrg forState:UIControlStateNormal];
    [_wethrendbtnlbl setTitle:_curntdatestrg forState:UIControlStateNormal];
    
     _wathrcndtnlbl.text=@"";
}
- (IBAction)notedatebtn:(id)sender {
   

     istr=6;
     [self createCalenderPopover];
}
- (IBAction)notesupdatebtn:(id)sender {
     _reloadtype=10;
    if ([_notestxtfld.text isEqualToString:@""]) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Notes is required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else
    {
    [self SitevisitInsertNotes];
    }
}

- (IBAction)notescancelbtn:(id)sender {
    [_notedatebtnlbl  setTitle:_curntdatestrg forState:UIControlStateNormal];
    _notestxtfld.text=@"";
   
}

- (IBAction)drawactn:(id)sender {
   
    
    
    self.drwVCtrl=[[DrawingViewController alloc]initWithNibName:@"DrawingViewController" bundle:nil];
    [self dateconversion];
    _drwVCtrl.tabtype=_tabtype;
    _drwVCtrl.datestrg=_datesstrg;
      _drwVCtrl.planid=_companyid;
     _drwVCtrl.newdelegate=self;
    _drwVCtrl.modalPresentationStyle=UIModalPresentationPageSheet;
    _drwVCtrl.modalTransitionStyle=UIModalTransitionStyleCoverVertical;
    [self presentViewController:_drwVCtrl
                       animated:YES completion:NULL];

}

- (IBAction)drawnotesactn:(id)sender {
   
        self.drwVCtrl=[[DrawingViewController alloc]initWithNibName:@"DrawingViewController" bundle:nil];
    [self notesdateconversion];

    _drwVCtrl.tabtype=_tabtype;
    _drwVCtrl.datestrg=_datesstrg;
    _drwVCtrl.planid=_companyid;
    _drwVCtrl.newdelegate=self;
    _drwVCtrl.modalPresentationStyle=UIModalPresentationPageSheet;
    _drwVCtrl.modalTransitionStyle=UIModalTransitionStyleCoverVertical;
    [self presentViewController:_drwVCtrl
                       animated:YES completion:NULL];
}


-(void)dateconversion{
    NSDateFormatter *dateFormat1 = [[NSDateFormatter alloc] init];
    [dateFormat1 setDateFormat:@"MM/dd/yyyy"];
    NSDate *dates = [dateFormat1 dateFromString:_datebtnlbl.titleLabel.text];
    NSLog(@"s%@",dates);
    NSDateFormatter *dateFormat2 = [[NSDateFormatter alloc]init];
    [dateFormat2 setDateFormat: @"yyyy-MM-dd"];
    
    NSString*    dateString = [dateFormat2 stringFromDate:dates];
    _datesstrg=dateString;

}
-(void)notesdateconversion{
    NSDateFormatter *dateFormat1 = [[NSDateFormatter alloc] init];
    [dateFormat1 setDateFormat:@"MM/dd/yyyy"];
    NSDate *dates = [dateFormat1 dateFromString:_notedatebtnlbl.titleLabel.text];
    NSLog(@"s%@",dates);
    NSDateFormatter *dateFormat2 = [[NSDateFormatter alloc]init];
    [dateFormat2 setDateFormat: @"yyyy-MM-dd"];
    
    NSString*    dateString = [dateFormat2 stringFromDate:dates];
    _datesstrg=dateString;
    
}
-(void) updatingtables{
    if (_tabtype==3) {
         _reloadtype=6;
        [self SitevisitInsertmeetingnotes];
        
    }
    else if (_tabtype==4){
         _reloadtype=9;
        [self SitevisitInsertNotes];
    }
   
    
}
#pragma mark-textfld delegates
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    if(textField==_ratetxtfld)
    {
        NSUInteger newLength = [_ratetxtfld.text length] + [string length] - range.length;
        return (newLength > 20) ? NO : YES;
    }
    if(textField==_valuetxtfld)
    {
        NSUInteger newLength = [_valuetxtfld.text length] + [string length] - range.length;
        return (newLength > 20) ? NO : YES;
    }
    if(textField==_jobcosttxtfld)
    {
        NSUInteger newLength = [_jobcosttxtfld.text length] + [string length] - range.length;
        return (newLength > 50) ? NO : YES;
    }
    if(textField==_ruletxtfld)
    {
        NSUInteger newLength = [_ruletxtfld.text length] + [string length] - range.length;
        return (newLength > 50) ? NO : YES;
    }
    if(textField==_equpareatxtfld)
    {
        NSUInteger newLength = [_equpareatxtfld.text length] + [string length] - range.length;
        return (newLength > 18) ? NO : YES;
    }
    if(textField==_equnittxtfld)
    {
        NSUInteger newLength = [_equnittxtfld.text length] + [string length] - range.length;
        return (newLength > 50) ? NO : YES;
    }
    if(textField==_equpnotxtfld)
    {
        NSUInteger newLength = [_equpnotxtfld.text length] + [string length] - range.length;
        return (newLength > 50) ? NO : YES;
    }


    return YES;
    
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if(textField==_ratetxtfld)
    {
        Validation*val=[[Validation alloc]init];
        int value1=[val isNumeric:_ratetxtfld.text];
        if(value1==0)
        {
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid Rate" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert1 show];
            
            
        }
        
    }
    if(textField==_valuetxtfld)
    {
        Validation*val=[[Validation alloc]init];
        int value1=[val isNumeric:_valuetxtfld.text];
        if(value1==0)
        {
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid Value" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert1 show];
            
            
        }
        
    }
    if(textField==_jobcosttxtfld)
    {
        Validation*val=[[Validation alloc]init];
        int value1=[val isNumeric:_jobcosttxtfld.text];
        if(value1==0)
        {
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid Cost" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert1 show];
            
            
        }
        
    }
    if(textField==_equpareatxtfld)
    {
        Validation*val=[[Validation alloc]init];
        int value1=[val isNumeric:_equpareatxtfld.text];
        if(value1==0)
        {
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid Area" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert1 show];
            
            
        }
        
    }


    
    
}


@end
