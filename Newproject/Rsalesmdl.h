//
//  Rsalesmdl.h
//  Newproject
//
//  Created by GMSIndia1 on 3/25/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Rsalesmdl : NSObject
@property(readwrite)NSInteger entryid;
@property(strong,nonatomic)NSString *CustomerCode;
@property(strong,nonatomic)NSString *EmpId;
@property(strong,nonatomic)NSString *EmpName;
@property(strong,nonatomic)NSString *PhoneOffice;
@property(strong,nonatomic)NSString *Extension;
@property(strong,nonatomic)NSString *Mobile;
@property(strong,nonatomic)NSString *Email;


@end
