//
//  Timesheetmdl.h
//  Newproject
//
//  Created by Riya on 7/7/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Timesheetmdl : NSObject
@property(strong,nonatomic)NSString *entryid;
@property(strong,nonatomic)NSString *jobnumber;
@property(strong,nonatomic)NSString *tsdate;
@property(strong,nonatomic)NSString *timein;
@property(strong,nonatomic)NSString *timeout;
@property(strong,nonatomic)NSString *foremanid;
@property(strong,nonatomic)NSString *foremanname;
@property(strong,nonatomic)NSString *employeeid;
@property(strong,nonatomic)NSString *employeename;
@property(strong,nonatomic)NSString *phase;
@property(strong,nonatomic)NSString *phasename;
@property(strong,nonatomic)NSString *service;
@property(strong,nonatomic)NSString *sequenceid;
@property(strong,nonatomic)NSString *sequencename;
@property(strong,nonatomic)NSString *equipmentid;
@property(strong,nonatomic)NSString *equipmentname;
@property(strong,nonatomic)NSString *workid;
@property(strong,nonatomic)NSString *purcseid;
@end
