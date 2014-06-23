//
//  IssuesViewController.h
//  Newproject
//
//  Created by Riya on 6/20/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Issuemdl.h"
@interface IssuesViewController : UIViewController{
    
     BOOL  recordResults;
}


@property(strong,nonatomic)Issuemdl*issuemdl;
@property(strong,nonatomic)NSMutableArray*Issuearray;

/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;


/*Outlets*/
@property (strong, nonatomic) IBOutlet UIView *titleview;
@property (strong, nonatomic) IBOutlet UITableView *issuetable;

@property (strong, nonatomic) IBOutlet UITableViewCell *issuecell;

@property (strong, nonatomic) IBOutlet UILabel *numbrlbl;
@property (strong, nonatomic) IBOutlet UILabel *datelbl;
@property (strong, nonatomic) IBOutlet UILabel *typelbl;
@property (strong, nonatomic) IBOutlet UILabel *cmmtlbl;


- (IBAction)addbtn:(id)sender;
- (IBAction)deletebtn:(id)sender;
- (IBAction)editbtn:(id)sender;

- (IBAction)clsebtn:(id)sender;

@end
