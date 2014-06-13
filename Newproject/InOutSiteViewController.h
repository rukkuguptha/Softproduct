//
//  InOutSiteViewController.h
//  Newproject
//
//  Created by GMSIndia 2 on 12/06/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InOutSiteViewController : UIViewController
{
    NSInteger confirmcheck;
     NSInteger outconfirmcheck;
}


-(IBAction)closethepage:(id)sender;


/*IBOutlets in Sitein*/
@property(strong,nonatomic)IBOutlet UITextField *jobsitetxtfld;
@property(strong,nonatomic)IBOutlet UITextField *itemcodetxtfld;
@property(strong,nonatomic)IBOutlet UITextField *orderedqtytxtfld;
@property(strong,nonatomic)IBOutlet UITextField *receivedqtytxtfld;
@property(strong,nonatomic)IBOutlet UITextField *qtyrcvdnwtxtfld;
@property(strong,nonatomic)IBOutlet UITextView *notetextview;
@property(strong,nonatomic)IBOutlet UIButton *cnfrmbtn;

-(IBAction)confirmcheckaction:(id)sender;


/*IBOutlets in Siteout*/
@property(strong,nonatomic)IBOutlet UITextField *outjobsitetxtfld;
@property(strong,nonatomic)IBOutlet UITextField *outitemcodetxtfld;
@property(strong,nonatomic)IBOutlet UITextField *outorderedqtytxtfld;
@property(strong,nonatomic)IBOutlet UITextField *outreceivedqtytxtfld;
@property(strong,nonatomic)IBOutlet UITextField *outtotalqtysendtxtfld;
@property(strong,nonatomic)IBOutlet UITextField *outqtysendbacktxtfld;
@property(strong,nonatomic)IBOutlet UITextView *outnotetextview;
@property(strong,nonatomic)IBOutlet UIButton *outcnfrmbtn;
@property(strong,nonatomic)IBOutlet UIButton *tojobbtn;

-(IBAction)outconfirmcheckaction:(id)sender;
-(IBAction)tojobsiteaction:(id)sender;



@property(strong,nonatomic)IBOutlet UITableView *popovertableview;
@property(strong,nonatomic)UIPopoverController *popovercontroller;


@property(strong,nonatomic)NSMutableArray *inoutarray;

@end
