//
//  DetailplanViewController.m
//  Newproject
//
//  Created by GMSIndia 2 on 13/02/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "DetailplanViewController.h"

@interface DetailplanViewController ()

@end

@implementation DetailplanViewController

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
    self.view.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    self.generalview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    self.scaffoldview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    self.scroll.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    _scaffoldview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
     _addscaffoldrecordview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:226/255.0f blue:226/255.0f alpha:1.0f];
    _scaffoldtable.layer.borderWidth=4.0f;
    _scaffoldtable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _generaltable.layer.borderWidth=4.0f;
    _generaltable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    _scaffoldtabletitleview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    _genearaltabletitleview.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
    // Do any additional setup after loading the view from its nib.
    _generalview.hidden=NO;
     _generalbtn.tintColor=[UIColor whiteColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    [self GeneralSelect];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
      [self GeneralSelect];
}
-(IBAction)addnewworkaction:(id)sender
{   optionidentifier=1;
    self.generalworkctrlr=[[GeneralViewController alloc]initWithNibName:@"GeneralViewController" bundle:nil];
    _generalworkctrlr.Planid=_planid;
    _generalworkctrlr.optionidentfr=optionidentifier;
    self.generalworkctrlr.modalPresentationStyle=UIModalPresentationPageSheet;
    [self presentViewController:_generalworkctrlr
                       animated:YES completion:NULL];

}
-(IBAction)editgeneralaction:(id)sender
{
    optionidentifier=2;
    button = (UIButton *)sender;
    CGPoint center= button.center;
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.scaffoldtable];
    NSIndexPath *textFieldIndexPath = [self.scaffoldtable indexPathForRowAtPoint:rootViewPoint];
    NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
    btnindex=textFieldIndexPath.row;
    
    Generalmodel*gmodel=(Generalmodel *)[_generallistarray objectAtIndex:btnindex];

    self.generalworkctrlr=[[GeneralViewController alloc]initWithNibName:@"GeneralViewController" bundle:nil];
    _generalworkctrlr.Planid=_planid;
    _generalworkctrlr.genralid=gmodel.gid;
    _generalworkctrlr.optionidentfr=optionidentifier;
     NSLog(@"textFieldIndexPath%d",_generalworkctrlr.optionidentfr);
    self.generalworkctrlr.modalPresentationStyle=UIModalPresentationPageSheet;
    [self presentViewController:_generalworkctrlr
                       animated:YES completion:NULL];
    
}

#pragma mark-Actions
-(IBAction)addplan:(id)sender
{
    _addscaffoldrecordview.hidden=NO;
    optionidentifier=1;
    _unittextfield.text=@"";
    _equipmenttextfield.text=@"";
    _proheadertextfield.text=@"";
    [_scaffoldtyprbtn setTitle:@"Select" forState:UIControlStateNormal];
    _lengthtextfield.text=@"";
    _widthtextfield.text=@"";
    _heighttextfield.text=@"";
    _qtytextfield.text=@"";
    _elevationtextfield.text=@"";

}
-(IBAction)editscaffoldaction:(id)sender
{
    optionidentifier=2;
     _addscaffoldrecordview.hidden=NO;
    
    button = (UIButton *)sender;
    CGPoint center= button.center;
    CGPoint rootViewPoint = [button.superview convertPoint:center toView:self.scaffoldtable];
    NSIndexPath *textFieldIndexPath = [self.scaffoldtable indexPathForRowAtPoint:rootViewPoint];
    NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
    btnindex=textFieldIndexPath.row;

    Customscaffoldingplan*scaffldingplan=(Customscaffoldingplan *)[_scaffoldingplanlistarray objectAtIndex:btnindex];
    //Scaffoldtypemdl*typemdl=(Scaffoldtypemdl *)[_scaffoldtyperesultarray objectAtIndex:btnindex];
    _unittextfield.text=scaffldingplan.unit;
    _equipmenttextfield.text=scaffldingplan.equp;
    _proheadertextfield.text=scaffldingplan.ph;
    [_scaffoldtyprbtn setTitle:scaffldingplan.scaffoldname forState:UIControlStateNormal];
    _lengthtextfield.text=scaffldingplan.length;
    _widthtextfield.text=scaffldingplan.width;
    _heighttextfield.text=scaffldingplan.height;
    _qtytextfield.text=scaffldingplan.qty;
    _elevationtextfield.text=scaffldingplan.elevation;
}
-(IBAction)closeplan:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}
-(IBAction)closescaffoldview:(id)sender
{
   _addscaffoldrecordview.hidden=YES;
}
- (IBAction)generalselection:(id)sender
{   [self GeneralSelect];

    _generalview.hidden=NO;
    _scaffoldview.hidden=YES;
    _generalbtn.tintColor=[UIColor whiteColor];
    _scaffoldbtn.tintColor=[UIColor blackColor];
    _insulationbtn.tintColor=[UIColor blackColor];
    _fireproofingbtn.tintColor=[UIColor blackColor];
}
- (IBAction)Scaffoldslection:(id)sender
{
    [self ScaffoldingSelectScaffoldtype];

    _scaffoldbtn.tintColor=[UIColor whiteColor];
     _fireproofingbtn.tintColor=[UIColor blackColor];
       _insulationbtn.tintColor=[UIColor blackColor];
    _generalbtn.tintColor=[UIColor blackColor];
    _scaffoldview.hidden=NO;
    _generalview.hidden=YES;
//    _fireproofingview.hidden=YES;
//    _insulationview.hidden=YES;
}
-(IBAction)selectscaffoldtype:(id)sender
{
       UIViewController *popovercontent=[[UIViewController alloc]init];
    UIView *popoverview=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 210, 200)];
    popoverview.backgroundColor=[UIColor whiteColor];
    _popovertableview=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 210, 200)];
    _popovertableview.delegate=(id)self;
    _popovertableview.dataSource=(id)self;
    _popovertableview.rowHeight=32;
    _popovertableview.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    [popoverview addSubview:_popovertableview];
    popovercontent.view=popoverview;
    popovercontent.contentSizeForViewInPopover=CGSizeMake(210, 200);
    self.popovercontroller=[[UIPopoverController alloc]initWithContentViewController:popovercontent];
    [self.popovercontroller presentPopoverFromRect:_scaffoldtyprbtn.frame inView:self.addscaffoldrecordview permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
    

}

-(IBAction)nextbtnaction:(id)sender
{
    [self Scaffoldinsert];
//   if (optionidentifier==1)
//   {
//        [self Scaffoldinsert];
////        if (!self.allctrlr)
////        {
////        self.allctrlr=[[AllDetailsplandisplayViewController alloc]initWithNibName:@"AllDetailsplandisplayViewController" bundle:nil];
////        }
////        _allctrlr.len=_lengthtextfield.text;
////        _allctrlr.wid=_widthtextfield.text;
////        _allctrlr.height=_heighttextfield.text;
////        _allctrlr.ele=_heighttextfield.text;
////        _allctrlr.unit=_unittextfield.text;
////        _allctrlr.equip=_equipmenttextfield.text;
////        _allctrlr.sid=[_scaffoldidDict objectForKey:_scaffoldtyprbtn.titleLabel.text];
////        _allctrlr.qty=_qtytextfield.text;
////        _allctrlr.planid=_planid;
////        _allctrlr.optionidentifier=optionidentifier;
////       _allctrlr.modalPresentationStyle=UIModalPresentationFullScreen;
////       _allctrlr.modalTransitionStyle=UIModalTransitionStyleCoverVertical;
////       [self presentViewController:_allctrlr
////                       animated:YES completion:NULL];
//   }
//   else if(optionidentifier==2)
//    {
////        if (!self.allctrlr)
////        {
////            self.allctrlr=[[AllDetailsplandisplayViewController alloc]initWithNibName:@"AllDetailsplandisplayViewController" bundle:nil];
////        }
////        _allctrlr.Scafldarry=_scaffoldingplanlistarray;
////        _allctrlr.btnindx=btnindex;
////        _allctrlr.optionidentifier=optionidentifier;
////        _allctrlr.len=_lengthtextfield.text;
////        _allctrlr.wid=_widthtextfield.text;
////        _allctrlr.height=_heighttextfield.text;
////        _allctrlr.ele=_heighttextfield.text;
////        _allctrlr.unit=_unittextfield.text;
////        _allctrlr.equip=_equipmenttextfield.text;
////        _allctrlr.sid=[_scaffoldidDict objectForKey:_scaffoldtyprbtn.titleLabel.text];
////        _allctrlr.qty=_qtytextfield.text;
////        _allctrlr.planid=_planid;
////        _allctrlr.modalPresentationStyle=UIModalPresentationFullScreen;
////        _allctrlr.modalTransitionStyle=UIModalTransitionStyleCoverVertical;
////        [self presentViewController:_allctrlr
////                           animated:YES completion:NULL];
//
//    }
    
   
}
- (IBAction)InsulationSelection:(id)sender
{
    _insulationbtn.tintColor=[UIColor whiteColor];
     _scaffoldbtn.tintColor=[UIColor blackColor];
     _fireproofingbtn.tintColor=[UIColor blackColor];
     _generalbtn.tintColor=[UIColor blackColor];
   
//    _scaffoldview.hidden=YES;
//    _fireproofingview.hidden=YES;
//     _insulationview.hidden=NO;
}
- (IBAction)fireproofingselection:(id)sender
{
    _fireproofingbtn.tintColor=[UIColor whiteColor];
    _insulationbtn.tintColor=[UIColor blackColor];
     _scaffoldbtn.tintColor=[UIColor blackColor];
    _generalbtn.tintColor=[UIColor blackColor];
//    _fireproofingview.hidden=NO;
//    _scaffoldview.hidden=YES;
//    _insulationview.hidden=YES;
}
#pragma mark-Tableview
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(tableView==_scaffoldtable)
    {
        return [_scaffoldingplanlistarray count];
    }
    if(tableView==_popovertableview)
    {
        
            return [_scaffoldtyperesultarray count];
        
        
    }
    if(tableView==_generaltable)
    {
        return [_generallistarray count];
    }

       return YES;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellidentifier=@"mycell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellidentifier];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellidentifier];
        
        if(tableView==_scaffoldtable)
        {
            [[NSBundle mainBundle]loadNibNamed:@"scaffoldcell" owner:self options:nil];
            cell=_scaffoldcell;
        }
        if(tableView==_generaltable)
        {
            [[NSBundle mainBundle]loadNibNamed:@"PGcell" owner:self options:nil];
            cell=_generalcell;
        }

        
        
    }
     if(tableView==_scaffoldtable)
     {
         Customscaffoldingplan*scaffmdl=(Customscaffoldingplan *)[_scaffoldingplanlistarray objectAtIndex:indexPath.row];
         _unitcelllabel=(UILabel*)[cell viewWithTag:1];
         _unitcelllabel.text=scaffmdl.unit;
        _equipcelllabel=(UILabel*)[cell viewWithTag:2];
         _equipcelllabel.text=scaffmdl.equp;

         _pjctheadercelllabel=(UILabel*)[cell viewWithTag:3];
         _pjctheadercelllabel.text=scaffmdl.ph;

         _scaffoldcellalbel=(UILabel*)[cell viewWithTag:4];
         _scaffoldcellalbel.text=scaffmdl.scaffoldname;
         //[NSString stringWithFormat:@"%d",scaffmdl.typescaffold];

         _lengthcelllabel=(UILabel*)[cell viewWithTag:5];
        _lengthcelllabel.text=scaffmdl.length;

         _widthcelllabel=(UILabel*)[cell viewWithTag:6];
         _widthcelllabel.text=scaffmdl.width;
         _heightcelllabel=(UILabel*)[cell viewWithTag:7];
        _heightcelllabel.text=scaffmdl.height;
         
         _quantitycelllabel=(UILabel*)[cell viewWithTag:8];
         _quantitycelllabel.text=scaffmdl.qty;
         
         _elevationcelllabel=(UILabel*)[cell viewWithTag:9];
         _elevationcelllabel.text=scaffmdl.elevation;
         _manhourslabel=(UILabel*)[cell viewWithTag:10];
         _manhourslabel.text=scaffmdl.manhours;


     }
    if(tableView==_generaltable)
    {
        Generalmodel*genmdl=(Generalmodel *)[_generallistarray objectAtIndex:indexPath.row];
        _generalunitlabel=(UILabel*)[cell viewWithTag:1];
        _generalunitlabel.text=genmdl.Unit;
        _generalsubunitlabel=(UILabel*)[cell viewWithTag:2];
        _generalsubunitlabel.text=genmdl.SubUnit;
        
        _generalequiplabel=(UILabel*)[cell viewWithTag:3];
        _generalequiplabel.text=genmdl.Equipment;
        
        _generalphlabel=(UILabel*)[cell viewWithTag:4];
        _generalphlabel.text=genmdl.ProjectHeader;
        //[NSString stringWithFormat:@"%d",scaffmdl.typescaffold];
        
        _generalquanitylabel=(UILabel*)[cell viewWithTag:5];
        _generalquanitylabel.text=genmdl.Quantity;
        
        _generalphaselabel=(UILabel*)[cell viewWithTag:6];
        _generalphaselabel.text=genmdl.Phase;
        _generalseqlabel=(UILabel*)[cell viewWithTag:7];
        _generalseqlabel.text=genmdl.sequence;
        
        
    }

    if(tableView==_popovertableview)
    {
       
            cell.textLabel.font = [UIFont fontWithName:@"Helvetica Neue Light" size:12];
            cell.textLabel.font = [UIFont systemFontOfSize:12.0];
            
            Scaffoldtypemdl*typmdl=(Scaffoldtypemdl *)[_scaffoldtyperesultarray objectAtIndex:indexPath.row];
            
            cell.textLabel.text=typmdl.typeName;
        
    }
    
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView==_popovertableview)
    { Scaffoldtypemdl*typmdl=(Scaffoldtypemdl *)[_scaffoldtyperesultarray objectAtIndex:indexPath.row];
        scaffoldtypeindex=indexPath.row;
       // cell.textLabel.text=typmdl.typeName;
        [_scaffoldtyprbtn setTitle:typmdl.typeName forState:UIControlStateNormal];
    }
}

#pragma mark-webservices
-(void)ScaffoldingSelectScaffoldtype{
    webtype=1;
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<ScaffoldingSelectScaffoldtype xmlns=\"http://ios.kontract360.com/\">\n"
                  "</ScaffoldingSelectScaffoldtype>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n"];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.125/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/ScaffoldingSelectScaffoldtype" forHTTPHeaderField:@"Soapaction"];
    
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

-(void)ScaffoldingSelectplan{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<ScaffoldingSelectplan xmlns=\"http://ios.kontract360.com/\">\n"
                    "<planid>%@</planid>\n"
                   "</ScaffoldingSelectplan>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_planid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.125/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/ScaffoldingSelectplan" forHTTPHeaderField:@"Soapaction"];
    
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

-(void)GeneralSelect{
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<GeneralSelect xmlns=\"http://ios.kontract360.com/\">\n"
                   "<PlanId>%@</PlanId>\n"
                   "</GeneralSelect>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_planid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.125/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/GeneralSelect" forHTTPHeaderField:@"Soapaction"];
    
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


//-(void)Selectcheight{
//    recordResults = FALSE;
//    NSString *soapMessage;
//    
//    
//    soapMessage = [NSString stringWithFormat:
//                   
//                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
//                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
//                   
//                   
//                   "<soap:Body>\n"
//                   
//                   "<Selectcheight xmlns=\"http://ios.kontract360.com/\">\n"
//                   "<ht>%d</ht>\n"
//                   "</Selectcheight>\n"
//                   "</soap:Body>\n"
//                   "</soap:Envelope>\n",[_elevationtextfield.text integerValue]];
//    NSLog(@"soapmsg%@",soapMessage);
//    
//    
//    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
//    NSURL *url = [NSURL URLWithString:@"http://192.168.0.125/service.asmx"];
//    
//    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
//    
//    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
//    
//    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
//    
//    [theRequest addValue: @"http://ios.kontract360.com/Selectcheight" forHTTPHeaderField:@"Soapaction"];
//    
//    [theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];
//    [theRequest setHTTPMethod:@"POST"];
//    [theRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
//    
//    
//    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
//    
//    if( theConnection )
//    {
//        _webData = [NSMutableData data];
//    }
//    else
//    {
//        ////NSLog(@"theConnection is NULL");
//    }
//    
//}
-(void)Scaffoldinsert{
    recordResults = FALSE;
    NSString *soapMessage;
    if(optionidentifier==1){
    NSString *scaffoldid=[_scaffoldidDict objectForKey:_scaffoldtyprbtn.titleLabel.text];
    NSLog(@"%@",scaffoldid);
    NSString *desc=@"";
     NSString *manhours=@"0";
     NSString *erecthours=@"0";
     NSString *dismantilehours=@"0";
    NSString *insertid=@"0";

    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<Scaffoldinsert xmlns=\"http://ios.kontract360.com/\">\n"
                   "<id>%d</id>\n"
                   "<length>%@</length>\n"
                   "<width>%@</width>\n"
                   "<height>%@</height>\n"
                   "<qty>%@</qty>\n"
                   "<elevation>%@</elevation>\n"
                   "<unit>%@</unit>\n"
                   "<equp>%@</equp>\n"
                   "<description>%@</description>\n"
                   "<typeofscaffold>%d</typeofscaffold>\n"
                   "<ManHours>%f</ManHours>\n"
                   "<ErectHours>%f</ErectHours>\n"
                   "<DismantleHours>%f</DismantleHours>\n"
                   "<planId>%@</planId>\n"
                   "<InternalWorkFactor>%d</InternalWorkFactor>\n"
                   "<PPE>%d</PPE>\n"
                   "<UnplannedWork>%d</UnplannedWork>\n"
                   "<ph>%@</ph>\n"
                   "</Scaffoldinsert>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[insertid integerValue],_lengthtextfield.text,_widthtextfield.text,_heighttextfield.text,_qtytextfield.text,_elevationtextfield.text,_unittextfield.text,_equipmenttextfield.text,desc,[scaffoldid integerValue],[manhours doubleValue],[erecthours doubleValue],[dismantilehours doubleValue],_planid,0,0,0,_proheadertextfield.text];
    NSLog(@"soapmsg%@",soapMessage);
    }
    else if (optionidentifier==2)
    {
        NSString *scaffoldid=[_scaffoldidDict objectForKey:_scaffoldtyprbtn.titleLabel.text];
        NSLog(@"%@",scaffoldid);
        
       // NSString *insertid=@"0";
         Customscaffoldingplan*scaffldingplan=(Customscaffoldingplan *)[_scaffoldingplanlistarray objectAtIndex:btnindex];
        NSString *manhours=scaffldingplan.manhours;
        NSString *erecthours=scaffldingplan.erecthours;
        NSString *dismantilehours=scaffldingplan.dismantlehours;
        soapMessage = [NSString stringWithFormat:
                       
                       @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                       "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                       
                       
                       "<soap:Body>\n"
                       
                       "<Scaffoldinsert xmlns=\"http://ios.kontract360.com/\">\n"
                       "<id>%d</id>\n"
                       "<length>%@</length>\n"
                       "<width>%@</width>\n"
                       "<height>%@</height>\n"
                       "<qty>%@</qty>\n"
                       "<elevation>%@</elevation>\n"
                       "<unit>%@</unit>\n"
                       "<equp>%@</equp>\n"
                       "<description>%@</description>\n"
                       "<typeofscaffold>%d</typeofscaffold>\n"
                       "<ManHours>%f</ManHours>\n"
                       "<ErectHours>%f</ErectHours>\n"
                       "<DismantleHours>%f</DismantleHours>\n"
                       "<planId>%@</planId>\n"
                       "<InternalWorkFactor>%d</InternalWorkFactor>\n"
                       "<PPE>%d</PPE>\n"
                       "<UnplannedWork>%d</UnplannedWork>"
                       "<ph>%@</ph>\n"
                       "</Scaffoldinsert>\n"
                       "</soap:Body>\n"
                       "</soap:Envelope>\n",scaffldingplan.idvalue,_lengthtextfield.text,_widthtextfield.text,_heighttextfield.text,_qtytextfield.text,_elevationtextfield.text,_unittextfield.text,_equipmenttextfield.text,scaffldingplan.desc,[scaffoldid integerValue],[manhours doubleValue],[erecthours doubleValue],[dismantilehours doubleValue],_planid,0,0,0,_proheadertextfield.text];
        NSLog(@"soapmsg%@",soapMessage);

    }
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://192.168.0.125/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://ios.kontract360.com/Scaffoldinsert" forHTTPHeaderField:@"Soapaction"];
    
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
    [_scaffoldtable reloadData];
    [_generaltable reloadData];
    if (webtype==1) {
        [self ScaffoldingSelectplan];
        webtype=0;
    }


}
#pragma mark-xml parser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"ScaffoldingSelectplanResult"])
    {
        _scaffoldingplanlistarray=[[NSMutableArray alloc]init];
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"id"])
    {
       
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"length"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"width"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"height"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"qty"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"elevation"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"unit"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"equp"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ph"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"typeofscaffold"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"description"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"Decking"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"HandRail"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Tarpaulin"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Plasticsheet"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"InternalWorkFactor"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"PPE"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"UnplannedWork"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ManHoures"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ErectHoures"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"DesmandleHoures"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"planid"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ScaffoldingSelectScaffoldtypeResult"])
    {
        _scaffoldtyperesultarray=[[NSMutableArray alloc]init];
        _scaffoldtypeDict=[[NSMutableDictionary alloc]init];
        _scaffoldidDict=[[NSMutableDictionary alloc]init];
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"scaffoldId"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"typename"])
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
    if([elementName isEqualToString:@"ftupto33"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ftupto100"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ftupto165"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ftg165"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"ft3upto1750"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ft3upto7000"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ft3upto18000"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ft3g18000"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ScaffoldinsertResult"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Column1"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"result"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"GeneralSelectResponse"])
    {
        _generallistarray=[[NSMutableArray alloc]init];
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Id"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Unit"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"SubUnit"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Equipment"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"ProjectHeader"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Phase"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Description"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"Quantity"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"TotalHoures"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }


    if([elementName isEqualToString:@"PlanId"])
    {
        
        if(!_soapresults)
        {
            _soapresults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"sequence"])
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
    if([elementName isEqualToString:@"ScaffoldingSelectplanResult"])
    {
               recordResults = FALSE;
        
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"id"])
    {
        _scfldmdl=[[Customscaffoldingplan alloc]init];
        recordResults = FALSE;
        _scfldmdl.idvalue=[_soapresults integerValue];;
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"length"])
    {
        
        recordResults = FALSE;
        _scfldmdl.length=_soapresults;
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"width"])
    {
        
        recordResults = FALSE;
        _scfldmdl.width=_soapresults;
        _soapresults = nil;
    }

    if([elementName isEqualToString:@"height"])
    {
        
        recordResults = FALSE;
        _scfldmdl.height=_soapresults;
        _soapresults = nil;
    }

    if([elementName isEqualToString:@"qty"])
    {
        
        recordResults = FALSE;
        _scfldmdl.qty=_soapresults;
        _soapresults = nil;
    }

    if([elementName isEqualToString:@"elevation"])
    {
        
        recordResults = FALSE;
        _scfldmdl.elevation=_soapresults;
        _soapresults = nil;
    }

    if([elementName isEqualToString:@"unit"])
    {
        
        recordResults = FALSE;
        _scfldmdl.unit=_soapresults;
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"equp"])
    {
        
        recordResults = FALSE;
        _scfldmdl.equp=_soapresults;
        _soapresults = nil;
    }

    if([elementName isEqualToString:@"ph"])
    {
        
        recordResults = FALSE;
        _scfldmdl.ph=_soapresults;
        _soapresults = nil;
    }

    if([elementName isEqualToString:@"typeofscaffold"])
    {
        
        recordResults = FALSE;
         NSString *scaffoldname=[_scaffoldtypeDict objectForKey:_soapresults];
        _scfldmdl.typescaffold=[_soapresults integerValue];
        _scfldmdl.scaffoldname=scaffoldname;
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"description"])
    {
        
        recordResults = FALSE;
        _scfldmdl.desc=_soapresults;
        _soapresults = nil;
    }

    if([elementName isEqualToString:@"Decking"])
    {
        
        recordResults = FALSE;
        _scfldmdl.decking=_soapresults;
        _soapresults = nil;
    }

    if([elementName isEqualToString:@"HandRail"])
    {
        
        recordResults = FALSE;
        _scfldmdl.handrail=_soapresults;
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"Tarpaulin"])
    {
        
        recordResults = FALSE;
        _scfldmdl.tarpaulin=_soapresults;
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"Plasticsheet"])
    {
        
        recordResults = FALSE;
        _scfldmdl.Plasticsheet=_soapresults;
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"InternalWorkFactor"])
    {
        
        recordResults = FALSE;
        _scfldmdl.internalworkfactor=[_soapresults integerValue];
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"PPE"])
    {
        
        recordResults = FALSE;
        _scfldmdl.ppe=[_soapresults integerValue];
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"UnplannedWork"])
    {
        
        recordResults = FALSE;
        _scfldmdl.unplannedwork=[_soapresults integerValue];
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"ManHoures"])
    {
        
        recordResults = FALSE;
        _scfldmdl.manhours=_soapresults;
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"ErectHoures"])
    {
        
        recordResults = FALSE;
        _scfldmdl.erecthours=_soapresults;
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"DesmandleHoures"])
    {
        
        recordResults = FALSE;
        _scfldmdl.dismantlehours=_soapresults;
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"planid"])
    {
        
        recordResults = FALSE;
        _scfldmdl.pid=_soapresults;
        [_scaffoldingplanlistarray addObject:_scfldmdl];
        _soapresults = nil;
    }
    
    
    if([elementName isEqualToString:@"ScaffoldingSelectScaffoldtypeResult"])
    {
        
        recordResults = FALSE;
       
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"scaffoldId"])
    {
        _typemdl=[[Scaffoldtypemdl alloc]init];
        recordResults = FALSE;
        _scaffoldtypestring=_soapresults;
        _typemdl.scaffoldid=[_soapresults integerValue];
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"typename"])
    {
       
        recordResults = FALSE;
        _typemdl.typeName=_soapresults;
        [_scaffoldtypeDict setObject:_soapresults forKey:_scaffoldtypestring];
        [_scaffoldidDict setObject:_scaffoldtypestring forKey:_soapresults];
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"rate"])
    {
        
        recordResults = FALSE;
        _typemdl.rate=_soapresults;
        _soapresults = nil;
    }

    if([elementName isEqualToString:@"ftupto33"])
    {
        
        recordResults = FALSE;
        _typemdl.ftupto33=_soapresults;
        _soapresults = nil;
    }

    if([elementName isEqualToString:@"ftupto100"])
    {
        
        recordResults = FALSE;
        _typemdl.ftupto100=_soapresults;
        _soapresults = nil;
    }

    if([elementName isEqualToString:@"ftupto165"])
    {
        
        recordResults = FALSE;
        _typemdl.ftupto165=_soapresults;
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"ftg165"])
    {
        
        recordResults = FALSE;
        _typemdl.ftg165=_soapresults;
        _soapresults = nil;
    }


    if([elementName isEqualToString:@"ft3upto1750"])
    {
        
        recordResults = FALSE;
        _typemdl.ft3upto1750=_soapresults;
        _soapresults = nil;
    }

    if([elementName isEqualToString:@"ft3upto7000"])
    {
        
        recordResults = FALSE;
        _typemdl.ft3upto7000=_soapresults;
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"ft3upto18000"])
    {
        
        recordResults = FALSE;
        _typemdl.ft3upto18000=_soapresults;
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"ft3g18000"])
    {
        
        recordResults = FALSE;
        _typemdl.ft3g18000=_soapresults;
        [_scaffoldtyperesultarray addObject:_typemdl];
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"Column1"])
    {
        
        recordResults = FALSE;
        _insertresultvalue=_soapresults;
        if(optionidentifier==1)
        {
        if (!self.allctrlr)
        {
            self.allctrlr=[[AllDetailsplandisplayViewController alloc]initWithNibName:@"AllDetailsplandisplayViewController" bundle:nil];
        }
        _allctrlr.len=_lengthtextfield.text;
        _allctrlr.wid=_widthtextfield.text;
        _allctrlr.height=_heighttextfield.text;
        _allctrlr.ele=_elevationtextfield.text;
        _allctrlr.unit=_unittextfield.text;
        _allctrlr.equip=_equipmenttextfield.text;
        _allctrlr.sid=[_scaffoldidDict objectForKey:_scaffoldtyprbtn.titleLabel.text];
        _allctrlr.qty=_qtytextfield.text;
        _allctrlr.ph=_proheadertextfield.text;
        _allctrlr.planid=_planid;
        _allctrlr.Scfldid=_insertresultvalue;
        _allctrlr.optionidentifier=optionidentifier;
            NSInteger scfid= [_allctrlr.sid integerValue];
            switch (scfid) {
                case 1:
                    _allctrlr.scaffoldtypeindex=0;
                    
                    break;
                case 2:
                    _allctrlr.scaffoldtypeindex=1;
                    
                    break;
                case 3:
                    _allctrlr.scaffoldtypeindex=2;
                    
                    break;
                case 4:
                    _allctrlr.scaffoldtypeindex=3;
                    
                    break;
                case 5:
                    _allctrlr.scaffoldtypeindex=4;
                    
                    break;
                    
                default:
                    
                    break;
            }

//        _allctrlr.modalPresentationStyle=UIModalPresentationFullScreen;
//        _allctrlr.modalTransitionStyle=UIModalTransitionStylePartialCurl;
            _allctrlr.delegate=self;

            [UIView transitionFromView:self.addscaffoldrecordview
                                toView:self.allctrlr.view
                              duration:1
                               options:UIViewAnimationOptionTransitionFlipFromRight
                            completion:nil];
            
            [self.navigationController pushViewController:_allctrlr animated:NO];

            _addscaffoldrecordview.hidden=YES;
//                 [self presentViewController:_allctrlr
//                           animated:YES completion:NULL];
        }
       
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"result"])
    {
        
        recordResults = FALSE;
        if([_soapresults isEqualToString:@"updatedscaffold"])
        {
//                if (!self.allctrlr)
//                        {
//                            self.allctrlr=[[AllDetailsplandisplayViewController alloc]initWithNibName:@"AllDetailsplandisplayViewController" bundle:nil];
//                        }
            self.allctrlr=[[AllDetailsplandisplayViewController alloc]initWithNibName:@"AllDetailsplandisplayViewController" bundle:nil];
            _allctrlr.Scafldarry=_scaffoldingplanlistarray;
            _allctrlr.newscfoldtypearry=_scaffoldtyperesultarray;
            _allctrlr.btnindx=btnindex;
            _allctrlr.optionidentifier=optionidentifier;
            _allctrlr.len=_lengthtextfield.text;
            _allctrlr.wid=_widthtextfield.text;
            _allctrlr.height=_heighttextfield.text;
            _allctrlr.ele=_heighttextfield.text;
            _allctrlr.unit=_unittextfield.text;
             _allctrlr.ph=_proheadertextfield.text;
            _allctrlr.equip=_equipmenttextfield.text;
            _allctrlr.sid=[_scaffoldidDict objectForKey:_scaffoldtyprbtn.titleLabel.text];
            _allctrlr.qty=_qtytextfield.text;
            _allctrlr.planid=_planid;
            NSInteger scfid= [_allctrlr.sid integerValue];
            switch (scfid) {
                case 1:
                    _allctrlr.scaffoldtypeindex=0;
                    
                    break;
                case 2:
                    _allctrlr.scaffoldtypeindex=1;
                    
                    break;
                case 3:
                    _allctrlr.scaffoldtypeindex=2;
                    
                    break;
                case 4:
                    _allctrlr.scaffoldtypeindex=3;
                    
                    break;
                case 5:
                    _allctrlr.scaffoldtypeindex=4;
                    
                    break;
                    
                default:
                    
                    break;
            }

//            _allctrlr.modalPresentationStyle=UIModalPresentationFullScreen;
//            _allctrlr.modalTransitionStyle=UIModalTransitionStyleCoverVertical;
            _allctrlr.delegate=self;
           
            //[self presentViewController:_allctrlr
                               //animated:YES completion:NULL];
            
                      [UIView transitionFromView:self.addscaffoldrecordview
                                toView:self.allctrlr.view
                              duration:1
                               options:UIViewAnimationOptionTransitionFlipFromRight
                            completion:nil];
            
            [self.navigationController pushViewController:_allctrlr animated:NO];
            
           // [self presentViewController:_allctrlr
            //animated:NO completion:NULL];

            _addscaffoldrecordview.hidden=YES;

//            CATransition *animation = [CATransition animation];
//            [animation setDelegate:self];
//            [animation setDuration:1.0f];
//            animation.startProgress = 0;
//            animation.endProgress   = 1;
//            [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
//            animation.type = @"pageCurl";
//            animation.subtype=@"fromRight";
//            animation.fillMode = kCAFillModeForwards;
//            
//            [animation setRemovedOnCompletion:NO];
//            [animation setFillMode: @"extended"];
//            [animation setRemovedOnCompletion: NO];
//            //[lyr addAnimation:animation forKey:@"WebPageCurl"];
//            
//            [self.navigationController.view.layer addAnimation:animation forKey:@"WebPageCurl"];
//            [self.navigationController pushViewController:_allctrlr animated:NO];
        }
        

        
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"GeneralSelectResult"])
    {
        
        recordResults = FALSE;
       
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"Id"])
    {
        
        recordResults = FALSE;
        _gmodel=[[Generalmodel alloc]init];
        _gmodel.gid=_soapresults;
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"Unit"])
    {
        
        recordResults = FALSE;
        _gmodel.Unit=_soapresults;
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"SubUnit"])
    {
        
        recordResults = FALSE;
        _gmodel.SubUnit=_soapresults;
        _soapresults = nil;
    }

    if([elementName isEqualToString:@"Equipment"])
    {
        
        recordResults = FALSE;
        _gmodel.Equipment=_soapresults;
        _soapresults = nil;
    }

    if([elementName isEqualToString:@"ProjectHeader"])
    {
        
        recordResults = FALSE;
        _gmodel.ProjectHeader=_soapresults;
        _soapresults = nil;
    }

    if([elementName isEqualToString:@"Phase"])
    {
        
        recordResults = FALSE;
        _gmodel.Phase=_soapresults;
        _soapresults = nil;
    }

    if([elementName isEqualToString:@"Description"])
    {
        
        recordResults = FALSE;
        _gmodel.genDescription=_soapresults;
        _soapresults = nil;
    }

    if([elementName isEqualToString:@"Quantity"])
    {
        
        recordResults = FALSE;
        _gmodel.Quantity=_soapresults;
        _soapresults = nil;
    }

    if([elementName isEqualToString:@"TotalHoures"])
    {
        
        recordResults = FALSE;
        _gmodel.TotalHoures=_soapresults;
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"PlanId"])
    {
        
        recordResults = FALSE;
        _gmodel.PlanId=_soapresults;
        _soapresults = nil;
    }
    if([elementName isEqualToString:@"sequence"])
    {
        
        recordResults = FALSE;
        _gmodel.sequence=_soapresults;
        [_generallistarray addObject:_gmodel];
        _soapresults = nil;
    }





}

-(void)navgteanimtn{
    [UIView transitionFromView:self.allctrlr.view
                        toView:self.addscaffoldrecordview
                      duration:1
                       options:UIViewAnimationOptionTransitionFlipFromRight
                    completion:nil];

}

@end
