//
//  AllDetailsplandisplayViewController.h
//  Newproject
//
//  Created by GMSIndia 2 on 24/02/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Scaffoldtypemdl.h"
#import "Customscaffoldingplan.h"
#import <QuartzCore/QuartzCore.h>


@interface AllDetailsplandisplayViewController : UIViewController<UIGestureRecognizerDelegate>{
    
    float manhrs;
    
    UITableViewCell*    draggedCell;
    UIView*             dropArea;
    
    NSMutableArray*     srcData;
    NSMutableArray*     dstData;
    id                  draggedData;
    
    BOOL            dragFromSource;     // used for reodering
    NSIndexPath*    pathFromDstTable;
    
      BOOL recordResults;
    NSString *scfldid;
    NSInteger path;
    NSInteger tabpath;
    NSInteger btntouch;
    NSInteger chektouch;
    NSInteger ticktouch;
    NSInteger chrate;

  }

@property(strong,nonatomic)Scaffoldtypemdl *sccfldtypemdl;
@property(strong,nonatomic)Customscaffoldingplan *customsccfldmdl;
@property (strong, nonatomic)NSMutableArray *Scafldarry;
@property (strong, nonatomic)NSMutableArray *newscfoldarry;
@property (strong, nonatomic)NSString *planid;


@property (strong, nonatomic)NSMutableDictionary *subtypdict;
@property (strong, nonatomic) IBOutlet UINavigationBar *navbar;

-(IBAction)clsebtn:(id)sender;

@property (strong, nonatomic) IBOutlet UITableView *subtypetable;
@property (strong, nonatomic) IBOutlet UITableView *maintable;


@property (strong, nonatomic) IBOutlet UITableViewCell *subtypecell;
@property (strong, nonatomic) IBOutlet UITableViewCell *maintblecell;
@property (strong, nonatomic) IBOutlet UIView *tuchgview;


@property (strong, nonatomic) IBOutlet UILabel *scfldtypesublbl;


/*for drag and Drop*/
/*xmlParser*/
@property(strong,nonatomic)NSMutableData *webData;
@property(strong,nonatomic)NSMutableString *soapresults;
@property(strong,nonatomic)NSXMLParser *xmlparser;

/*cell Outlets main cell*/

@property (strong, nonatomic) IBOutlet UILabel *scffoldtypemainlbl;
@property (strong, nonatomic) IBOutlet UILabel *lngtnlbl;
@property (strong, nonatomic) IBOutlet UILabel *widthlbl;
@property (strong, nonatomic) IBOutlet UILabel *heihtlbl;
@property (strong, nonatomic) IBOutlet UILabel *numbrlbl;
@property (strong, nonatomic) IBOutlet UILabel *manhrslbl;
@property (strong, nonatomic) IBOutlet UILabel *ercthrslbl;
@property (strong, nonatomic) IBOutlet UILabel *dismntlehrslbl;


/*xib outlets*/
@property (strong, nonatomic) IBOutlet UILabel *lengthfld;
@property (strong, nonatomic) IBOutlet UILabel *widthfld;
@property (strong, nonatomic) IBOutlet UILabel *hightfld;
@property (strong, nonatomic) IBOutlet UILabel *elvatnfld;
@property (strong, nonatomic) IBOutlet UITextView *Destxtfld;
@property (strong, nonatomic) IBOutlet UITextField *sitefctrfld;
@property (strong, nonatomic) IBOutlet UIButton *iwfbtnlbl;
@property (strong, nonatomic) IBOutlet UIButton *spfbtnlbl;
@property (strong, nonatomic) IBOutlet UIButton *upwbtnlbl;
- (IBAction)updatebtn:(id)sender;
- (IBAction)iwfbtn:(id)sender;
- (IBAction)spfbtn:(id)sender;
- (IBAction)upwbtn:(id)sender;



@end
