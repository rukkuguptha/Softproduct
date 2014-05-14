//
//  PhsestViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 5/14/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Rephase.h"
@interface PhsestViewController : UIViewController{
      BOOL recordResults;
}
@property (strong, nonatomic) Rephase *rephasemdl;

@property (strong, nonatomic) NSString *estmtnid;
@property (strong, nonatomic) IBOutlet UIView *titleview;
@property (strong, nonatomic) IBOutlet UITableView *phasetable;

@property (strong, nonatomic) IBOutlet UITableViewCell *phasecell;
@property (strong, nonatomic) NSMutableArray *phasearray;



/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;
/*cell outlets*/

@property (strong, nonatomic) IBOutlet UILabel *phaselbl;
@property (strong, nonatomic) IBOutlet UILabel *labourlbl;
@property (strong, nonatomic) IBOutlet UIButton *equbtnlbl;
@property (strong, nonatomic) IBOutlet UIButton *matbtnlbl;
@property (strong, nonatomic) IBOutlet UIButton *fleetbtnlbl;
@property (strong, nonatomic) IBOutlet UIButton *thirdpertybtnlbl;
@property (strong, nonatomic) IBOutlet UIButton *consumblslbl;
@property (strong, nonatomic) IBOutlet UIButton *othrslbl;



- (IBAction)phasebtn:(id)sender;

- (IBAction)equpbtn:(id)sender;
- (IBAction)matbtn:(id)sender;

- (IBAction)fleetbtn:(id)sender;
- (IBAction)thirdbtn:(id)sender;
- (IBAction)consumbtn:(id)sender;
- (IBAction)othrsbtn:(id)sender;




@end
