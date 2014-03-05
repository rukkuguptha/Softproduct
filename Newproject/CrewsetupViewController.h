//
//  CrewsetupViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 3/5/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "Manpwr.h"

@interface CrewsetupViewController : UIViewController<UIGestureRecognizerDelegate>{
    BOOL recordResults;
    UITableViewCell*    draggedCell;
    UIView*             dropArea;
    id                  draggedData;
    
    BOOL            dragFromSource;     // used for reodering
    NSIndexPath*    pathFromDstTable;
    NSInteger path;

}



@property (strong, nonatomic)Manpwr *manpwrmdl;
@property (strong, nonatomic)NSMutableArray *manpwrarray;
/*Outlets*/
@property (strong, nonatomic) IBOutlet UINavigationBar *navbar;
@property (strong, nonatomic) IBOutlet UIView *touchview;
@property (strong, nonatomic) IBOutlet UILabel *manpwritmlbl;
@property (strong, nonatomic) IBOutlet UILabel *manpwrdeslbl;
@property (strong, nonatomic) IBOutlet UITextField *crewnametxtfld;

/*table&cell*/
@property (strong, nonatomic) IBOutlet UITableView *manpwrtable;
@property (strong, nonatomic) IBOutlet UITableView *crewnametable;
@property (strong, nonatomic) IBOutlet UITableViewCell *crewnamecell;
@property (strong, nonatomic) IBOutlet UITableViewCell *manpwrcell;

/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;

/*buttons*/
- (IBAction)clsebtn:(id)sender;



@end
