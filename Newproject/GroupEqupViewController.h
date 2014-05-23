//
//  GroupEqupViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 5/23/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GroupEqupViewController : UIViewController<UIGestureRecognizerDelegate>{
    
     NSInteger poptype;
    BOOL recordResults;
    UITableViewCell*    draggedCell;
    UIView*             dropArea;
    id                  draggedData;
    
    BOOL            dragFromSource;     // used for reodering
    NSIndexPath*    pathFromDstTable;
    //NSInteger path;
    NSInteger Deletepath;

    
}



@property (strong, nonatomic)NSMutableArray *crewmembersarray;
@property (strong, nonatomic)NSMutableArray *equipmentarray;
@property (strong, nonatomic)NSMutableArray *crenamearray;
@property (strong, nonatomic)NSMutableArray *skillarray;
@property (strong, nonatomic)NSMutableDictionary *skilldict;
@property (strong, nonatomic)NSMutableDictionary *crewdict;
@property (strong, nonatomic)NSMutableDictionary *revcrewdict;
/*popover*/
@property(strong,nonatomic)UIPopoverController *popOverController;
@property(strong,nonatomic)UITableView *popOverTableView;

/*Outlets*/
@property (strong, nonatomic) IBOutlet UINavigationBar *navbar;
@property (strong, nonatomic) IBOutlet UIView *touchview;
@property (strong, nonatomic) IBOutlet UITextField *crewnametxtfld;
@property (strong, nonatomic) IBOutlet UIButton *servicebtnlbl;
@property (strong, nonatomic) IBOutlet UIButton *crewbtnlbl;

@property (strong, nonatomic) IBOutlet UITableView *equpmenttable;
@property (strong, nonatomic) IBOutlet UITableView *crewtable;

/*buttons*/
- (IBAction)clsebtn:(id)sender;
- (IBAction)clearbtn:(id)sender;

- (IBAction)deletebtn:(id)sender;
- (IBAction)servicebtn:(id)sender;
- (IBAction)savebtn:(id)sender;

- (IBAction)crewbtn:(id)sender;
- (IBAction)alldeletebtn:(id)sender;
@end
