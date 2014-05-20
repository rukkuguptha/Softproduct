//
//  myscroll.m
//  Newproject
//
//  Created by GMSIndia1 on 5/20/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "myscroll.h"

@implementation myscroll

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.frame=CGRectMake(0, 0,768, 939);
        self.contentSize=CGSizeMake(768,1400);
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
