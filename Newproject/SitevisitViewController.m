//
//  SitevisitViewController.m
//  Newproject
//
//  Created by GMSIndia 2 on 13/02/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "SitevisitViewController.h"

@interface SitevisitViewController ()

@end

@implementation SitevisitViewController

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
    
    [[UIToolbar appearance] setTintColor:[UIColor redColor]];
    _prdunratetble.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _prdunratetble.layer.borderWidth=3.0;
    _documenttable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _documenttable.layer.borderWidth=3.0;
  
    _tabletitleview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _jobsitetable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _jobsitetable.layer.borderWidth=3.0;
    _jobsitetitleview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _safteytitleview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _safetytableview.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _safetytableview.layer.borderWidth=3.0;
    _neweqmnttitile.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _newequipmenttable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _newequipmenttable.layer.borderWidth=3.0;
    _worktitleview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _workscdletable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _workscdletable.layer.borderWidth=3.0;
    _meetingtitleview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _meetingtable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _meetingtable.layer.borderWidth=3.0;
    _bidderstitle.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _bidderstable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _bidderstable.layer.borderWidth=3.0;

    _weathertitle.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _weathertable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _weathertable.layer.borderWidth=3.0;

    _notestitle.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _notestable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _notestable.layer.borderWidth=3.0;
    
    _cmpxtyofwrk=[[NSMutableArray alloc]initWithObjects:@"Easy",@"Moderate",@"Difficult", nil];
    
    _gernalbtnlbl.tintColor=[UIColor whiteColor];

    }


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
     _companynametxtfld.text=_companyname;
    [self ListSiteVisitGeneral];
    [self SelectAllItemType];
    
    _gernalbtnlbl.tintColor=[UIColor whiteColor];
    _pratebtnlbl.tintColor=[UIColor blackColor];
    _documntbtnlbl.tintColor=[UIColor blackColor];
    _accesbltybtnlbl.tintColor=[UIColor blackColor];
    _EstggAreabtnlbl.tintColor=[UIColor blackColor];
    _jobsitebtnlbl.tintColor=[UIColor blackColor];
    _saftybtnlbl.tintColor=[UIColor blackColor];
    _equpmntslbl.tintColor=[UIColor blackColor];
    _workbtnlbl.tintColor=[UIColor blackColor];
    _meetingnotesbtnlbl.tintColor=[UIColor blackColor];
    _biddersbtnlbl.tintColor=[UIColor blackColor];
    _weatherbtnlbl.tintColor=[UIColor blackColor];
    _notesbtnlbl.tintColor=[UIColor blackColor];
    

    
    
    _gernalview.hidden=NO;
    _rateview.hidden=YES;
    _docmntview.hidden=YES;
    _accblitytxtview.hidden=YES;
    _equipmentview.hidden=YES;
    _jobsiteview.hidden=YES;
    _safetyview.hidden=YES;
    _neweqmntview.hidden=YES;
    _workschdleview.hidden=YES;
    _meetingview.hidden=YES;
    _biddersview.hidden=YES;
    _weatherview.hidden=YES;
    _notesview.hidden=YES;
    

    
    
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark-webservice
-(void)ListSiteVisitGeneral{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<ListSiteVisitGeneral xmlns=\"http://ios.kontract360.com/\">\n"
                     "<planid>%@</planid>\n"
                   "</ListSiteVisitGeneral>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_companyid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://ios.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/ListSiteVisitGeneral" forHTTPHeaderField:@"Soapaction"];
    
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

-(void)SaveSiteVisitGeneral{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SaveSiteVisitGeneral xmlns=\"http://ios.kontract360.com/\">\n"
                   "<CompanyName>%@</CompanyName>\n"
                   "<Location>%@</Location>\n"
                   "<Zip>%@</Zip>\n"
                   "<Complexity>%@</Complexity>\n"
                   "<FacilityDetails>%@</FacilityDetails>\n"
                   "<ScopeofWork>%@</ScopeofWork>\n"
                   "<Accessibility>%@</Accessibility>\n"
                   "<Equipment>%@</Equipment>\n"
                   "<PlanId>%@</PlanId>\n"
                   "</SaveSiteVisitGeneral>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_companynametxtfld.text,_loctntxtfld.text,_ziptxtfld.text,_complextyofwrkbtnlbl.titleLabel.text,_facilitytxtview.text,_scpeofwrktxtview.text,@"",@"",_companyid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://ios.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/SaveSiteVisitGeneral" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)SaveSiteVisitAccessibility{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SaveSiteVisitAccessibility xmlns=\"http://ios.kontract360.com/\">\n"
                   "<Accessibility>%@</Accessibility>\n"
                   "<PlanId>%@</PlanId>\n"
                   "</SaveSiteVisitAccessibility>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_Accibltylblview.text,_companyid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://ios.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/SaveSiteVisitAccessibility" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)SaveSiteVisitEquipments{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SaveSiteVisitEquipments xmlns=\"http://ios.kontract360.com/\">\n"
                   "<equipment>%@</equipment>\n"
                   "<PlanId>%@</PlanId>\n"
                   "</SaveSiteVisitEquipments>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_equipmnttxtview.text,_companyid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://ios.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/SaveSiteVisitEquipments" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)SitevisitSelectproductionrate{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SitevisitSelectproductionrate xmlns=\"http://ios.kontract360.com/\">\n"
                   "<planid>%@</planid>\n"
                   "</SitevisitSelectproductionrate>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_companyid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://ios.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/SitevisitSelectproductionrate" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)SitevisitSelectjobsitereq{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SitevisitSelectjobsitereq xmlns=\"http://ios.kontract360.com/\">\n"
                   "<planid>%@</planid>\n"
                   "</SitevisitSelectjobsitereq>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_companyid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://ios.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/SitevisitSelectjobsitereq" forHTTPHeaderField:@"Soapaction"];
    
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

-(void)Selectsafetyrulessitevisit{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<Selectsafetyrulessitevisit xmlns=\"http://ios.kontract360.com/\">\n"
                   "<planid>%@</planid>\n"
                   "</Selectsafetyrulessitevisit>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_companyid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://ios.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/Selectsafetyrulessitevisit" forHTTPHeaderField:@"Soapaction"];
    
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
                   
                   "<SelectAllItemType xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</SelectAllItemType>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.1/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://ios.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/SelectAllItemType" forHTTPHeaderField:@"Soapaction"];
    
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

-(void)SitevisitSelectequipment{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SitevisitSelectequipment xmlns=\"http://ios.kontract360.com/\">\n"
                   "<planid>%@</planid>\n"
                   "</SitevisitSelectequipment>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_companyid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://ios.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/SitevisitSelectequipment" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)SitevisitSelectWorkSchedule{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SitevisitSelectWorkSchedule xmlns=\"http://ios.kontract360.com/\">\n"
                   "<planid>%@</planid>\n"
                   "</SitevisitSelectWorkSchedule>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_companyid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://ios.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/SitevisitSelectWorkSchedule" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)SitevisitSelectMeetingNotes{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SitevisitSelectMeetingNotes xmlns=\"http://ios.kontract360.com/\">\n"
                   "<planid>%@</planid>\n"
                   "</SitevisitSelectMeetingNotes>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_companyid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://ios.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/SitevisitSelectMeetingNotes" forHTTPHeaderField:@"Soapaction"];
    
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
    [_prdunratetble reloadData];
    [_jobsitetable reloadData];
    [_safetytableview reloadData];
    [_newequipmenttable reloadData];
    
    
}


#pragma mark-tableview datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView==_popOverTableView) {
        return [_cmpxtyofwrk count];
    }
    else{
          if (tableView==_prdunratetble) {
              return [_productionratearray count];
          }
        
              if (tableView==_jobsitetable) {
                  return [_jobsiteArray count];
              }
        if (tableView==_safetytableview) {
            return [_saftyArray count];
        }
        
        if (tableView==_newequipmenttable) {
            return [_Equpmntarray count];
        }
        


              else{
        return 5;
          }

    }
    
    return YES;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        if (tableView==_prdunratetble) {
             [[NSBundle mainBundle]loadNibNamed:@"Ratecellview" owner:self options:nil];
            
             cell=_ratecell;
        }
        if (tableView==_documenttable) {
                 [[NSBundle mainBundle]loadNibNamed:@"cellfordocumnt" owner:self options:nil];
            
            cell=_docucell;
            
        }

        
        if (tableView==_jobsitetable) {
            [[NSBundle mainBundle]loadNibNamed:@"Jobsitecellview" owner:self options:nil];
            
            cell=_jobsitecell;
            
        }
        
        if (tableView==_safetytableview) {
            [[NSBundle mainBundle]loadNibNamed:@"SaftyCell" owner:self options:nil];
            
            cell=_saftycell;
            
        }
          if (tableView==_newequipmenttable) {
              [[NSBundle mainBundle]loadNibNamed:@"siteEqupmtntcell" owner:self options:nil];
              
              cell=_equmntcell;}


       }
    
    
      if (tableView==_popOverTableView) {
          
           cell.textLabel.text=[_cmpxtyofwrk objectAtIndex:indexPath.row];

      }
    
      if (tableView==_prdunratetble) {
          
          SitevistMdl *sitemdl1=(SitevistMdl *)[_productionratearray objectAtIndex:indexPath.row];
          _ratelbl=(UILabel *)[cell viewWithTag:1];
          _ratelbl.text=sitemdl1.PRRate;
          _ratedeslbl=(UILabel *)[cell viewWithTag:2];
          _ratedeslbl.text=sitemdl1.PRdescptn;
          _ratevaluelbl=(UILabel *)[cell viewWithTag:3];
          _ratevaluelbl.text=sitemdl1.PRvalue;
          
          
          
      }
    if (tableView==_jobsitetable) {
        
        SitevistMdl *sitemdl1=(SitevistMdl *)[_jobsiteArray objectAtIndex:indexPath.row];
        _jobname=(UILabel *)[cell viewWithTag:1];
        _jobname.text=sitemdl1.jobsitname;
        _jobcode=(UILabel *)[cell viewWithTag:2];
        _jobcode.text=sitemdl1.jobcode;
        _jobtype=(UILabel *)[cell viewWithTag:3];
        _jobtype.text=[_JobtypeDict objectForKey:sitemdl1.jobtypeid];
        _jobcost=(UILabel *)[cell viewWithTag:4];
        _jobcost.text=sitemdl1.jobcost;
}
     if (tableView==_safetytableview) {
         
         SitevistMdl *sitemdl1=(SitevistMdl *)[_saftyArray objectAtIndex:indexPath.row];
         _rultitllbl=(UILabel *)[cell viewWithTag:1];
         _rultitllbl.text=sitemdl1.RuleTitle;
         _ruledesptn=(UILabel *)[cell viewWithTag:2];
         _ruledesptn.text=sitemdl1.Ruledesptn;

     }
    
   if (tableView==_newequipmenttable) {
       SitevistMdl *sitemdl1=(SitevistMdl *)[_Equpmntarray objectAtIndex:indexPath.row];
       
       _eqnamelbl=(UILabel *)[cell viewWithTag:1];
       _eqnamelbl.text=sitemdl1.EquipmentNumber;
       _eqdeslbl=(UILabel *)[cell viewWithTag:2];
       _eqdeslbl.text=sitemdl1.equpdescptn;
       _equarealbl=(UILabel *)[cell viewWithTag:3];
       _equarealbl.text=sitemdl1.equparea;
       _equunitlbl=(UILabel *)[cell viewWithTag:4];
       _equunitlbl.text=sitemdl1.equpunit;

       
       
   }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //alternating cell back ground color
    if(tableView==_documenttable||tableView==_prdunratetble)
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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView==_popOverTableView) {
        
        [_complextyofwrkbtnlbl setTitle:[_cmpxtyofwrk objectAtIndex:indexPath.row] forState:UIControlStateNormal];
       
    }
}


#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"ListSiteVisitGeneralResult"])
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
    if([elementName isEqualToString:@"Zip"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Complexity"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"FacilityDetails"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ScopeofWork"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"SaveSiteVisitGeneralResult"])
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
    if([elementName isEqualToString:@"SitevisitSelectproductionrateResult"])
    {
        _productionratearray=[[NSMutableArray alloc]init];
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
      if([elementName isEqualToString:@"proentyId"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"Rate"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"prodesc"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"Value"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    
    if([elementName isEqualToString:@"SitevisitSelectjobsitereqResult"])
    {
        _jobsiteArray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Entryjobsite"])
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
    if([elementName isEqualToString:@"code"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"TypeId"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Cost"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"SelectAllItemTypeResult"])
    {
        _JobtypeDict=[[NSMutableDictionary alloc]init];
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
    
    if([elementName isEqualToString:@"SelectsafetyrulessitevisitResult"])
    {
        _saftyArray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Entryjobsite"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"RuleTitle"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"descsafety"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"SitevisitSelectequipmentResult"])
    {
        _Equpmntarray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Entryequip"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"EquipmentNumber"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Descequip"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Area"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Unit"])
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
  
    if([elementName isEqualToString:@"Location"])
    {
        recordResults = FALSE;
        
        _loctntxtfld.text=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Zip"])
    {  recordResults = FALSE;
        
        _ziptxtfld.text=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Complexity"])
    {
        recordResults = FALSE;
        [_complextyofwrkbtnlbl setTitle:_soapResults forState:UIControlStateNormal];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"FacilityDetails"])
    {
        recordResults = FALSE;
        _facilitytxtview.text=_soapResults;
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"ScopeofWork"])
    {
        recordResults = FALSE;
        _scpeofwrktxtview.text=_soapResults;
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"result"])
    {
       recordResults = FALSE;
        UIAlertView *alertview=[[UIAlertView alloc]initWithTitle:nil message:_soapResults delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [alertview show];
     _soapResults = nil;
    }
    if([elementName isEqualToString:@"proentyId"])
    {
        _sitevistmdl=[[SitevistMdl alloc]init];
        recordResults = FALSE;
        _sitevistmdl.prentryid=_soapResults;
        
        
       _soapResults = nil;
    }

    if([elementName isEqualToString:@"Rate"])
    {
       
        recordResults = FALSE;
        
        _sitevistmdl.PRRate=_soapResults;
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"prodesc"])
    {
        recordResults = FALSE;
        _sitevistmdl.PRdescptn=_soapResults;
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"Value"])
    {
        recordResults = FALSE;
        _sitevistmdl.PRvalue=_soapResults;
        [_productionratearray addObject:_sitevistmdl];
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Entryjobsite"])
    {
           _sitevistmdl=[[SitevistMdl alloc]init];
        recordResults = FALSE;
        _sitevistmdl.jobentryid=_soapResults;
      
        
        _soapResults = nil;
    }

    
    if([elementName isEqualToString:@"Name"])
    {
     
        recordResults = FALSE;
        _sitevistmdl.jobsitname=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"code"])
    {
        recordResults = FALSE;
          _sitevistmdl.jobcode=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"TypeId"])
    {
        recordResults = FALSE;
          _sitevistmdl.jobtypeid=_soapResults;
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Cost"])
    {
        recordResults = FALSE;
          _sitevistmdl.jobcost=_soapResults;
        [_jobsiteArray addObject:_sitevistmdl];
        _soapResults = nil;
    }

    if([elementName isEqualToString:@"entry_id"])
    {
        
        recordResults = FALSE;
        itemid=_soapResults;
        
        _soapResults = nil;
    
    }
    if([elementName isEqualToString:@"itemtypename"])
    {
        recordResults = FALSE;
        [_JobtypeDict setObject:_soapResults forKey:itemid];
        
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"entrysafety"])
    {
        _sitevistmdl=[[SitevistMdl alloc]init];
        recordResults = FALSE;
        _sitevistmdl.ruleentryid=_soapResults;
        _soapResults = nil;
    }

    if([elementName isEqualToString:@"RuleTitle"])
    {
        _sitevistmdl=[[SitevistMdl alloc]init];
        recordResults = FALSE;
        _sitevistmdl.RuleTitle=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"descsafety"])
    {
        recordResults = FALSE;
        _sitevistmdl.Ruledesptn=_soapResults;
        [_saftyArray addObject:_sitevistmdl];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Entryequip"])
    {
        _sitevistmdl=[[SitevistMdl alloc]init];
        recordResults = FALSE;
        _sitevistmdl.equpentryid=_soapResults;
        _soapResults = nil;


    }
    if([elementName isEqualToString:@"EquipmentNumber"])
    {
        recordResults = FALSE;
        _sitevistmdl.EquipmentNumber=_soapResults;
        _soapResults = nil;
    
    
    }
    if([elementName isEqualToString:@"Descequip"])
    {
        recordResults = FALSE;
        _sitevistmdl.equpdescptn=_soapResults;

        _soapResults = nil;
    
    }
    if([elementName isEqualToString:@"Area"])
    {
        recordResults = FALSE;
        _sitevistmdl.equparea=_soapResults;
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"Unit"])
    {
        recordResults = FALSE;
        _sitevistmdl.equpunit=_soapResults;
        [_Equpmntarray addObject:_sitevistmdl];
        
        
        _soapResults = nil;
    
    }


   }

#pragma mark-popovers
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
    
    
    
    
    
    
    [self.popOverController presentPopoverFromRect:_complextyofwrkbtnlbl.frame
                                            inView:self.gernalview
                          permittedArrowDirections:UIPopoverArrowDirectionUp
                                          animated:YES];

    
}

#pragma mark-Barbuttonitems


- (IBAction)generalbtn:(id)sender {
    _gernalbtnlbl.tintColor=[UIColor whiteColor];
    _pratebtnlbl.tintColor=[UIColor blackColor];
    _documntbtnlbl.tintColor=[UIColor blackColor];
    _accesbltybtnlbl.tintColor=[UIColor blackColor];
    _EstggAreabtnlbl.tintColor=[UIColor blackColor];
    _jobsitebtnlbl.tintColor=[UIColor blackColor];
    _saftybtnlbl.tintColor=[UIColor blackColor];
    _equpmntslbl.tintColor=[UIColor blackColor];
    _workbtnlbl.tintColor=[UIColor blackColor];
    _meetingnotesbtnlbl.tintColor=[UIColor blackColor];
    _biddersbtnlbl.tintColor=[UIColor blackColor];
    _weatherbtnlbl.tintColor=[UIColor blackColor];
    _notesbtnlbl.tintColor=[UIColor blackColor];

    _gernalview.hidden=NO;
     _rateview.hidden=YES;
    _docmntview.hidden=YES;
     _accessview.hidden=YES;
    _equipmentview.hidden=YES;
      _jobsiteview.hidden=YES;
    _safetyview.hidden=YES;
   _neweqmntview.hidden=YES;
    _workschdleview.hidden=YES;
    _meetingview.hidden=YES;
    _biddersview.hidden=YES;
    _weatherview.hidden=YES;
    _notesview.hidden=YES;
}

- (IBAction)prductnbtn:(id)sender {
    
    [self SitevisitSelectproductionrate];
    
    _gernalbtnlbl.tintColor=[UIColor blackColor];
    _pratebtnlbl.tintColor=[UIColor whiteColor];
    _documntbtnlbl.tintColor=[UIColor blackColor];
    _accesbltybtnlbl.tintColor=[UIColor blackColor];
    _EstggAreabtnlbl.tintColor=[UIColor blackColor];
    _jobsitebtnlbl.tintColor=[UIColor blackColor];
    _saftybtnlbl.tintColor=[UIColor blackColor];
    _equpmntslbl.tintColor=[UIColor blackColor];
    _workbtnlbl.tintColor=[UIColor blackColor];
    _meetingnotesbtnlbl.tintColor=[UIColor blackColor];
    _biddersbtnlbl.tintColor=[UIColor blackColor];
    _weatherbtnlbl.tintColor=[UIColor blackColor];
    _notesbtnlbl.tintColor=[UIColor blackColor];
    
     _gernalview.hidden=YES;
    _rateview.hidden=NO;
    _docmntview.hidden=YES;
     _accessview.hidden=YES;
    _equipmentview.hidden=YES;
      _jobsiteview.hidden=YES;
    _safetyview.hidden=YES;
   _neweqmntview.hidden=YES;
    _workschdleview.hidden=YES;
    _meetingview.hidden=YES;
    _biddersview.hidden=YES;
    _weatherview.hidden=YES;
    _notesview.hidden=YES;


}

- (IBAction)documntbtn:(id)sender {
    _gernalbtnlbl.tintColor=[UIColor blackColor];
    _pratebtnlbl.tintColor=[UIColor blackColor];
    _documntbtnlbl.tintColor=[UIColor whiteColor];
    _accesbltybtnlbl.tintColor=[UIColor blackColor];
    _EstggAreabtnlbl.tintColor=[UIColor blackColor];
    _jobsitebtnlbl.tintColor=[UIColor blackColor];
    _saftybtnlbl.tintColor=[UIColor blackColor];
    _equpmntslbl.tintColor=[UIColor blackColor];
    _workbtnlbl.tintColor=[UIColor blackColor];
    _meetingnotesbtnlbl.tintColor=[UIColor blackColor];
    _biddersbtnlbl.tintColor=[UIColor blackColor];
    _weatherbtnlbl.tintColor=[UIColor blackColor];
    _notesbtnlbl.tintColor=[UIColor blackColor];

    
    
    _gernalview.hidden=YES;
    _rateview.hidden=YES;
    _docmntview.hidden=NO;
    _accessview.hidden=YES;
    _equipmentview.hidden=YES;
      _jobsiteview.hidden=YES;
    _safetyview.hidden=YES;
       _neweqmntview.hidden=YES;
    _workschdleview.hidden=YES;
    _meetingview.hidden=YES;
    _biddersview.hidden=YES;
    _weatherview.hidden=YES;
    _notesview.hidden=YES;


}

- (IBAction)acceblitybtn:(id)sender {
    
    _gernalbtnlbl.tintColor=[UIColor blackColor];
    _pratebtnlbl.tintColor=[UIColor blackColor];
    _documntbtnlbl.tintColor=[UIColor blackColor];
    _accesbltybtnlbl.tintColor=[UIColor whiteColor];
    _EstggAreabtnlbl.tintColor=[UIColor blackColor];
    _jobsitebtnlbl.tintColor=[UIColor blackColor];
    _saftybtnlbl.tintColor=[UIColor blackColor];
    _equpmntslbl.tintColor=[UIColor blackColor];
    _workbtnlbl.tintColor=[UIColor blackColor];
    _meetingnotesbtnlbl.tintColor=[UIColor blackColor];
    _biddersbtnlbl.tintColor=[UIColor blackColor];
    _weatherbtnlbl.tintColor=[UIColor blackColor];
    _notesbtnlbl.tintColor=[UIColor blackColor];

    _gernalview.hidden=YES;
    _rateview.hidden=YES;
    _docmntview.hidden=YES;
    _accessview.hidden=NO;
      _equipmentview.hidden=YES;
      _jobsiteview.hidden=YES;
    _safetyview.hidden=YES;
       _neweqmntview.hidden=YES;
    _workschdleview.hidden=YES;
    _meetingview.hidden=YES;
    _biddersview.hidden=YES;
    _weatherview.hidden=YES;
    _notesview.hidden=YES;


}

- (IBAction)Equmntstgareabtn:(id)sender {
    
    _gernalbtnlbl.tintColor=[UIColor blackColor];
    _pratebtnlbl.tintColor=[UIColor blackColor];
    _documntbtnlbl.tintColor=[UIColor blackColor];
    _accesbltybtnlbl.tintColor=[UIColor blackColor];
    _EstggAreabtnlbl.tintColor=[UIColor whiteColor];
    _jobsitebtnlbl.tintColor=[UIColor blackColor];
    _saftybtnlbl.tintColor=[UIColor blackColor];
    _equpmntslbl.tintColor=[UIColor blackColor];
    _workbtnlbl.tintColor=[UIColor blackColor];
    _meetingnotesbtnlbl.tintColor=[UIColor blackColor];
    _biddersbtnlbl.tintColor=[UIColor blackColor];
    _weatherbtnlbl.tintColor=[UIColor blackColor];
    _notesbtnlbl.tintColor=[UIColor blackColor];

    
    _gernalview.hidden=YES;
    _rateview.hidden=YES;
    _docmntview.hidden=YES;
    _accessview.hidden=YES;
    _equipmentview.hidden=NO;
     _jobsiteview.hidden=YES;
    _safetyview.hidden=YES;
       _neweqmntview.hidden=YES;
    _workschdleview.hidden=YES;

    _meetingview.hidden=YES;
    _biddersview.hidden=YES;
    _weatherview.hidden=YES;
    _notesview.hidden=YES;


}

- (IBAction)jobsitebtn:(id)sender {
    [self SitevisitSelectjobsitereq];
    
    
    _gernalbtnlbl.tintColor=[UIColor blackColor];
    _pratebtnlbl.tintColor=[UIColor blackColor];
    _documntbtnlbl.tintColor=[UIColor blackColor];
    _accesbltybtnlbl.tintColor=[UIColor blackColor];
    _EstggAreabtnlbl.tintColor=[UIColor blackColor];
    _jobsitebtnlbl.tintColor=[UIColor whiteColor];
    _saftybtnlbl.tintColor=[UIColor blackColor];
    _equpmntslbl.tintColor=[UIColor blackColor];
    _workbtnlbl.tintColor=[UIColor blackColor];
    _meetingnotesbtnlbl.tintColor=[UIColor blackColor];
    _biddersbtnlbl.tintColor=[UIColor blackColor];
    _weatherbtnlbl.tintColor=[UIColor blackColor];
    _notesbtnlbl.tintColor=[UIColor blackColor];

    _gernalview.hidden=YES;
    _rateview.hidden=YES;
    _docmntview.hidden=YES;
    _accessview.hidden=YES;
    _equipmentview.hidden=YES;
    _jobsiteview.hidden=NO;
     _safetyview.hidden=YES;
       _neweqmntview.hidden=YES;
    _workschdleview.hidden=YES;
    _meetingview.hidden=YES;
    _biddersview.hidden=YES;
    _weatherview.hidden=YES;
    _notesview.hidden=YES;

    
}

- (IBAction)safetybtn:(id)sender {
    [self Selectsafetyrulessitevisit];
    
    _gernalbtnlbl.tintColor=[UIColor blackColor];
    _pratebtnlbl.tintColor=[UIColor blackColor];
    _documntbtnlbl.tintColor=[UIColor blackColor];
    _accesbltybtnlbl.tintColor=[UIColor blackColor];
    _EstggAreabtnlbl.tintColor=[UIColor blackColor];
    _jobsitebtnlbl.tintColor=[UIColor blackColor];
    _saftybtnlbl.tintColor=[UIColor whiteColor];
    _equpmntslbl.tintColor=[UIColor blackColor];
    _workbtnlbl.tintColor=[UIColor blackColor];
    _meetingnotesbtnlbl.tintColor=[UIColor blackColor];
    _biddersbtnlbl.tintColor=[UIColor blackColor];
    _weatherbtnlbl.tintColor=[UIColor blackColor];
    _notesbtnlbl.tintColor=[UIColor blackColor];

    _gernalview.hidden=YES;
    _rateview.hidden=YES;
    _docmntview.hidden=YES;
    _accessview.hidden=YES;
    _equipmentview.hidden=YES;
    _jobsiteview.hidden=YES;
    _safetyview.hidden=NO;
       _neweqmntview.hidden=YES;
    _workschdleview.hidden=YES;
    _meetingview.hidden=YES;
    _biddersview.hidden=YES;
    _weatherview.hidden=YES;
    _notesview.hidden=YES;

    
}

- (IBAction)newequipmentbtn:(id)sender {
    [self SitevisitSelectequipment];
    _gernalbtnlbl.tintColor=[UIColor blackColor];
    _pratebtnlbl.tintColor=[UIColor blackColor];
    _documntbtnlbl.tintColor=[UIColor blackColor];
    _accesbltybtnlbl.tintColor=[UIColor blackColor];
    _EstggAreabtnlbl.tintColor=[UIColor blackColor];
    _jobsitebtnlbl.tintColor=[UIColor blackColor];
    _saftybtnlbl.tintColor=[UIColor blackColor];
    _equpmntslbl.tintColor=[UIColor whiteColor];
    _workbtnlbl.tintColor=[UIColor blackColor];
    _meetingnotesbtnlbl.tintColor=[UIColor blackColor];
    _biddersbtnlbl.tintColor=[UIColor blackColor];
    _weatherbtnlbl.tintColor=[UIColor blackColor];
    _notesbtnlbl.tintColor=[UIColor blackColor];

    _gernalview.hidden=YES;
    _rateview.hidden=YES;
    _docmntview.hidden=YES;
    _accessview.hidden=YES;
    _equipmentview.hidden=YES;
    _jobsiteview.hidden=YES;
    _safetyview.hidden=YES;
    
    _neweqmntview.hidden=NO;
      _workschdleview.hidden=YES;
    _meetingview.hidden=YES;
    _biddersview.hidden=YES;
    _weatherview.hidden=YES;
    _notesview.hidden=YES;


    
}

- (IBAction)workschedulebtn:(id)sender {
    [self SitevisitSelectWorkSchedule];
    _gernalbtnlbl.tintColor=[UIColor blackColor];
    _pratebtnlbl.tintColor=[UIColor blackColor];
    _documntbtnlbl.tintColor=[UIColor blackColor];
    _accesbltybtnlbl.tintColor=[UIColor blackColor];
    _EstggAreabtnlbl.tintColor=[UIColor blackColor];
    _jobsitebtnlbl.tintColor=[UIColor blackColor];
    _saftybtnlbl.tintColor=[UIColor blackColor];
    _equpmntslbl.tintColor=[UIColor blackColor];
    _workbtnlbl.tintColor=[UIColor whiteColor];
    _meetingnotesbtnlbl.tintColor=[UIColor blackColor];
    _biddersbtnlbl.tintColor=[UIColor blackColor];
    _weatherbtnlbl.tintColor=[UIColor blackColor];
    _notesbtnlbl.tintColor=[UIColor blackColor];

    _gernalview.hidden=YES;
    _rateview.hidden=YES;
    _docmntview.hidden=YES;
    _accessview.hidden=YES;
    _equipmentview.hidden=YES;
    _jobsiteview.hidden=YES;
    _safetyview.hidden=YES;
    _neweqmntview.hidden=YES;
    _workschdleview.hidden=NO;
    _meetingview.hidden=YES;
    _biddersview.hidden=YES;
    _weatherview.hidden=YES;
    _notesview.hidden=YES;

    

    
}

- (IBAction)meetingnotesbtn:(id)sender {
    [self SitevisitSelectMeetingNotes];
    _gernalbtnlbl.tintColor=[UIColor blackColor];
    _pratebtnlbl.tintColor=[UIColor blackColor];
    _documntbtnlbl.tintColor=[UIColor blackColor];
    _accesbltybtnlbl.tintColor=[UIColor blackColor];
    _EstggAreabtnlbl.tintColor=[UIColor blackColor];
    _jobsitebtnlbl.tintColor=[UIColor blackColor];
    _saftybtnlbl.tintColor=[UIColor blackColor];
    _equpmntslbl.tintColor=[UIColor blackColor];
    _workbtnlbl.tintColor=[UIColor blackColor];
    _meetingnotesbtnlbl.tintColor=[UIColor whiteColor];
    _biddersbtnlbl.tintColor=[UIColor blackColor];
    _weatherbtnlbl.tintColor=[UIColor blackColor];
    _notesbtnlbl.tintColor=[UIColor blackColor];

    _gernalview.hidden=YES;
    _rateview.hidden=YES;
    _docmntview.hidden=YES;
    _accessview.hidden=YES;
    _equipmentview.hidden=YES;
    _jobsiteview.hidden=YES;
    _safetyview.hidden=YES;
    _neweqmntview.hidden=YES;
    _workschdleview.hidden=YES;
    _meetingview.hidden=NO;
    _biddersview.hidden=YES;
    _weatherview.hidden=YES;
    _notesview.hidden=YES;
    


}

- (IBAction)otherbiddersbtn:(id)sender {
    _gernalbtnlbl.tintColor=[UIColor blackColor];
    _pratebtnlbl.tintColor=[UIColor blackColor];
    _documntbtnlbl.tintColor=[UIColor blackColor];
    _accesbltybtnlbl.tintColor=[UIColor blackColor];
    _EstggAreabtnlbl.tintColor=[UIColor blackColor];
    _jobsitebtnlbl.tintColor=[UIColor blackColor];
    _saftybtnlbl.tintColor=[UIColor blackColor];
    _equpmntslbl.tintColor=[UIColor blackColor];
    _workbtnlbl.tintColor=[UIColor blackColor];
    _meetingnotesbtnlbl.tintColor=[UIColor blackColor];
    _biddersbtnlbl.tintColor=[UIColor whiteColor];
    _weatherbtnlbl.tintColor=[UIColor blackColor];
    _notesbtnlbl.tintColor=[UIColor blackColor];

    _gernalview.hidden=YES;
    _rateview.hidden=YES;
    _docmntview.hidden=YES;
    _accessview.hidden=YES;
    _equipmentview.hidden=YES;
    _jobsiteview.hidden=YES;
    _safetyview.hidden=YES;
    _neweqmntview.hidden=YES;
    _workschdleview.hidden=YES;
    _meetingview.hidden=YES;
      _biddersview.hidden=NO;
    _weatherview.hidden=YES;
    _notesview.hidden=YES;

}

- (IBAction)weatheroutlookbtn:(id)sender {
    _gernalbtnlbl.tintColor=[UIColor blackColor];
    _pratebtnlbl.tintColor=[UIColor blackColor];
    _documntbtnlbl.tintColor=[UIColor blackColor];
    _accesbltybtnlbl.tintColor=[UIColor blackColor];
    _EstggAreabtnlbl.tintColor=[UIColor blackColor];
    _jobsitebtnlbl.tintColor=[UIColor blackColor];
    _saftybtnlbl.tintColor=[UIColor blackColor];
    _equpmntslbl.tintColor=[UIColor blackColor];
    _workbtnlbl.tintColor=[UIColor blackColor];
    _meetingnotesbtnlbl.tintColor=[UIColor blackColor];
    _biddersbtnlbl.tintColor=[UIColor blackColor];
    _weatherbtnlbl.tintColor=[UIColor whiteColor];
    _notesbtnlbl.tintColor=[UIColor blackColor];

    _gernalview.hidden=YES;
    _rateview.hidden=YES;
    _docmntview.hidden=YES;
    _accessview.hidden=YES;
    _equipmentview.hidden=YES;
    _jobsiteview.hidden=YES;
    _safetyview.hidden=YES;
    _neweqmntview.hidden=YES;
    _workschdleview.hidden=YES;
    _meetingview.hidden=YES;
    _biddersview.hidden=YES;

    _weatherview.hidden=NO;
    _notesview.hidden=YES;

}

- (IBAction)notesbtn:(id)sender {
    
    _gernalbtnlbl.tintColor=[UIColor blackColor];
    _pratebtnlbl.tintColor=[UIColor blackColor];
    _documntbtnlbl.tintColor=[UIColor blackColor];
    _accesbltybtnlbl.tintColor=[UIColor blackColor];
    _EstggAreabtnlbl.tintColor=[UIColor blackColor];
    _jobsitebtnlbl.tintColor=[UIColor blackColor];
    _saftybtnlbl.tintColor=[UIColor blackColor];
    _equpmntslbl.tintColor=[UIColor blackColor];
    _workbtnlbl.tintColor=[UIColor blackColor];
    _meetingnotesbtnlbl.tintColor=[UIColor blackColor];
    _biddersbtnlbl.tintColor=[UIColor blackColor];
    _weatherbtnlbl.tintColor=[UIColor blackColor];
    _notesbtnlbl.tintColor=[UIColor whiteColor];

    _gernalview.hidden=YES;
    _rateview.hidden=YES;
    _docmntview.hidden=YES;
    _accessview.hidden=YES;
    _equipmentview.hidden=YES;
    _jobsiteview.hidden=YES;
    _safetyview.hidden=YES;
    _neweqmntview.hidden=YES;
    _workschdleview.hidden=YES;
    _meetingview.hidden=YES;
    _weatherview.hidden=YES;
    _notesview.hidden=NO;
    _biddersview.hidden=YES;



}


#pragma mark-button Actions
- (IBAction)cmpxtyofwrkbtn:(id)sender {
    
    [self createpopover];
    [_popOverTableView reloadData];
    
}

- (IBAction)updatebtn:(id)sender {
    [self SaveSiteVisitGeneral];
    
 
    
}
- (IBAction)ratedeletebtn:(id)sender {
    
    
}


- (IBAction)Rateaddbtn:(id)sender {
    if (!_newrecordVCtrl) {
        self.newrecordVCtrl=[[NewrecordViewController alloc]initWithNibName:@"NewrecordViewController" bundle:nil];
    }
    self.newrecordVCtrl.modalPresentationStyle=UIModalPresentationFormSheet;
    [self presentViewController:_newrecordVCtrl
                       animated:YES completion:NULL];

}

- (IBAction)celleditbtn:(id)sender {
    
    
}
- (IBAction)takepicturebtn:(id)sender {
    
    
}

- (IBAction)upadtepicturebtn:(id)sender {
    
    
}

- (IBAction)docutypebtn:(id)sender {
    
    
}
- (IBAction)accebilityupdate:(id)sender {
    
    [self SaveSiteVisitAccessibility];
    
    
}
- (IBAction)equpmntupdatebtn:(id)sender {
    
    
    [self SaveSiteVisitEquipments];
    
    
}
- (IBAction)addnewjobsite:(id)sender {
    
    if (!_newrecordVCtrl) {
        self.newrecordVCtrl=[[NewrecordViewController alloc]initWithNibName:@"Jobsiterecord" bundle:nil];
    }
    self.newrecordVCtrl.modalPresentationStyle=UIModalPresentationFormSheet;
    [self presentViewController:_newrecordVCtrl
                       animated:YES completion:NULL];

}
- (IBAction)addsafetyrules:(id)sender {
}
- (IBAction)addnewequipment:(id)sender {
}
- (IBAction)addworkscdle:(id)sender {
}
- (IBAction)addmeetgnots:(id)sender {
}
- (IBAction)addbidder:(id)sender {
}
- (IBAction)addweather:(id)sender {
}
- (IBAction)addnotesbtn:(id)sender {
}
-(IBAction)closesitevisit:(id)sender
{
    _companynametxtfld.text=@"";
    _loctntxtfld.text=@"";
    _ziptxtfld.text=@"";
    [_complextyofwrkbtnlbl setTitle:@"Select" forState:UIControlStateNormal];
    _facilitytxtview.text=@"";
    _scpeofwrktxtview.text=@"";
    _Accibltylblview.text=@"";
    _equipmnttxtview.text=@"";
    
    [self dismissViewControllerAnimated:YES completion:NULL];
}

@end
