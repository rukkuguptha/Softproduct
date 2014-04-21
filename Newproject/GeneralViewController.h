//
//  GeneralViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 4/21/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GeneralViewController : UIViewController{
      BOOL recordResults;
    NSInteger txtfldtype;
    NSString *phasestrg;
     NSInteger poptype;
     NSString *jobsequnce;
    
    
}

@property(strong,nonatomic)NSString *genralid;
@property(strong,nonatomic)NSString *Planid;
/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;


/*popover*/
@property(strong,nonatomic)UITableView *popovertableview;
@property(strong,nonatomic)UIPopoverController *popovercontroller;


/*Arrays*/
@property(strong,nonatomic)NSMutableArray *projectheaderarray;
@property(strong,nonatomic)NSMutableArray * unitarray;
@property(strong,nonatomic)NSMutableArray *autocompletearray;
@property(strong,nonatomic)NSMutableArray * subunitarray;
@property(strong,nonatomic)NSMutableArray *equipmentarray;
@property(strong,nonatomic)NSMutableArray *phasearray;
@property(strong,nonatomic)NSMutableArray *sequencearray;

/*dicts*/
@property(strong,nonatomic)NSMutableDictionary *phasedict;
@property(strong,nonatomic)NSMutableDictionary *sequncedict;

/*Outlets*/
@property(strong,nonatomic)UITableView *autotable;
@property(strong,nonatomic)UITableView *autotable1;
@property(strong,nonatomic)UITableView *autotable2;
@property(strong,nonatomic)UITableView *autotable3;
 
@property(strong,nonatomic)IBOutlet UIScrollView *scroll;
@property(strong,nonatomic)IBOutlet UITextView *destextview;


-(IBAction)closegeneralpage:(id)sender;

@property (strong, nonatomic) IBOutlet UITextField *unittxtfld;
@property (strong, nonatomic) IBOutlet UITextField *subunittxtfld;
@property (strong, nonatomic) IBOutlet UITextField *equipmnttxtfld;
@property (strong, nonatomic) IBOutlet UITextField *prjcthdrtxtfld;
@property (strong, nonatomic) IBOutlet UITextField *quantytxtfld;

@property (strong, nonatomic) IBOutlet UIButton *phasebtnlbl;
@property (strong, nonatomic) IBOutlet UIButton *projectheaderbtnlbl;
@property (strong, nonatomic) IBOutlet UITextView *destxtview;

- (IBAction)phasebtn:(id)sender;
- (IBAction)projcthdrbtn:(id)sender;
- (IBAction)updatebtn:(id)sender;


@end
