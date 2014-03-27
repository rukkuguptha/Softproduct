//
//  SerialViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 3/27/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SerialViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{
    
    UIButton *button;
      BOOL recordResults;
}


/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;
/*Arrays&models*/
@property(strong ,nonatomic)NSMutableArray *resurcearray;



/*Outlets*/
@property (strong, nonatomic) IBOutlet UIView *titleview;
@property (strong, nonatomic) IBOutlet UITableView *resurcetable;

@property (strong, nonatomic) IBOutlet UITableViewCell *resurcecell;
@property (strong, nonatomic) IBOutlet UILabel *rsurlbl;
@property (strong, nonatomic) IBOutlet UILabel *codelbl;
@property (strong, nonatomic) IBOutlet UILabel *digitlbl;
@property (strong, nonatomic) IBOutlet UIView *addview;
@property (strong, nonatomic) IBOutlet UITextField *rsucetxtfld;
@property (strong, nonatomic) IBOutlet UITextField *codetxtfld;
@property (strong, nonatomic) IBOutlet UITextField *digittxtfld;

- (IBAction)addclsebtn:(id)sender;
- (IBAction)editbtn:(id)sender;

- (IBAction)clsebtn:(id)sender;
- (IBAction)updatebtn:(id)sender;
@end
