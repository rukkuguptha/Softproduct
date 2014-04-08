//
//  subheadermarkmodel.h
//  Newproject
//
//  Created by GMSIndia 2 on 07/04/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface subheadermarkmodel : NSObject


@property(readwrite)NSInteger EntrySubId;

@property(readwrite)NSInteger MainId;


@property(strong,nonatomic)NSString *SubHeader;
@property(strong,nonatomic)NSString *VariablePercent;

@property(strong,nonatomic)NSString *FixedDollar;


@property(strong,nonatomic)NSString *ST;

@property(strong,nonatomic)NSString *OT;

@property(strong,nonatomic)NSString *RCIP;

@property(strong,nonatomic)NSString *Selected;

@property(strong,nonatomic)NSString *OTDoll;




@end
