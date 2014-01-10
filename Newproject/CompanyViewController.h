//
//  CompanyViewController.h
//  Newproject
//
//  Created by GMSIndia 2 on 19/06/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Validation.h"

@interface CompanyViewController : UIViewController<UITextFieldDelegate>
{
      BOOL recordResults;
    //fax format
     NSString *faxnoString;
     NSInteger fmt;
    //phoneno format
    NSString *phnnostring;
  
    
}

@property(strong,nonatomic)Validation*validate;
@property(strong,nonatomic)IBOutlet UIScrollView *scroll;
/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;



/*outlets*/
@property (strong, nonatomic) IBOutlet UITextField *companynametxtfld;
@property (strong, nonatomic) IBOutlet UITextField *statetextfld;

@property (strong, nonatomic) IBOutlet UITextField *ziptextfld;
@property (strong, nonatomic) IBOutlet UITextField *countrytxtfld;
@property (strong, nonatomic) IBOutlet UITextField *faxtxtfld;
@property (strong, nonatomic) IBOutlet UITextField *fedraltxtfld;
@property (strong, nonatomic) IBOutlet UITextField *stateempIdtxtfld;
@property (strong, nonatomic) IBOutlet UITextField *addresstxtfld;
@property (strong, nonatomic) IBOutlet UITextField *citytxtfld;

@property (strong, nonatomic) IBOutlet UITextField *phonetxtfld;

@property (strong, nonatomic) IBOutlet UITextField *mailtxtfld;
@property (strong, nonatomic) IBOutlet UITextField *webtxtfld;
@property (strong, nonatomic) IBOutlet UITextField *stateunempidtxtfld;
@property(strong,nonatomic)IBOutlet UIButton *coutryBtn;

- (IBAction)savebtn:(id)sender;
-(IBAction)closethecompany:(id)sender;
-(IBAction)cancel:(id)sender;
/*faxfmt*/
@property(strong,nonatomic)NSString *faxfmtstring;
@property(strong,nonatomic)NSString *phnnofmtstring;
@end
