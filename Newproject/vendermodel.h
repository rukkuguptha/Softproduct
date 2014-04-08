//
//  vendermodel.h
//  Newproject
//
//  Created by GMSIndia 2 on 06/03/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface vendermodel : NSObject

@property(readwrite)NSInteger VEntryId;
@property(readwrite)NSInteger VendorId;
@property(readwrite)NSInteger ItemId;
@property(strong,nonatomic)NSString *vendorname;
@property(strong,nonatomic)NSString *vendoraddress;
@property(strong,nonatomic)NSString *vendorphone;
@property(strong,nonatomic)NSString *vendorrate;

@end
