//
//  Markupmainmodel.h
//  Newproject
//
//  Created by GMSIndia 2 on 04/04/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Markupmainmodel : NSObject

@property(readwrite)NSInteger EntryId;

@property(readwrite)NSInteger MarkupID;


@property(strong,nonatomic)NSString *VariablePercent;

@property(strong,nonatomic)NSString *FixedDollar;


@property(strong,nonatomic)NSString *MainHeader;

@property(strong,nonatomic)NSString *STPer;

@property(strong,nonatomic)NSString *STDoll;

@property(strong,nonatomic)NSString *OTPer;

@property(strong,nonatomic)NSString *OTDoll;



@end
