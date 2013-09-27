//
//  Empdetails.h
//  Newproject
//
//  Created by GMSIndia1 on 9/27/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Empdetails : NSObject
@property(strong,nonatomic)NSString*firstname;
@property(strong,nonatomic)NSString*lastname;
@property(strong,nonatomic)NSString*ssn;
@property(strong,nonatomic)NSString*Phonenumber;
@property(readwrite)NSInteger *applicantid;


@end
