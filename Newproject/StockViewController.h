//
//  StockViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 6/12/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EqOthersMdl.h"
@protocol EqDelgate <NSObject>

-(void)toreloadtable;

@end

@interface StockViewController : UIViewController{
    
    NSInteger btnclck;
      NSInteger btnclck1;
      NSInteger btnclck2;
     BOOL  recordResults;
    NSInteger confirm;
    NSInteger thirdparty;
    NSString *jobnumber;
    NSString *message;
    
    
}
@property(nonatomic, weak)id<EqDelgate>delegate;
@property (strong, nonatomic)EqOthersMdl*eqmdl;
@property (strong, nonatomic)NSMutableArray *eqarray;
@property (strong, nonatomic)NSMutableDictionary *jobdict;
/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;

/*Stock out xib outlets*/
@property (strong, nonatomic) IBOutlet UITextField *jobsitetxtfld;
@property (strong, nonatomic) IBOutlet UITextField *itmnametxtfld;

@property (strong, nonatomic) IBOutlet UITextField *orderdtxtfld;

@property (strong, nonatomic) IBOutlet UITextField *stocktxtfld;
@property (strong, nonatomic) IBOutlet UITextField *delivrdtxtfld;

@property (strong, nonatomic) IBOutlet UITextField *sendtxtfld;
@property (strong, nonatomic) IBOutlet UILabel *orderedlbl;

@property (strong, nonatomic) IBOutlet UILabel *delivedlbl;
@property (strong, nonatomic) IBOutlet UILabel *sendlbl;

@property (strong, nonatomic) IBOutlet UIButton *thirdbtnlbl;
@property (strong, nonatomic) IBOutlet UILabel *confirmbtnlbl;
@property (strong, nonatomic) IBOutlet UIButton *confirmcheckbtnlbl;
@property (strong, nonatomic) IBOutlet UITextView *notestxtview;

- (IBAction)thirdbtn:(id)sender;
- (IBAction)confirmbtn:(id)sender;

- (IBAction)savebtn:(id)sender;

/*Stock In xib outlets*/

@property (strong, nonatomic) IBOutlet UITextField *jobsite1txtfld;
@property (strong, nonatomic) IBOutlet UITextField *item1txtfld;
@property (strong, nonatomic) IBOutlet UITextField *stock1txtfld;
@property (strong, nonatomic) IBOutlet UITextField *sendout1txtfld;
@property (strong, nonatomic) IBOutlet UITextField *received1txtfld;
@property (strong, nonatomic) IBOutlet UITextField *receivedback1txtfld;
@property (strong, nonatomic) IBOutlet UIButton *confirmlbl;
@property (strong, nonatomic) IBOutlet UITextView *notes1txtview;

- (IBAction)confirm1btnlbl:(id)sender;


- (IBAction)save1btn:(id)sender;
- (IBAction)closebtn:(id)sender;

@end
