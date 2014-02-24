//
//  Customscaffoldingplan.h
//  Newproject
//
//  Created by GMSIndia 2 on 24/02/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Customscaffoldingplan : NSObject

@property(readwrite)NSInteger idvalue;
@property(strong,nonatomic)NSString *pid;
@property(strong,nonatomic)NSString *length;
@property(strong,nonatomic)NSString *width;
@property(strong,nonatomic)NSString *height;
@property(strong,nonatomic)NSString *qty;
@property(strong,nonatomic)NSString *elevation;
@property(strong,nonatomic)NSString *unit;
@property(strong,nonatomic)NSString *equp;
@property(strong,nonatomic)NSString *ph;
@property(strong,nonatomic)NSString *decking;
@property(strong,nonatomic)NSString *handrail;
@property(strong,nonatomic)NSString *tarpaulin;
@property(strong,nonatomic)NSString *Plasticsheet;
@property(strong,nonatomic)NSString *scaffoldname;
@property(readwrite)NSInteger typescaffold;
@property(readwrite)NSInteger ppe;
@property(readwrite)NSInteger internalworkfactor;
@property(readwrite)NSInteger unplannedwork;
@property(strong,nonatomic)NSString *manhours;
@property(strong,nonatomic)NSString *erecthours;
@property(strong,nonatomic)NSString *dismantlehours;

@end
