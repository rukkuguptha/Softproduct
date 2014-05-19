//
//  DrawingViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 5/19/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Base64.h"
#include "MyLineDrawingView.h"
#import <QuartzCore/QuartzCore.h>
@interface DrawingViewController : UIViewController{
    BOOL recordResults;
    CGPoint lastPoint;
    CGFloat red;
    CGFloat green;
    CGFloat blue;
    CGFloat brush;
    CGFloat opacity;
    BOOL mouseSwiped;
    NSInteger btnclick;
    UIBezierPath *myPath;
    //UIColor *brushPattern;
    NSInteger  path;

}

@property(strong,nonatomic)MyLineDrawingView*mylineview;
@property (strong, nonatomic) IBOutlet UIImageView *mainimg;
@property (strong, nonatomic) IBOutlet UIImageView *tempimg;
@property (strong, nonatomic) IBOutlet UIView *newview;

- (IBAction)clsebtn:(id)sender;
- (IBAction)deletebtn:(id)sender;

@end
