//
//  UsersViewController.m
//  Newproject
//
//  Created by GMSIndia 2 on 16/12/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import "UsersViewController.h"

@interface UsersViewController ()

@end

@implementation UsersViewController

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
    _usertable.layer.borderWidth = 2.0;
    _usertable.layer.borderColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _titleview.backgroundColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    /*searchbar*/
    _searchbar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 220, 44)];
    _searchbar.delegate = (id)self;
    _searchbar.tintColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    
    self.usertable.tableHeaderView =_searchbar;
    
    UISearchDisplayController* searchController = [[UISearchDisplayController alloc] initWithSearchBar:_searchbar contentsController:self];
    searchController.searchResultsDataSource = (id)self;
    searchController.searchResultsDelegate =(id)self;
    searchController.delegate = (id)self;

    // Do any additional setup after loading the view from its nib.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self SelectAllUsers];
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
    return [_userlistarray count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        [[NSBundle mainBundle]loadNibNamed:@"usercell" owner:self options:nil];
        cell=_usercell;
    }
    listusermdl*usrmdl=(listusermdl *)[_userlistarray objectAtIndex:indexPath.row];
    _usernamelabel=(UILabel *)[cell viewWithTag:1];
    _usernamelabel.text=usrmdl.username;

    return cell;
}

#pragma mark - Table View delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //alternating cell back ground color
    if(tableView==_usertable)
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


-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle==UITableViewCellEditingStyleDelete) {
        path=indexPath.row;
        
        [self DeleteUsers];
        [_userlistarray removeObject:indexPath];
        
        
        
        
        
    }
    
}
#pragma mark- WebService
-(void)SelectAllUsers{
    recordresults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SelectAllUsers xmlns=\"http://ios.kontract360.com/\">\n"
                   
                   "</SelectAllUsers>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://ios.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/SelectAllUsers" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)SearchUsers
{
    
    recordresults = FALSE;
    NSString *soapMessage;
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SearchUsers xmlns=\"http://ios.kontract360.com/\">\n"
                   "<searchtext>%@</searchtext>\n"
                   "</SearchUsers>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_searchstring];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://ios.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/SearchUsers" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)InsertUsers
{
    webtype=1;
    recordresults = FALSE;
    NSString *soapMessage;
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<InsertUsers xmlns=\"http://ios.kontract360.com/\">\n"
                   "<username>%@</username>"
                   "<password>%@</password>"
                   "</InsertUsers>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_usrnametextfld.text,_pswdtextfld.text];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://ios.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/InsertUsers" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)UpdateUsers
{
    webtype=1;
    listusermdl*usermdl=(listusermdl *)[_userlistarray objectAtIndex:btnindex];
    recordresults = FALSE;
    NSString *soapMessage;
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UpdateUsers xmlns=\"http://ios.kontract360.com/\">\n"
                   "<userid>%d</userid>\n"
                   "<username>%@</username>"
                   "<password>%@</password>"
                   "</UpdateUsers>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",usermdl.userid,_usrnametextfld.text,_pswdtextfld.text];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://ios.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/UpdateUsers" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)DeleteUsers
{
    webtype=1;
    recordresults = FALSE;
    NSString *soapMessage;
    listusermdl*usrmdl=(listusermdl *)[_userlistarray objectAtIndex:path];
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<DeleteUsers xmlns=\"http://ios.kontract360.com/\">\n"
                   "<userid>%d</userid>\n"
                   "</DeleteUsers>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",usrmdl.userid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://ios.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/DeleteUsers" forHTTPHeaderField:@"Soapaction"];
    
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
    if(webtype==1)
    {
        [self SelectAllUsers];
        webtype=0;
    }
    [_usertable reloadData];
    
    
}
#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"SelectAllUsersResult"])
    {
        _userlistarray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordresults = TRUE;
    }
    if([elementName isEqualToString:@"UserId"])
    {
                if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordresults = TRUE;
    }
    if([elementName isEqualToString:@"UserName"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordresults = TRUE;
    }
    if([elementName isEqualToString:@"Password"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordresults = TRUE;
    }
    if([elementName isEqualToString:@"SearchUsersResponse"])
    {
        _userlistarray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordresults = TRUE;
    }




}
-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    
    
    
	if( recordresults )
        
	{
        
        
		[_soapResults appendString: string];
    }
}
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if([elementName isEqualToString:@"UserId"])
    {
        _usrmdl=[[listusermdl alloc]init];
        recordresults = FALSE;
        _usrmdl.userid=[_soapResults integerValue];
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"UserName"])
    {
        
        recordresults = FALSE;
        _usrmdl.username=[_soapResults stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];        _soapResults = nil;
    }
    if([elementName isEqualToString:@"Password"])
    {
        
        recordresults = FALSE;
        _usrmdl.pwd=[_soapResults stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        [_userlistarray addObject:_usrmdl];
        _soapResults = nil;
    }


}

#pragma mark-actios
-(IBAction)closeuser:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}
-(IBAction)adduserview:(id)sender
{    optionIdentifier=1;
    _addview.hidden=NO;
    _navitem.title=@"ADD";
    _pswdtextfld.text=@"";
    _usrnametextfld.text=@"";
}
-(IBAction)edituserview:(id)sender
{
    optionIdentifier=2;
    _addview.hidden=NO;
    _navitem.title=@"EDIT";
    button = (UIButton *)sender;
    CGPoint center= button.center;
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.usertable];
    NSIndexPath *textFieldIndexPath = [self.usertable indexPathForRowAtPoint:rootViewPoint];
    NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
    btnindex=textFieldIndexPath.row;
    listusermdl*usrmdl=(listusermdl *)[_userlistarray objectAtIndex:textFieldIndexPath.row];
    
    _usrnametextfld.text=usrmdl.username;
    _pswdtextfld.text=usrmdl.pwd;


}
-(IBAction)closeuserview:(id)sender
{
    _addview.hidden=YES;
}
-(IBAction)deleteusers:(id)sender
{
    if (self.editing) {
        [super setEditing:NO animated:NO];
        [_usertable setEditing:NO animated:NO];
        [_usertable reloadData];
        
        
        
    }
    
    else{
        [super setEditing:YES animated:YES];
        [_usertable setEditing:YES animated:YES];
        [_usertable reloadData];
        
    }
    
}
-(IBAction)insertuser:(id)sender
{
    if(optionIdentifier==1)
    {
        Validation *val=[[Validation alloc]init];
        int value1=[val isBlank:_usrnametextfld.text];
        int value2=[val isBlank:_pswdtextfld.text];
        if (value1==0||value2==0) {
            if(value1==0)
            {
                UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"Please Enter Your UserName" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
                [alert1 show];
            }
            else if(value2==0)
            {
                UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"Please Enter Your Password" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
                [alert1 show];
            }
        }
        else
        {

        [self InsertUsers];
        _usrnametextfld.text=@"";
        _pswdtextfld.text=@"";
        }
    }
    else if(optionIdentifier==2)
    {
        Validation *val=[[Validation alloc]init];
        int value1=[val isBlank:_usrnametextfld.text];
        int value2=[val isBlank:_pswdtextfld.text];
        if (value1==0||value2==0) {
            if(value1==0)
            {
                UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"Please Enter Your UserName" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
                [alert1 show];
            }
            else if(value2==0)
            {
                UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"Please Enter Your Password" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
                [alert1 show];
            }
        }
        else
        {

        [self UpdateUsers];
        _usrnametextfld.text=@"";
        _pswdtextfld.text=@"";
        }
    }
}
-(IBAction)cancel:(id)sender
{
    _usrnametextfld.text=@"";
    _pswdtextfld.text=@"";
}

#pragma mark-Searchbar
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    
    _searchstring=_searchbar.text;
    //NSLog(@"search%@",searchstring);
    [self SearchUsers];
    [searchBar resignFirstResponder];
    
    
}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    [self SelectAllUsers];
    
}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    
    if ([_searchbar.text length]==0) {
        
        [self SelectAllUsers];
        // [searchBar resignFirstResponder];
        
        
    }
    //[searchBar resignFirstResponder];
    
    
}
#pragma mark-textfld delegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if(textField==_usrnametextfld)
    {
        NSUInteger newLength = [_usrnametextfld.text length] + [string length] - range.length;
        return (newLength > 100) ? NO : YES;
    }
    if(textField==_pswdtextfld)
    {
        NSUInteger newLength = [_pswdtextfld.text length] + [string length] - range.length;
        return (newLength > 50) ? NO : YES;
    }

    return YES;
    
}




@end
