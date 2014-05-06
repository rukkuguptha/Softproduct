//
//  NumbrSerMdl.h
//  Newproject
//
//  Created by GMSIndia1 on 3/27/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NumbrSerMdl : NSObject
@property(readwrite)NSInteger JobSequenceId;
@property(strong,nonatomic)NSString *JobTask;
@property(strong,nonatomic)NSString *SkillId;
@property(strong,nonatomic)NSString *SequenceNumber;


@end
