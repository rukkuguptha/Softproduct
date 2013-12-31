//
//  EqpmViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 12/13/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EqpmViewController : UIViewController{
      BOOL recordResults;
    
}



/* xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;

//outlets
@property(strong,nonatomic)IBOutlet UITableView *equipmenttbl;
@property(strong,nonatomic)IBOutlet UITableViewCell *equipcell;
@property(strong,nonatomic)IBOutlet UIView *titleview;
@property(strong,nonatomic)IBOutlet UIView *addequipmentview;
@property(strong,nonatomic)IBOutlet UINavigationItem *navItem;
@property(strong,nonatomic)IBOutlet UIScrollView *scroll_addview;

@property(strong,nonatomic)NSMutableArray *Equpntarray;

@property(strong,nonatomic)UISearchBar *searchbar;

-(IBAction)closeEqupment:(id)sender;
-(IBAction)addEquipment:(id)sender;
-(IBAction)editequipview:(id)sender;
-(IBAction)closeaddview:(id)sender;
@end
