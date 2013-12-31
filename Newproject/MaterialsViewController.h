//
//  MaterialsViewController.h
//  Newproject
//
//  Created by GMSIndia 2 on 18/12/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Manpwr.h"

@interface MaterialsViewController : UIViewController{
     BOOL recordResults;
    
}

@property(strong,nonatomic)Manpwr *materialmdl;

@property(strong,nonatomic)NSMutableArray *materialarray;
/*cell outlets*/

@property (strong, nonatomic) IBOutlet UILabel *codelbl;
@property (strong, nonatomic) IBOutlet UILabel *deslbl;
@property (strong, nonatomic) IBOutlet UILabel *typelbl;
@property (strong, nonatomic) IBOutlet UILabel *costlbl;


/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;
//outlets
@property(strong,nonatomic)IBOutlet UITableView *materialTable;
@property(strong,nonatomic)IBOutlet UITableViewCell *materialCell;
@property(strong,nonatomic)IBOutlet UIView *titleView;
@property(strong,nonatomic)IBOutlet UINavigationItem *navItem;
@property(strong,nonatomic)IBOutlet UIView *addmatView;

@property (strong, nonatomic) IBOutlet UISearchBar *searchbar;

-(IBAction)closeMaterials:(id)sender;
-(IBAction)addmaterial:(id)sender;
-(IBAction)editmaterial:(id)sender;
-(IBAction)closeaddview:(id)sender;

@end
