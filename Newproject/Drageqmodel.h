//
//  Drageqmodel.h
//  Newproject
//
//  Created by GMSIndia 2 on 23/04/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Drageqmodel : NSObject
@property(readwrite)NSInteger idvalue;
@property(readwrite)NSInteger mainGeneralId;
@property(readwrite)NSInteger SubGeneralResourceId;
@property(strong,nonatomic)NSString *eqitemcode;
@property(strong,nonatomic)NSString *eqdesc;
@property(strong,nonatomic)NSString *eqtype;
@property(strong,nonatomic)NSString *ename;

@property(strong,nonatomic)NSString *qty;
@property(strong,nonatomic)NSString *hrate;
@property(strong,nonatomic)NSString *mrate;
@property(strong,nonatomic)NSString *drate;
@property(strong,nonatomic)NSString *wrate;
@property(strong,nonatomic)NSString *yrate;

@end
