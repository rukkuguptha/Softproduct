//
//  PhasecomponentsViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 5/15/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Drageqmodel.h"

@interface PhasecomponentsViewController : UIViewController{
     BOOL recordResults;
    
}
@property(readwrite)NSInteger webtype;
@property(strong,nonatomic)Drageqmodel *equpmntmdl;
@property(strong,nonatomic)NSString *estmtnid;
@property(strong,nonatomic)NSString *phaseid;

@property(strong,nonatomic)NSMutableArray *Componetsarry;
/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;

/*Outlets*/
@property (strong, nonatomic) IBOutlet UIView *titleview;
@property (strong, nonatomic) IBOutlet UITableView *cmpntstable;
@property (strong, nonatomic) IBOutlet UITableViewCell *cmpntcell;
@property (strong, nonatomic) IBOutlet UILabel *itmcodelbl;
@property (strong, nonatomic) IBOutlet UILabel *deslbl;
@property (strong, nonatomic) IBOutlet UILabel *quantylbl;
@property (strong, nonatomic) IBOutlet UITextField *ratetxtfld;



- (IBAction)clsebtn:(id)sender;

@end
