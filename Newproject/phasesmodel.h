//
//  phasesmodel.h
//  Newproject
//
//  Created by GMSIndia 2 on 01/01/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface phasesmodel : NSObject
@property(readwrite)NSInteger idvalue;
@property(strong,nonatomic)NSString *phasename;
@property(readwrite)NSInteger servideid;
@property(readwrite)NSInteger parent;
@property(readwrite)NSInteger phaseid;
@property(strong,nonatomic)NSString *servicename;
@property(strong,nonatomic)NSString *underof;



@end
