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
    
    BOOL            dragFromSource;     // used for reodering
    NSIndexPath*    pathFromDstTable;
    UITableViewCell*    draggedCell;
    IBOutlet UIView *droparea;
     id                  draggedData;
}

@property(strong,nonatomic)Scaffoldtypemdl *sccfldtypemdl;
@property(strong,nonatomic)Customscaffoldingplan *customsccfldmdl;

@property (strong, nonatomic) IBOutlet UINavigationBar *navbar;

-(IBAction)clsebtn:(id)sender;

@property (strong, nonatomic) IBOutlet UITableView *subtypetable;
@property (strong, nonatomic) IBOutlet UITableView *maintable;


@property (strong, nonatomic) IBOutlet UITableViewCell *subtypecell;
@property (strong, nonatomic) IBOutlet UITableViewCell *maintblecell;
@property (strong, nonatomic) IBOutlet UIView *tuchgview;



/*for drag and Drop*/


@end
