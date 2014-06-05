//
//  EmpJobViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 6/5/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CKCalendarView.h"

@interface EmpJobViewController : UIViewController{
    UIButton *button;
    BOOL recordResults;
    NSString*jobnumber;
    NSInteger dateselect;
}
@property (strong, nonatomic) IBOutlet UILabel *fromdatelbl;
@property (strong, nonatomic) IBOutlet UILabel *todatelbl;

@property(nonatomic, weak) CKCalendarView *calendar;
@property(nonatomic, strong) NSDateFormatter *dateFormatter;
@property (strong, nonatomic) IBOutlet UIButton *jobbtnlbl;
@property (strong, nonatomic) IBOutlet UIScrollView *scroll;

@property (strong, nonatomic) IBOutlet UIView *titleview;
@property (strong, nonatomic) IBOutlet UITableView *manpwrtable;
@property (strong, nonatomic) IBOutlet UIView *emptitle;
@property (strong, nonatomic) IBOutlet UIView *jobtitle;

@property (strong, nonatomic) IBOutlet UITableView *employeetable;
@property (strong, nonatomic) IBOutlet UITableView *jobtable;

@property (strong, nonatomic) IBOutlet UITableViewCell *empcell;
@property (strong, nonatomic) IBOutlet UIButton *craftbtnlbl;

@property (strong, nonatomic) IBOutlet UIButton *frmdatebtn;
@property (strong, nonatomic) IBOutlet UIView *empview;

@property (strong, nonatomic) IBOutlet UIButton *todatebtnlbl;
/*xmlparse*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;

/*popover*/
@property(strong,nonatomic)UIPopoverController *popOverController;
@property(strong,nonatomic)UITableView *popOverTableView;

/*arrays*/
@property(strong,nonatomic)NSMutableArray*jobarray;

- (IBAction)closebtn:(id)sender;
- (IBAction)jobactn:(id)sender;

- (IBAction)craftbtn:(id)sender;
- (IBAction)fromdatebtn:(id)sender;
- (IBAction)todatebtn:(id)sender;


- (IBAction)movebtn:(id)sender;

@end
