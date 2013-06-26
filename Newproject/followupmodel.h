//
//  followupmodel.h
//  Newproject
//
//  Created by GMSIndia1 on 6/25/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface followupmodel : NSObject{
  }

@property(readwrite)NSInteger ComId;
@property(strong,nonatomic)NSString*headline;
@property(strong,nonatomic)NSString*LeadLink;
@property(strong,nonatomic)NSString*OrgContact;
@property(strong,nonatomic)NSString*DateContact;
@property(strong,nonatomic)NSString*TimeContact;
@property(strong,nonatomic)NSString*Summary;
@property(readwrite)NSInteger activityId;






@end
