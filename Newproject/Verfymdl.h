//
//  Verfymdl.h
//  Newproject
//
//  Created by GMSIndia1 on 9/27/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Verfymdl : NSObject
@property(strong,nonatomic)NSString*firstname;
@property(strong,nonatomic)NSString*lastname;
@property(strong,nonatomic)NSString*ssn;
@property(strong,nonatomic)NSString*Phonenumber;
@property(readwrite)NSInteger applicantid;

@property(readwrite)NSInteger Selectedapplicantid;

@property(strong,nonatomic)NSString*middlename;
@property(strong,nonatomic)NSString*suffix;
@property(strong,nonatomic)NSString*address;
@property(strong,nonatomic)NSString*city;
@property(strong,nonatomic)NSString*state;
@property(strong,nonatomic)NSString*zip;
@property(strong,nonatomic)NSString*jobsiteid;
@property(strong,nonatomic)NSString*craftid;
@property(strong,nonatomic)NSString*ssnstatus;
@property(strong,nonatomic)NSString*i9status;
@property(strong,nonatomic)NSString*bgstatus;

@end
