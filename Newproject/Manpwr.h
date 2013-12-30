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
@property(strong,nonatomic)NSString*itemcode;
@property(strong,nonatomic)NSString*itemdescptn;
@property(strong,nonatomic)NSString*subtype;
@property(strong,nonatomic)NSString*unitcost;
 @property(readwrite)NSInteger overhead;

@end
