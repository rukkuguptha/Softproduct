//
//  MarkupViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 3/12/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Matrixmark.h"

@interface MarkupViewController : UIViewController
{
    BOOL recordResults;
    NSString *mark;
}
@property(strong,nonatomic)Matrixmark *master;


/*IBActions*/
-(IBAction)closemarkuppage:(id)sender;
-(IBAction)markupselection:(id)sender;
/*IBOutlets*/
@property(strong,nonatomic)IBOutlet UIButton *markupbutton;
@property(strong,nonatomic)IBOutlet UIScrollView *scroll;
@property(strong,nonatomic)IBOutlet UIPopoverController *popovercontroller;
@property(strong,nonatomic)IBOutlet UITableView *markuptable;
@property(strong,nonatomic)IBOutlet UITableView *recordtable;
@property(strong,nonatomic)IBOutlet UITableViewCell *markupcell;
@property(strong,nonatomic)IBOutlet UITableViewCell *recordcell;
@property(strong,nonatomic)IBOutlet UIView *markuptableviewtitle;



@property(strong,nonatomic)UITableView *popovertableview;

/*array*/
@property(strong,nonatomic)NSMutableArray *markuparray;
@property(strong,nonatomic)NSMutableArray *markuptablearray;
@property(strong,nonatomic)NSMutableArray *detailmarkuparray;

/*dict*/
@property(strong,nonatomic)NSMutableDictionary *markupdict;
@property(strong,nonatomic)NSString *markupstring;




/*xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlparser;
@property(strong,nonatomic)NSMutableString *soapresults;
@property(strong,nonatomic)NSMutableData *webdata;

@property(strong,nonatomic)IBOutlet UILabel *markupnamelabel;
@property(strong,nonatomic)IBOutlet UILabel *stpercentlabel;
@property(strong,nonatomic)IBOutlet UILabel *stdollerlabel;
@property(strong,nonatomic)IBOutlet UILabel *otpercentlabel;
@property(strong,nonatomic)IBOutlet UILabel *otdollerlabel;
@property(strong,nonatomic)IBOutlet UILabel *variablepercentlabel;
@property(strong,nonatomic)IBOutlet UILabel *fixeddollerlabel;

@end
