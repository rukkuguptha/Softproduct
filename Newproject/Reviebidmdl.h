//
//  Reviebidmdl.h
//  Newproject
//
//  Created by GMSIndia 2 on 01/07/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Reviebidmdl : NSObject
@property(strong,nonatomic)NSString *BidTableId;
@property(strong,nonatomic)NSString *BidId;
@property(strong,nonatomic)NSString *EstimationId;
@property(strong,nonatomic)NSString *Estimation;
@property(strong,nonatomic)NSString *ItemCode;
@property(strong,nonatomic)NSString *mDescription;
@property(strong,nonatomic)NSString *TotalUnitCost;
@property(strong,nonatomic)NSString *TotalQty;
@property(strong,nonatomic)NSString *TotalST;
@property(strong,nonatomic)NSString *TotalOT;
@property(strong,nonatomic)NSString *TotalSTRate;
@property(strong,nonatomic)NSString *TotalOTRate;
@property(strong,nonatomic)NSString *TotalSTOTSum;
@property(strong,nonatomic)NSString *BidMType;
@property(strong,nonatomic)NSString *Type;

/*for cost*/
@property(strong,nonatomic)NSString *bidreviewid;
@property(strong,nonatomic)NSString *name;
@property(strong,nonatomic)NSString *cost;


@end
