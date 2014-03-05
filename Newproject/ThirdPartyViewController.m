//
//  ThirdPartyViewController.m
//  Newproject
//
//  Created by GMSIndia1 on 1/1/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "ThirdPartyViewController.h"
#import "SectionHeaderView.h"
#import "Section.h"

@interface ThirdPartyViewController ()
@end
#define DEFAULT_ROW_HEIGHT 78
#define HEADER_HEIGHT 45


@implementation ThirdPartyViewController
@synthesize sectionArray, openSectionIndex;

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
    //_scroll_addview.frame=CGRectMake(0, 0, 619,713);
   // [_scroll_addview setContentSize:CGSizeMake(619,820)];
    _thirdprtyTable.layer.borderWidth = 2.0;
   _thirdprtyTable.layer.borderColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _view1.backgroundColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    /*searchbar*/
    _searchbar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 220, 44)];
 _searchbar.delegate = (id)self;
_searchbar.tintColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    
    self.thirdprtyTable.tableHeaderView =_searchbar;
    
    UISearchDisplayController* searchController = [[UISearchDisplayController alloc] initWithSearchBar:_searchbar contentsController:self];
    searchController.searchResultsDataSource = (id)self;
    searchController.searchResultsDelegate =(id)self;
    searchController.delegate = (id)self;
    _Typearray=[[NSMutableArray alloc]initWithObjects:@"Manpower",@"Equipment",@"Materials",@"Fleet", nil];
    _pictureimgvw.userInteractionEnabled = YES;
    UITapGestureRecognizer *pgr = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self action:@selector(handlePinch:)];
    pgr.delegate = (id)self;
    [_pictureimgvw addGestureRecognizer:pgr];

}
- (void)handlePinch:(UITapGestureRecognizer *)pinchGestureRecognizer
{
    //handle pinch...
    if ([UIImagePickerController isSourceTypeAvailable:
         UIImagePickerControllerSourceTypeCamera])
    {
        
        
        UIImagePickerController *imagePicker =
        [[UIImagePickerController alloc] init];
        imagePicker.delegate =(id) self;
        imagePicker.sourceType =
        UIImagePickerControllerSourceTypeCamera;
        imagePicker.showsCameraControls=YES;
        
        imagePicker.mediaTypes = [NSArray arrayWithObjects:
                                  (NSString *) kUTTypeImage,
                                  nil];
        imagePicker.allowsEditing = NO;
        // imagePicker.cameraCaptureMode=YES;
        [self presentViewController:imagePicker animated:YES completion:nil];
        _newMedia = YES;
    }
}
#pragma mark-ImagePicker
-(void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    // [self.popoverController dismissPopoverAnimated:true];
    NSString *mediaType = [info
                           objectForKey:UIImagePickerControllerMediaType];
    
    
    
    
    if ([mediaType isEqualToString:(NSString *)kUTTypeImage]) {
        UIImage *image = [info
                          objectForKey:UIImagePickerControllerOriginalImage];
        NSLog(@"dict%@",info);
        _pictureimgvw.image=nil;
        
        
        
        _pictureimgvw.image =image;
        [self dismissViewControllerAnimated:YES completion:nil];
        if (_newMedia)
            UIImageWriteToSavedPhotosAlbum(image,
                                           self,
                                           @selector(image:finishedSavingWithError:contextInfo:),
                                           nil);
    }
    
    
    
}

-(void)image:(UIImage *)image
finishedSavingWithError:(NSError *)error
 contextInfo:(void *)contextInfo
{
    if (error) {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle: @"Save failed"
                              message: @"Failed to save image"
                              delegate: nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
        [alert show];
    }
    
    else{
        
        [self dismissViewControllerAnimated:YES completion:nil];
        
    }
}
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    
    
    
    
    if (popvr==1) {
        
    
    
    [self.popOverController presentPopoverFromRect:_suserachbtnlbl.frame
                                            inView:self.addview
                          permittedArrowDirections:UIPopoverArrowDirectionUp
                                          animated:YES];
    
    }
    if (popvr==2) {
        [self.popOverController presentPopoverFromRect:_typesearchlbl.frame
                                                inView:self.addview
                              permittedArrowDirections:UIPopoverArrowDirectionUp
                                              animated:YES];

        
    }
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self SelectAllThirdParty];
}
#pragma mark- WebService
-(void)SelectAllSubtypeThirdParty{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SelectAllSubtypeThirdParty xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</SelectAllSubtypeThirdParty>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://ios.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/SelectAllSubtypeThirdParty" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)SelectAllThirdParty{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SelectAllThirdParty xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</SelectAllThirdParty>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://ios.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/SelectAllThirdParty" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)InsertThirdParty{
    webtype=1;
    recordResults = FALSE;
    NSString*picturelocatn=@"";
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   "<soap:Body>\n"
                   
                   "<InsertThirdParty xmlns=\"http://ios.kontract360.com/\">\n"
                   "<ItemCode>%@</ItemCode>\n"
                    "<unitcost>%f</unitcost>\n"
                    "<Description>%@</Description>\n"
                    "<SubType>%@</SubType>\n"
                    "<PurchaseValue>%f</PurchaseValue>\n"
                   "<SerialNo>%@</SerialNo>\n"
                   "<ManufacturedYear>%d</ManufacturedYear>\n"
                   "<PictureLocation>%@</PictureLocation>\n"
                   "<InsuredValue>%f</InsuredValue>\n"
                   "<HoursUsed>%f</HoursUsed>\n"
                   "<FuelConsumptionPerHour>%f</FuelConsumptionPerHour>\n"
                   "<Condition>%@</Condition>\n"
                   "<HourlyRate>%f</HourlyRate>\n"
                   "<DailyRate>%f</DailyRate>\n"
                   "<ShiftwiseRate>%f</ShiftwiseRate>\n"
                   "<WeeklyRate>%f</WeeklyRate>\n"
                   "<MonthlyRate>%f</MonthlyRate>\n"
                   "<YearlyRate>%f</YearlyRate>\n"
                   "<type>%@</type>\n"
                   "<qtyinstock>%f</qtyinstock>\n"
                   "</InsertThirdParty>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",@"abc",[_unitcsttxtfld.text doubleValue],_destxtfld.text,_subtypetxtfld.text,[_purchasetxtfld.text doubleValue],_serialtxtfld.text,[_manufattxtfld.text integerValue],picturelocatn,[_insuredtxtfld.text doubleValue],[_hurstxtfld.text doubleValue],[_fueltxtfld.text doubleValue],_condtntxtfld.text,[_hurlytxtfld.text doubleValue],[_dailytxtfld.text doubleValue],[_shiftwisetxtfld.text doubleValue],[_weeklytxtfld.text doubleValue],[_monthlytxtfld.text doubleValue],[_yearlytxtfld.text doubleValue],_typetxtfld.text,[_stckinhandtxtdfld.text doubleValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://ios.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/InsertThirdParty" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)UpdateThirdParty {
    webtype=2;
    recordResults = FALSE;
    NSString*picturelocatn=@"";
    NSString *soapMessage;
     NSString*unitcost=[_unitcsttxtfld.text substringFromIndex:1];
    NSString*HourlyRate=[_hurlytxtfld.text substringFromIndex:1];
    NSString*DailyRate=[_dailytxtfld.text substringFromIndex:1];
    NSString*ShiftwiseRate=[_shiftwisetxtfld.text substringFromIndex:1];
    NSString*WeeklyRate=[_weeklytxtfld.text substringFromIndex:1];
    NSString*MonthlyRate=[_monthlytxtfld.text substringFromIndex:1];
    NSString*YearlyRate=[_yearlytxtfld.text substringFromIndex:1];
   Equpmntmdl*Thrdprty=(Equpmntmdl *)[_thirdprtyarray objectAtIndex:path];
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UpdateThirdParty  xmlns=\"http://ios.kontract360.com/\">\n"
                   "<entryid>%d</entryid>\n"
                   "<ItemCode>%@</ItemCode>\n"
                     "<unitcost>%f</unitcost>\n"
                   "<Description>%@</Description>\n"
                   "<SubType>%@</SubType>\n"
                   "<PurchaseValue>%f</PurchaseValue>\n"
                   "<SerialNo>%@</SerialNo>\n"
                   "<ManufacturedYear>%d</ManufacturedYear>\n"
                   "<PictureLocation>%@</PictureLocation>\n"
                   "<InsuredValue>%f</InsuredValue>\n"
                   "<HoursUsed>%f</HoursUsed>\n"
                   "<FuelConsumptionPerHour>%f</FuelConsumptionPerHour>\n"
                   "<Condition>%@</Condition>\n"
                   "<HourlyRate>%f</HourlyRate>\n"
                   "<DailyRate>%f</DailyRate>\n"
                   "<ShiftwiseRate>%f</ShiftwiseRate>\n"
                   "<WeeklyRate>%f</WeeklyRate>\n"
                   "<MonthlyRate>%f</MonthlyRate>\n"
                   "<YearlyRate>%f</YearlyRate>\n"
                   "<type>%@</type>\n"
                   "<qtyinstock>%f</qtyinstock>\n"
                   "</UpdateThirdParty>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",Thrdprty.entryid,_codetxtfld.text,[unitcost doubleValue],_destxtfld.text,_subtypetxtfld.text,[_purchasetxtfld.text doubleValue],_serialtxtfld.text,[_manufattxtfld.text integerValue],picturelocatn,[_insuredtxtfld.text doubleValue],[_hurstxtfld.text doubleValue],[_fueltxtfld.text doubleValue],_condtntxtfld.text,[HourlyRate doubleValue],[DailyRate doubleValue],[ShiftwiseRate doubleValue],[WeeklyRate doubleValue],[MonthlyRate doubleValue],[YearlyRate doubleValue],_typetxtfld.text,[_stckinhandtxtdfld.text doubleValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://ios.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/UpdateThirdParty" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)DeleteThirdParty{
    webtype=3;
    recordResults = FALSE;
    NSString *soapMessage;
    
   Equpmntmdl*eqmdl=(Equpmntmdl *)[_thirdprtyarray objectAtIndex:deltepath];
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<DeleteThirdParty xmlns=\"http://ios.kontract360.com/\">\n"
                   "<entryid>%d</entryid>\n"
                   "</DeleteThirdParty>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",eqmdl.entryid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://ios.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/DeleteThirdParty" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)SearchThirdParty {
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SearchThirdParty  xmlns=\"http://ios.kontract360.com/\">\n"
                   "<searchtext>%@</searchtext>\n"
                   "</SearchThirdParty>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_searchstring];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://ios.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/SearchThirdParty" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)UploadAnyImage{
   
    recordResults = FALSE;
    NSString *soapMessage;
    NSString *imagename;
    
    imagename=[NSString stringWithFormat:@"Photo_%@.jpg",_codetxtfld.text];
    
    //NSString *imagename=[NSString stringWithFormat:@"Newimage.jpg"];
    NSString *type=@"ThirdParty";
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UploadAnyImage xmlns=\"http://ios.kontract360.com/\">\n"
                   "<f>%@</f>\n"
                   "<fileName>%@</fileName>\n"
                   "<type>%@</type>\n"
                   "<itemcode>%@</itemcode>\n"
                   "</UploadAnyImage>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_encodedString,imagename,type,_codetxtfld.text];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://ios.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/UploadAnyImage" forHTTPHeaderField:@"Soapaction"];
    
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

-(void)FetchAnyImage{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    //NSString *imagename=[NSString stringWithFormat:@"Photo_%@.png",_codetxtfld.text];
    NSString *type=@"ThirdParty";
    
    //Equpmntmdl*eqmdl=(Equpmntmdl *)[_Assetarray objectAtIndex:path];
    //NSString*filename=eqmdl.PictureLocation;
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<FetchAnyImage xmlns=\"http://ios.kontract360.com/\">\n"
                   "<filename>%@</filename>\n"
                   "<type1>%@</type1>\n"
                   "</FetchAnyImage>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_uplodpiclctn,type];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://ios.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/FetchAnyImage" forHTTPHeaderField:@"Soapaction"];
    
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
    if (webtype==1||webtype==2||webtype==3) {
        [self SelectAllThirdParty];
        webtype=0;
    }
    [_thirdprtyTable reloadData];
    [_popOverTableView reloadData];
    
    
}

#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    
    
    if([elementName isEqualToString:@"SelectAllSubtypeThirdPartyResult"])
    {
        _subtypearray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"subtype"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"SelectAllThirdPartyResult"])
    {
        _thirdprtyarray=[[NSMutableArray alloc]init];
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
    
    if([elementName isEqualToString:@"SubType"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"PurchaseValue"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"SerialNo"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"ManufacturedYear"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"PictureLocation"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"InsuredValue"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"HoursUsed"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"FuelConsumptionPerHour"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    
    if([elementName isEqualToString:@"Condition"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"HourlyRate"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"DailyRate"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }               
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ShiftwiseRate"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"WeeklyRate"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"MonthlyRate"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"YearlyRate"])
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
    if([elementName isEqualToString:@"qtyinstock"])
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

    if([elementName isEqualToString:@"SearchThirdPartyResponse"])
    {
        _thirdprtyarray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"UpdateThirdPartyResult"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    

    
    if([elementName isEqualToString:@"InsertThirdPartyResult"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"UploadAnyImageResult"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"url"])
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
    if([elementName isEqualToString:@"subtype"])
    {
        
        
        recordResults = FALSE;
        [_subtypearray addObject:_soapResults];
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"EntryId"])
    {
        
        _thirdpartymdl=[[Equpmntmdl alloc]init];
        recordResults = FALSE;
        
    _thirdpartymdl.entryid=[_soapResults integerValue];
        
        _soapResults = nil;    }
    if([elementName isEqualToString:@"ItemCode"])
    {
        
        recordResults = FALSE;
    _thirdpartymdl.itemcode=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Description"])
    {
        
        recordResults = FALSE;
   _thirdpartymdl.itemdescptn=_soapResults;
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"SubType"])
    {
        
        recordResults = FALSE;
    _thirdpartymdl.subtype=_soapResults;
        
        _soapResults = nil;    }
    
    if([elementName isEqualToString:@"PurchaseValue"])
    {
        
        recordResults = FALSE;
      _thirdpartymdl.PurchaseValue=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"SerialNo"])
    {
        
        recordResults = FALSE;
  _thirdpartymdl.SerialNo=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"ManufacturedYear"])
    {
        
        recordResults = FALSE;
     _thirdpartymdl.ManufacturedYear=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"PictureLocation"])
    {
        
        recordResults = FALSE;
       _thirdpartymdl.PictureLocation=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"InsuredValue"])
    {
        
        recordResults = FALSE;
       _thirdpartymdl.InsuredValue=_soapResults;
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"HoursUsed"])
    {
        
        recordResults = FALSE;
       _thirdpartymdl.HoursUsed=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"FuelConsumptionPerHour"])
    {
        
        recordResults = FALSE;
    _thirdpartymdl.FuelConsumptionPerHour=_soapResults;
        _soapResults = nil;
    }
    
    
    if([elementName isEqualToString:@"Condition"])
    {
        
        recordResults = FALSE;
     _thirdpartymdl.Condition=_soapResults;
        _soapResults = nil;    }
    
    if([elementName isEqualToString:@"HourlyRate"])
    {
        
        recordResults = FALSE;
     _thirdpartymdl.HourlyRate=_soapResults;
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"DailyRate"])
    {
        
        recordResults = FALSE;
      _thirdpartymdl.DailyRate=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"ShiftwiseRate"])
    {
        
        recordResults = FALSE;
      _thirdpartymdl.ShiftwiseRate=_soapResults;
        _soapResults = nil;
        
    }
    
    if([elementName isEqualToString:@"WeeklyRate"])
    {
        
        recordResults = FALSE;
      _thirdpartymdl.WeeklyRate=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"MonthlyRate"])
    {
        
        recordResults = FALSE;
      _thirdpartymdl.MonthlyRate=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"YearlyRate"])
    {
        
        recordResults = FALSE;
     _thirdpartymdl.YearlyRate=_soapResults;
      
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"UnitCost"])
    {
        
        recordResults = FALSE;
        _thirdpartymdl.unitcost=_soapResults;
        
        _soapResults = nil;    }

    if([elementName isEqualToString:@"Type"])
    {
         recordResults = FALSE;
        
        _thirdpartymdl.type=_soapResults;
        
         _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"qtyinstock"])
    {
        recordResults = FALSE;
        
        _thirdpartymdl.stockinhand=_soapResults;
        [_thirdprtyarray addObject:_thirdpartymdl];
        _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"result"])
    {  recordResults = FALSE;
        
        if([_soapResults isEqualToString:@"Updated"]||[_soapResults isEqualToString:@"Inserted"])
        {
            [self UploadAnyImage];
            webtype=0;
            
        }
        else if ([_soapResults isEqualToString:@"ThirdParty Picture Updated"]) {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil message:@"Updated" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            
            [self SelectAllThirdParty];
        }

       
                _soapResults = nil;
        
    }
    if([elementName isEqualToString:@"url"])
    {
        recordResults = FALSE;
        
        
            NSData *data1=[_soapResults base64DecodedData];
            
            UIImage *image1=  [[UIImage alloc]initWithData:data1];
            
            //[NSData dataWithData:UIImagePNGRepresentation(image.image)];
            
            
            _pictureimgvw.image=image1;
            NSLog(@"img%@",image1);
            
            
      
        
        
        _soapResults = nil;
        
        
    }
    
    

    


    
}


#pragma mark - Table View datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView==_popOverTableView) {
        if (popvr==1) {
            return [_subtypearray count];
        }
        else  if (popvr==2) {
            return [_Typearray count];
        }
        
    }
    else if(tableView==_thirdprtyTable){
        
        
        return [_thirdprtyarray count];
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
        if(tableView==_thirdprtyTable){
            [[NSBundle mainBundle]loadNibNamed:@"Thirdpartycell" owner:self options:nil];
            cell=_thirdpartycell;
        }
    }
    if (tableView==_popOverTableView){
         if (popvr==1) {
        cell.textLabel.text=[_subtypearray objectAtIndex:indexPath.row];
         }
         if (popvr==2) {
               cell.textLabel.text=[_Typearray objectAtIndex:indexPath.row];
         }
    }
    if(tableView==_thirdprtyTable){
      Equpmntmdl*eqmdl=(Equpmntmdl *)[_thirdprtyarray objectAtIndex:indexPath.row];
        _codelbl=(UILabel *)[cell viewWithTag:1];
        _codelbl.text=eqmdl.itemcode;
        _deslbl=(UILabel *)[cell viewWithTag:2];
        _deslbl.text=eqmdl.itemdescptn;
        _typelbl=(UILabel *)[cell viewWithTag:3];
        _typelbl.text=eqmdl.subtype;
         _costlbl=(UILabel *)[cell viewWithTag:4];
        _costlbl.text=[NSString stringWithFormat:@"$%@",eqmdl.unitcost];
    }
    return cell;
}

#pragma mark - Table View delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(tableView==_popOverTableView){
        if (popvr==1) {
        _subtypetxtfld.text=[_subtypearray objectAtIndex:indexPath.row];
        }
         if (popvr==2) {
             
             _typetxtfld.text=[_Typearray objectAtIndex:indexPath.row];
         }
        
    }
    
    
    
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle==UITableViewCellEditingStyleDelete) {
        deltepath=indexPath.row;
        
        [self DeleteThirdParty];
        [_thirdprtyarray removeObject:indexPath];
        
        
        
        
        
    }
    
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //alternating cell back ground color
    if(tableView==_thirdprtyTable)
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
-(void)sectionHeaderView:(SectionHeaderView*)sectionHeaderView sectionOpened:(NSInteger)sectionOpened {
    
    
    Section *aSection=[sectionArray objectAtIndex:sectionOpened];
    aSection.open=YES;
    
    /*
     Create an array containing the index paths of the rows to insert: These correspond to the rows for each quotation in the current section.
     */
    NSInteger countOfRowsToInsert = [aSection.sectionRows count];
    NSMutableArray *indexPathsToInsert = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < countOfRowsToInsert; i++) {
        [indexPathsToInsert addObject:[NSIndexPath indexPathForRow:i inSection:sectionOpened]];
    }
    
    /*
     Create an array containing the index paths of the rows to delete: These correspond to the rows for each quotation in the previously-open section, if there was one.
     */
    NSMutableArray *indexPathsToDelete = [[NSMutableArray alloc] init];
    
    NSInteger previousOpenSectionIndex = self.openSectionIndex;
    if (previousOpenSectionIndex != NSNotFound) {
        Section *previousOpenSection=[sectionArray objectAtIndex:previousOpenSectionIndex];
        previousOpenSection.open=NO;
        [previousOpenSection.sectionHeaderView toggleOpenWithUserAction:NO];
        NSInteger countOfRowsToDelete = [previousOpenSection.sectionRows count];
        for (NSInteger i = 0; i < countOfRowsToDelete; i++) {
            [indexPathsToDelete addObject:[NSIndexPath indexPathForRow:i inSection:previousOpenSectionIndex]];
        }
        
        
    }
    
    // Style the animation so that there's a smooth flow in either direction.
    UITableViewRowAnimation insertAnimation;
    UITableViewRowAnimation deleteAnimation;
    if (previousOpenSectionIndex == NSNotFound || sectionOpened < previousOpenSectionIndex) {
        insertAnimation = UITableViewRowAnimationTop;
        deleteAnimation = UITableViewRowAnimationBottom;
    }
    else {
        insertAnimation = UITableViewRowAnimationBottom;
        deleteAnimation = UITableViewRowAnimationTop;
    }
    
    // Apply the updates.
    [self.thirdprtyTable beginUpdates];
    [self.thirdprtyTable insertRowsAtIndexPaths:indexPathsToInsert withRowAnimation:insertAnimation];
    [self.thirdprtyTable deleteRowsAtIndexPaths:indexPathsToDelete withRowAnimation:deleteAnimation];
    [self.thirdprtyTable endUpdates];
    self.openSectionIndex = sectionOpened;
    
    
    
}
-(void)sectionHeaderView:(SectionHeaderView*)sectionHeaderView sectionClosed:(NSInteger)sectionClosed {
    
    /*
     Create an array of the index paths of the rows in the section that was closed, then delete those rows from the table view.
     */
	Section *aSection = [self.sectionArray objectAtIndex:sectionClosed];
	
    aSection.open = NO;
    
    NSInteger countOfRowsToDelete = [self.thirdprtyTable numberOfRowsInSection:sectionClosed];
    
    if (countOfRowsToDelete > 0) {
        NSMutableArray *indexPathsToDelete = [[NSMutableArray alloc] init];
        for (NSInteger i = 0; i < countOfRowsToDelete; i++) {
            [indexPathsToDelete addObject:[NSIndexPath indexPathForRow:i inSection:sectionClosed]];
        }
        [self.thirdprtyTable deleteRowsAtIndexPaths:indexPathsToDelete withRowAnimation:UITableViewRowAnimationTop];
    }
    self.openSectionIndex = NSNotFound;
}

-(void)sectionHeaderView:(SectionHeaderView *)sectionHeaderView viewopened:(NSInteger)viewopened{
    
    //Section *aSection = [self.sectionArray objectAtIndex:viewopened];
    
    selectedsectn=viewopened;
    NSInteger previousOpenviewIndex = self.openviewIndex;
    
    if (previousOpenviewIndex != NSNotFound) {
        Section *previousOpenSection=[sectionArray objectAtIndex:previousOpenviewIndex];
        previousOpenSection.open=NO;
        [previousOpenSection.sectionHeaderView showviewWithUserAction:NO];
        NSInteger countOfRowsToDelete = [previousOpenSection.sectionRows count];
        for (NSInteger i = 0; i < countOfRowsToDelete; i++) {
            previousOpenSection.sectionHeaderView.proecsslbl.hidden=YES;
            [UIView animateWithDuration:0.5f delay:0.0 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{   previousOpenSection.sectionHeaderView.animatedview
                .frame =  CGRectMake(250, 5, 0, 0);} completion:nil];
            
            previousOpenSection.sectionHeaderView.animatedview.hidden=YES;
            
            
        }
        
        
    }
    
    self.openviewIndex=viewopened;
    
    
    
}
-(void)sectionHeaderView:(SectionHeaderView *)sectionHeaderView viewclosed:(NSInteger)viewclosed{
    
    Section *aSection = [self.sectionArray objectAtIndex:viewclosed];
	
    aSection.open = NO;
    
    
    self.openviewIndex = NSNotFound;
    
    
}




#pragma mark-Searchbar
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    
    _searchstring=_searchbar.text;
    //NSLog(@"search%@",searchstring);
    [self SearchThirdParty];
    [_searchbar resignFirstResponder];
    
    
}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
  [self SelectAllThirdParty];
}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    
    if ([_searchbar.text length]==0) {
        
        [self SelectAllThirdParty];
        // [searchBar resignFirstResponder];
        
        
    }
   // [searchBar resignFirstResponder];
    
    
}



#pragma mark-Actions
- (IBAction)deletebtn:(id)sender {
    btntype=3;
    if (self.editing) {
        [super setEditing:NO animated:NO];
        [_thirdprtyTable setEditing:NO animated:NO];
        [_thirdprtyTable reloadData];
        
        
        
    }
    
    else{
        [super setEditing:YES animated:YES];
        [_thirdprtyTable setEditing:YES animated:YES];
        [_thirdprtyTable reloadData];
        
        
        
        
    }
    

    
}

- (IBAction)typesearchbtn:(id)sender {
    popvr=2;
    [self createpopover];
    [_thirdprtyTable reloadData];
    
}

- (IBAction)closebtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)Addclosebtn:(id)sender {
    _addview.hidden=YES;
}

- (IBAction)updatebtn:(id)sender {
    UIImage *imagename =_pictureimgvw.image;
    // NSData *data = UIImagePNGRepresentation(imagename);
    
    NSData *data = UIImageJPEGRepresentation(imagename, 1.0);
    
    
    _encodedString = [data base64EncodedString];
    NSLog(@"%@",_encodedString);

    if (btntype==1) {
        [self InsertThirdParty];
    }
    else if (btntype==2){
        [self UpdateThirdParty];
    }
}

- (IBAction)cancelbtn:(id)sender {
    _codetxtfld.text=@"";
    _destxtfld.text=@"";
    _subtypetxtfld.text=@"";
    _purchasetxtfld.text=@"";
    _serialtxtfld.text=@"";
    _manufattxtfld.text =@"";
    _insuredtxtfld.text=@"";
    _hurstxtfld.text=@"";
    _fueltxtfld.text=@"";
    _condtntxtfld.text=@"";
    _hurlytxtfld.text=@"";
    _dailytxtfld.text=@"";
    _shiftwisetxtfld.text=@"";
    _weeklytxtfld.text=@"";
    _monthlytxtfld.text=@"";
    _yearlytxtfld.text=@"";
    _typetxtfld.text=@"";
    _unitcsttxtfld.text=@"";
    _stckinhandtxtdfld.text=@"";
    _pictureimgvw.image=[UIImage imageNamed:@"ios7-camera-icon"];

    
}

- (IBAction)subsearchbtn:(id)sender {
    popvr=1;
    [self createpopover];
    [self SelectAllSubtypeThirdParty];
}

- (IBAction)addbtn:(id)sender {
    _cancelbtn.enabled=YES;
    _codetxtfld.text=@"";
    _destxtfld.text=@"";
    _subtypetxtfld.text=@"";
    _purchasetxtfld.text=@"";
    _serialtxtfld.text=@"";
    _manufattxtfld.text =@"";
    _insuredtxtfld.text=@"";
    _hurstxtfld.text=@"";
    _fueltxtfld.text=@"";
    _condtntxtfld.text=@"";
    _hurlytxtfld.text=@"";
    _dailytxtfld.text=@"";
    _shiftwisetxtfld.text=@"";
    _weeklytxtfld.text=@"";
    _monthlytxtfld.text=@"";
    _yearlytxtfld.text=@"";
    _typetxtfld.text=@"";
    _unitcsttxtfld.text=@"";
    _stckinhandtxtdfld.text=@"";
    _pictureimgvw.image=[UIImage imageNamed:@"ios7-camera-icon"];

    btntype=1;
    _addview.hidden=NO;
     _navitem.title=@"ADD";
}

- (IBAction)editbtn:(id)sender {
    btntype=2;

    button = (UIButton *)sender;
    CGPoint center= button.center;
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.thirdprtyTable];
    NSIndexPath *textFieldIndexPath = [self.thirdprtyTable indexPathForRowAtPoint:rootViewPoint];
    NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
    btnpath=textFieldIndexPath.row;
  
  Equpmntmdl*eqmdl=(Equpmntmdl *)[_thirdprtyarray objectAtIndex:textFieldIndexPath.row];
    
    _codetxtfld.text=eqmdl.itemcode;
    NSLog(@"%@",eqmdl.itemcode);
    _destxtfld.text=eqmdl.itemdescptn;
    _subtypetxtfld.text=eqmdl.subtype;
    _purchasetxtfld.text=eqmdl.PurchaseValue;
    _serialtxtfld.text=eqmdl.SerialNo;
    _manufattxtfld.text =eqmdl.ManufacturedYear;
    _insuredtxtfld.text=eqmdl.InsuredValue;
    _hurstxtfld.text=eqmdl.HoursUsed;
    _fueltxtfld.text=eqmdl.FuelConsumptionPerHour;
    _condtntxtfld.text=eqmdl.Condition;
    _hurlytxtfld.text=[NSString stringWithFormat:@"$%@",eqmdl.HourlyRate];
    _dailytxtfld.text=[NSString stringWithFormat:@"$%@",eqmdl.DailyRate];
    _shiftwisetxtfld.text=[NSString stringWithFormat:@"$%@",eqmdl.ShiftwiseRate];
    _weeklytxtfld.text=[NSString stringWithFormat:@"$%@",eqmdl.WeeklyRate];
    _monthlytxtfld.text=[NSString stringWithFormat:@"$%@",eqmdl.MonthlyRate];
    _yearlytxtfld.text=[NSString stringWithFormat:@"$%@",eqmdl.YearlyRate];
    _typetxtfld.text=eqmdl.type;
   _unitcsttxtfld.text=[NSString stringWithFormat:@"$%@",eqmdl.unitcost];
    _stckinhandtxtdfld.text=eqmdl.stockinhand;
    _uplodpiclctn=eqmdl.PictureLocation;
    [self FetchAnyImage];
    _addview.hidden=NO;
    _navitem.title=@"EDIT";
    _cancelbtn.enabled=NO;
    

   }
#pragma mark-textfield delegate
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    
    Validation*val=[[Validation alloc]init];
    if (textField==_purchasetxtfld) {
        int value1=[val isNumeric:_purchasetxtfld.text];
        if (value1==0) {
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"Invalid purchase value" message:nil delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            [alert1 show];
            
        }
        
    }
    if (textField==_manufattxtfld) {
        int value2=[val isIntegerValue:_manufattxtfld.text];
        if (value2==0) {
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"Invalid year" message:nil delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            [alert1 show];
            
        }
        
    }
    if (textField==_insuredtxtfld) {
        int value3=[val isNumeric:_insuredtxtfld.text];
        if (value3==0) {
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"Invalid insured value" message:nil delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            [alert1 show];
            
        }
        
    }
    
    if (textField==_hurstxtfld) {
        int value4=[val isNumeric:_hurstxtfld.text];
        if (value4==0) {
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"Invalid used hours value" message:nil delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            [alert1 show];
            
        }
        
    }
    
    if (textField==_fueltxtfld) {
        int value5=[val isNumeric:_fueltxtfld.text];
        if (value5==0) {
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"Invalid fuel consumption" message:nil delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            [alert1 show];
            
        }
        
        
    }
    if (textField==_hurlytxtfld) {
        int value6=[val isNumeric:_hurlytxtfld.text];
        if (value6==0) {
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"Invalid hourly rate" message:nil delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            [alert1 show];
            
        }
        
        
    }
    if (textField==_dailytxtfld) {
        int value7=[val isNumeric:_dailytxtfld.text];
        if (value7==0) {
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"Invalid daily rate" message:nil delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            [alert1 show];
            
        }
        
        
    }
    if (textField==_shiftwisetxtfld) {
        int value8=[val isNumeric:_shiftwisetxtfld.text];
        if (value8==0) {
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"Invalid shiftwise rate" message:nil delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            [alert1 show];
            
        }
        
        
    }
    if (textField==_weeklytxtfld) {
        int value9=[val isNumeric:_weeklytxtfld.text];
        if (value9==0) {
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"Invalid weekly rate" message:nil delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            [alert1 show];
            
        }
        
        
    }
    
    if (textField==_monthlytxtfld) {
        int value10=[val isNumeric:_monthlytxtfld.text];
        if (value10==0) {
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"Invalid monthly rate" message:nil delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            [alert1 show];
            
        }
        
        
    }
    
    if (textField==_yearlytxtfld) {
        int value11=[val isNumeric:_yearlytxtfld.text];
        if (value11==0) {
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"Invalid yearly rate" message:nil delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            [alert1 show];
            
        }
        
        
    }
    if (textField==_unitcsttxtfld) {
        int value11=[val isNumeric:_unitcsttxtfld.text];
        if (value11==0) {
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"Invalid unit cost" message:nil delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            [alert1 show];
            
        }
        
        
    }

    
    if (textField==_stckinhandtxtdfld) {
        int value12=[val isNumeric:_stckinhandtxtdfld.text];
        if (value12==0) {
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"Invalid stock in hand" message:nil delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            [alert1 show];
            
        }
        
        
        
    }
    return YES;
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
     if ([alertView.message isEqualToString:@"Updated"])
     {
        
        
         _codetxtfld.text=@"";
         _destxtfld.text=@"";
         _subtypetxtfld.text=@"";
         _purchasetxtfld.text=@"";
         _serialtxtfld.text=@"";
         _manufattxtfld.text =@"";
         _insuredtxtfld.text=@"";
         _hurstxtfld.text=@"";
         _fueltxtfld.text=@"";
         _condtntxtfld.text=@"";
         _hurlytxtfld.text=@"";
         _dailytxtfld.text=@"";
         _shiftwisetxtfld.text=@"";
         _weeklytxtfld.text=@"";
         _monthlytxtfld.text=@"";
         _yearlytxtfld.text=@"";
         _stckinhandtxtdfld.text=@"";
         _pictureimgvw.image=[UIImage imageNamed:@"ios7-camera-icon"];
    }

    if ([alertView.title isEqualToString:@"Invalid purchase value"]) {
        
        
        _purchasetxtfld.text=@"";
        
    }
    
    if ([alertView.title isEqualToString:@"Invalid year"]) {
        
        
        _manufattxtfld.text=@"";
        
    }
    if ([alertView.title isEqualToString:@"Invalid insured value"]) {
        
        
        _insuredtxtfld.text=@"";
        
    }
    if ([alertView.title isEqualToString:@"Invalid used hours value"]) {
        
        
        _hurstxtfld.text=@"";
        
    }
    if ([alertView.title isEqualToString:@"Invalid hurly rate"]) {
        
        
        _hurlytxtfld.text=@"";
        
    }
    
    if ([alertView.title isEqualToString:@"Invalid daily rate"]) {
        
        
        _dailytxtfld.text=@"";
        
    }
    if ([alertView.title isEqualToString:@"Invalid shiftwise rate"]) {
        
        
        _shiftwisetxtfld.text=@"";
        
    }
    
    if ([alertView.title isEqualToString:@"Invalid weekly rate"]) {
        
        
        _weeklytxtfld.text=@"";
        
    }
    if ([alertView.title isEqualToString:@"Invalid monthly rate"]) {
        
        
        _monthlytxtfld.text=@"";
        
    }
    
    
    if ([alertView.title isEqualToString:@"Invalid yearly rate"]) {
        
        
        _yearlytxtfld.text=@"";
        
    }
    
    if ([alertView.title isEqualToString:@"Invalid stock in hand"]) {
        
        
        _stckinhandtxtdfld.text=@"";
        
    }
    if ([alertView.title isEqualToString:@"Invalid unit cost"]) {
        
        
        _unitcsttxtfld.text=@"";
        
    }
    
    
    
    
}




- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if(textField==_codetxtfld)
    {
        NSUInteger newLength = [_codetxtfld.text length] + [string length] - range.length;
        return (newLength > 10) ? NO : YES;
    }
    if(textField==_destxtfld)
    {
        NSUInteger newLength = [_destxtfld.text length] + [string length] - range.length;
        return (newLength > 100) ? NO : YES;
    }
    if(textField==_serialtxtfld)
    {
        NSUInteger newLength = [_serialtxtfld.text length] + [string length] - range.length;
        return (newLength > 50) ? NO : YES;
    }
    
    if(textField==_manufattxtfld)
    {
        NSUInteger newLength = [_manufattxtfld.text length] + [string length] - range.length;
        return (newLength > 4) ? NO : YES;
    }
    if(textField==_insuredtxtfld)
    {
        NSUInteger newLength = [_insuredtxtfld.text length] + [string length] - range.length;
        return (newLength > 18) ? NO : YES;
    }
    
    if(textField==_hurstxtfld)
    {
        NSUInteger newLength = [_hurstxtfld.text length] + [string length] - range.length;
        return (newLength > 18) ? NO : YES;
    }
    if(textField==_fueltxtfld)
    {
        NSUInteger newLength = [_fueltxtfld.text length] + [string length] - range.length;
        return (newLength > 18) ? NO : YES;
    }
    if(textField==_condtntxtfld)
    {
        NSUInteger newLength = [_condtntxtfld.text length] + [string length] - range.length;
        return (newLength > 200) ? NO : YES;
    }
    if(textField==_hurlytxtfld)
    {
        NSUInteger newLength = [_hurlytxtfld.text length] + [string length] - range.length;
        return (newLength > 18) ? NO : YES;
    }
    if(textField==_dailytxtfld)
    {
        NSUInteger newLength = [_dailytxtfld.text length] + [string length] - range.length;
        return (newLength > 18) ? NO : YES;
    }
    
    if(textField==_shiftwisetxtfld)
    {
        NSUInteger newLength = [_shiftwisetxtfld.text length] + [string length] - range.length;
        return (newLength > 18) ? NO : YES;
    }
    if(textField==_weeklytxtfld)
    {
        NSUInteger newLength = [_weeklytxtfld.text length] + [string length] - range.length;
        return (newLength > 18) ? NO : YES;
    }
    
    if(textField==_monthlytxtfld)
    {
        NSUInteger newLength = [_monthlytxtfld.text length] + [string length] - range.length;
        return (newLength > 18) ? NO : YES;
    }
    if(textField==_yearlytxtfld)
    {
        NSUInteger newLength = [_yearlytxtfld.text length] + [string length] - range.length;
        return (newLength > 18) ? NO : YES;
    }
    if(textField==_stckinhandtxtdfld)
    {
        NSUInteger newLength = [_stckinhandtxtdfld.text length] + [string length] - range.length;
        return (newLength > 18) ? NO : YES;
    }
    if(textField==_unitcsttxtfld)
    {
        NSUInteger newLength = [_unitcsttxtfld.text length] + [string length] - range.length;
        return (newLength > 18) ? NO : YES;
    }
    
    
    
    
    //_picker.hidden=YES;
    return YES;
}



@end
