//
//  custbranchmodel.h
//  Newproject
//
//  Created by GMSIndia 2 on 24/03/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface custbranchmodel : NSObject
@property(readwrite)NSInteger branchid;
@property(strong,nonatomic)NSString *branchname;
@property(strong,nonatomic)NSString *branchaddress;
@property(strong,nonatomic)NSString *phone;
@property(strong,nonatomic)NSString *fax;
@property(strong,nonatomic)NSString *email;

@end
