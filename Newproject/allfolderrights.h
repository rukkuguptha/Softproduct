//
//  allfolderrights.h
//  Newproject
//
//  Created by GMSIndia 2 on 31/12/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface allfolderrights : NSObject
@property(readwrite)NSInteger userid;
@property(strong,nonatomic)NSString *username;
@property(readwrite)NSInteger create;
@property(readwrite)NSInteger del;
@property(readwrite)NSInteger upload;
@property(readwrite)NSInteger dwnld;

@end
