//
//  BranchViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 3/24/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BranchViewController : UIViewController
{
    NSInteger path;
    NSInteger optionidentifier;
    BOOL recordResults;
}
/*IBActions*/
- (IBAction)Closebranchpage:(id)sender;
-(IBAction)addbranchaction:(id)sender;
-(IBAction)deletebranchAction:(id)sender;
-(IBAction)editbranchaction:(id)sender;
-(IBAction)closebranch:(id)sender;


/*IBOutlets*/
@property(strong,nonatomic)IBOutlet UITableViewCell *branchcell;
@property (strong, nonatomic) IBOutlet UITableView *branchtable;
@property (strong, nonatomic) IBOutlet UIView *tabletitleview;
@property(strong,nonatomic)IBOutlet UISearchBar *searchbar;
@property(strong,nonatomic)IBOutlet UINavigationBar *navbar;
@property(strong,nonatomic)IBOutlet UIView *branchview;




/*array*/
@property(strong,nonatomic)NSMutableArray *brancharray;

/*xmlparser*/
@property(strong,nonatomic)NSMutableData *webData;
@property(strong,nonatomic)NSXMLParser *xmlparser;
@property(strong,nonatomic)NSMutableString *soapResults;

@end
