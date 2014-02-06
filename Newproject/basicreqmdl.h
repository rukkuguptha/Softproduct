//
//  basicreqmdl.h
//  Newproject
//
//  Created by GMSIndia 2 on 02/01/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface basicreqmdl : NSObject

@property(readwrite)NSInteger eid;
@property(strong,nonatomic)NSString *itemname;
@property(strong,nonatomic)NSString *code;
@property(strong,nonatomic)NSString *rate;
@property(readwrite)NSInteger haveexpirydate;
@property(readwrite)NSInteger type;
@property(readwrite)NSInteger def;
@property(readwrite)NSInteger jobsite;
@property(readwrite)NSInteger craft;
@property(readwrite)NSInteger allcraft;
@property(readwrite)NSInteger inhouse;
@property(strong,nonatomic)NSString *hrs;
@property(strong,nonatomic)NSString *vendername;
@property(strong,nonatomic)NSString *jobname;
@property(strong,nonatomic)NSString *des;
@property(strong,nonatomic)NSString *typname;



@end
