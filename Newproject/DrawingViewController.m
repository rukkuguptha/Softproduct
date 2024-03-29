//
//  DrawingViewController.m
//  Newproject
//
//  Created by GMSIndia1 on 5/19/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "DrawingViewController.h"

@interface DrawingViewController ()

@end

@implementation DrawingViewController
@synthesize delegate,newdelegate;
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
        if (_viewclck==1) {
            
            if (_tabtype==3||_tabtype==4) {
                _deletebtnlbl.hidden=YES;
                _savebtnlbl.hidden=YES;
            }
         [self.view setBackgroundColor:[UIColor whiteColor]];
        [self.mylineview removeFromSuperview];
        _mylineview = [[MyLineDrawingView alloc] initWithFrame:CGRectMake(0, 0, 768, 954)];
        _mylineview.backgroundColor=[UIColor clearColor];
        [self.newview addSubview:_mylineview];
        
        
        [_mylineview setBackgroundColor:[UIColor colorWithPatternImage:_editedimage]];
            

    }
    else{
        [self.view setBackgroundColor:[UIColor whiteColor]];
        
   
        
        btnclick=0;
        
        // Do any additional setup after loading the view from its nib.
        red = 0.0/255.0;
        green = 0.0/255.0;
        blue = 0.0/255.0;
        brush = 15.0;
        opacity = 1.0;
        
        _newview.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:255.0/255.0f alpha:1.0f].CGColor;
        _newview.layer.borderWidth=5.0;
        
        
        _mylineview = [[MyLineDrawingView alloc] initWithFrame:CGRectMake(0, 0, 768, 939)];
        _mylineview.backgroundColor=[UIColor clearColor];
        _mylineview.delegate = self;
        _mylineview.brushPattern=[UIColor colorWithRed:102.0/255.0 green:255.0/255.0 blue:0.0/255.0 alpha:1];
        [self.newview addSubview:_mylineview];

    }
    
}
-(void)viewDidLayoutSubviews{
    myPath=[[UIBezierPath alloc]init];
    myPath.lineCapStyle=kCGLineCapRound;
    myPath.miterLimit=0;
    myPath.lineWidth=6;
    
    
    
}
- (void)viewDidUnload
{
    [self setMainimg:nil];
    [self setTempimg:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark-webservice

-(void)AccebilityUploadPlanDrawings{
    recordResults = FALSE;
   
    
    NSString *soapMessage;
     NSString*filename=[NSString stringWithFormat:@"%@.jpg",_savename];
     NSString * plantrimmestrg=[_planid stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
   //  NSString *filename =[NSString stringWithFormat:@"Drawings/%@-%@-%@.jpg",plantrimmestrg,@"Accessibility",_savename];
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UploadPlanDrawings xmlns=\"http://test.kontract360.com/\">\n"
                   "<f>%@</f>\n"
                   "<fileName>%@</fileName>\n"
                   "<PlanId>%@</PlanId>\n"
                   "<Location>%@</Location>\n"
                   "</UploadPlanDrawings>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_encodedString,filename,plantrimmestrg,@"Accessibility"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
     NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/UploadPlanDrawings" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)EquipmentUploadPlanDrawings{
    recordResults = FALSE;
    
       NSString * trimmestrg=[_planid stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSString *soapMessage;
    NSString*filename=[NSString stringWithFormat:@"%@.jpg",_savename];
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UploadPlanDrawings xmlns=\"http://test.kontract360.com/\">\n"
                   "<f>%@</f>\n"
                   "<fileName>%@</fileName>\n"
                   "<PlanId>%@</PlanId>\n"
                   "<Location>%@</Location>\n"
                   "</UploadPlanDrawings>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_encodedString,filename,trimmestrg,@"Equipment"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
     NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/UploadPlanDrawings" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)MeetingUploadPlanDrawings{
    recordResults = FALSE;
    NSString*filename;
    
    NSString *soapMessage;
    if (_datestrg.length==0) {
        NSDate *daa=[NSDate date];
        NSLog(@"%@",daa);
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
        [dateFormat setDateFormat:@"yyyy-MM-dd"];
        NSString*curntdate = [dateFormat stringFromDate:daa];
        NSLog(@"%@",curntdate);
    filename=[NSString stringWithFormat:@"%@-%@.jpg",curntdate,_savename];

    }
    else
    {
    filename=[NSString stringWithFormat:@"%@-%@.jpg",_datestrg,_savename];
}
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UploadPlanDrawings xmlns=\"http://test.kontract360.com/\">\n"
                   "<f>%@</f>\n"
                   "<fileName>%@</fileName>\n"
                   "<PlanId>%@</PlanId>\n"
                   "<Location>%@</Location>\n"
                   "</UploadPlanDrawings>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_encodedString,filename,_planid,@"Meeting"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
     NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/UploadPlanDrawings" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)NotesUploadPlanDrawings{
    recordResults = FALSE;
    NSString*filename;
    
    NSString *soapMessage;
    if (_datestrg.length==0) {
        NSDate *daa=[NSDate date];
        NSLog(@"%@",daa);
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
        [dateFormat setDateFormat:@"yyyy-MM-dd"];
        NSString*curntdate = [dateFormat stringFromDate:daa];
        NSLog(@"%@",curntdate);
        filename=[NSString stringWithFormat:@"%@-%@.jpg",curntdate,_savename];
        
    }
    else
    {
        filename=[NSString stringWithFormat:@"%@-%@.jpg",_datestrg,_savename];
    }

  
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UploadPlanDrawings xmlns=\"http://test.kontract360.com/\">\n"
                   "<f>%@</f>\n"
                   "<fileName>%@</fileName>\n"
                   "<PlanId>%@</PlanId>\n"
                   "<Location>%@</Location>\n"
                   "</UploadPlanDrawings>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_encodedString,filename,_planid,@"Notes"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
     NSURL *url = [NSURL URLWithString:@"http://test.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://test.kontract360.com/UploadPlanDrawings" forHTTPHeaderField:@"Soapaction"];
    
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
   
    
    }
#pragma mark-XML Parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"UploadPlanDrawingsResponse"])
    {
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"msg"])
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
    if([elementName isEqualToString:@"msg"])
    {
        recordResults = FALSE;
        [self.mylineview removeFromSuperview];
        _mylineview = [[MyLineDrawingView alloc] initWithFrame:CGRectMake(0, 0, 768, 954)];
        _mylineview.backgroundColor=[UIColor clearColor];
        [self.newview addSubview:_mylineview];

        [self saveaction];
       
        
        _soapResults = nil;
        
        }
    
}
- (IBAction)clsebtn:(id)sender {
           [self dismissViewControllerAnimated:YES completion:nil];
    
   
   
}
-(void)saveaction{
    if (_tabtype==1||_tabtype==2) {
        
if ([self.delegate respondsToSelector:@selector(toreloaddrawings)]) {
        [self.delegate toreloaddrawings];
        
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    
      }
    if (_tabtype==3||_tabtype==4) {
        
        if ([self.newdelegate respondsToSelector:@selector(updatingtables)]) {
            [self.newdelegate updatingtables];
            
            [self dismissViewControllerAnimated:YES completion:nil];
            
            
                  }
        
    }
    

    
}


- (IBAction)deletebtn:(id)sender {
      [_mylineview setBackgroundColor:[UIColor whiteColor]];
    [self.mylineview removeFromSuperview];
    _newview.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:255.0/255.0f alpha:1.0f].CGColor;
    _newview.layer.borderWidth=5.0;
    _mylineview = [[MyLineDrawingView alloc] initWithFrame:CGRectMake(0, 0, 768, 954)];
    _mylineview.backgroundColor=[UIColor clearColor];
    [self.newview addSubview:_mylineview];

}

- (IBAction)savebtn:(id)sender {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Save As" message:@" " delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    alertView.alertViewStyle = UIAlertViewStylePlainTextInput;
    CGRect frame = CGRectMake(14, 45, 255, 23);
    _textField = [[UITextField alloc] initWithFrame:frame];
    _textField.placeholder = @"";
    _textField.backgroundColor = [UIColor whiteColor];
    _textField.autocorrectionType = UITextAutocorrectionTypeDefault;
    _textField.keyboardType = UIKeyboardTypeAlphabet;
    _textField.returnKeyType = UIReturnKeyDone;
    _textField.clearButtonMode = UITextFieldViewModeWhileEditing; // has 'x' button to the right
    [alertView addSubview:_textField];
    
    [alertView show];

}
#pragma mark-UIAlertView
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex==1) {
        
        if ([[alertView textFieldAtIndex:0].text isEqualToString:@""]) {
            UIAlertView *newalert=[[UIAlertView alloc]initWithTitle:nil message:@"Name is Required" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [newalert show];
            
            }
        else{
        UIGraphicsBeginImageContext(_newview.bounds.size);
        [_newview.layer renderInContext:UIGraphicsGetCurrentContext()];
        UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        
        // UIImage *imagename =_mainimgeview.image;
        //NSData *data = UIImagePNGRepresentation(imagename);
        
        NSData *data = UIImageJPEGRepresentation(viewImage, 1.0);
        
        
        _encodedString = [data base64EncodedString];
        
        NSLog(@"result%@",_encodedString);
        
        
        
        _savename=[alertView textFieldAtIndex:0].text;
        
        
        NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
        [defaults setObject:_savename forKey:@"Imagename"];
        [defaults synchronize];
        
       // [self UploadDocs];
        switch (_tabtype) {
            case 1:
                [self EquipmentUploadPlanDrawings];
                break;

            case 2:
                [self AccebilityUploadPlanDrawings];
                break;
            case 3:
               [self MeetingUploadPlanDrawings];
                break;
            case 4:
               [self NotesUploadPlanDrawings];
                break;
                
            default:
                break;
        }

    }
    }
}

@end
