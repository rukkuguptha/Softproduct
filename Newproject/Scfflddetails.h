//
//  Scfflddetails.h
//  Newproject
//
//  Created by GMSIndia1 on 3/4/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Scfflddetails : NSObject

@property(readwrite)NSInteger scaffolddetailid;
@property(strong,nonatomic)NSString * scfldprevious;
@property(readwrite)NSString * subscaffid;
@property(strong,nonatomic)NSString *length;
@property(strong,nonatomic)NSString *width;
@property(strong,nonatomic)NSString *height;
@property(strong,nonatomic)NSString *numb;
@property(strong,nonatomic)NSString *ManHoures;
@property(strong,nonatomic)NSString *ErectHoures;
@property(strong,nonatomic)NSString *DesmandleHoures;

@end
