//
//  Manpwr.h
//  Newproject
//
//  Created by GMSIndia1 on 12/27/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Manpwr : NSObject
@property(readwrite)NSInteger entryid;
@property(readwrite)NSInteger primarykey;
@property(strong,nonatomic)NSString*itemcode;
@property(strong,nonatomic)NSString*itemdescptn;
@property(strong,nonatomic)NSString*subtype;
@property(strong,nonatomic)NSString*unitcost;
@property(strong,nonatomic)NSString*stckinhand;
@property(strong,nonatomic)NSString*picturelocation;
 @property(readwrite)NSInteger overhead;
@property(strong,nonatomic)NSString*billingrate;
@property(strong,nonatomic)NSString *payrate;
@property(strong,nonatomic)NSString *craftcode;

@end
