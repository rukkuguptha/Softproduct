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
#import "myscroll.h"
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
@property(readwrite) NSInteger tabtype;
@property(strong,nonatomic)MyLineDrawingView*mylineview;
@property(strong,nonatomic)myscroll *newscroll;
/*outlets*/
@property (strong, nonatomic) IBOutlet UIImageView *mainimg;
@property (strong, nonatomic) IBOutlet UIImageView *tempimg;
@property (strong, nonatomic) IBOutlet UIView *newview;
@property(strong,nonatomic)UITextField *textField;
@property (strong, nonatomic) IBOutlet UIScrollView *scroll;


/*variables*/
@property (strong, nonatomic)NSString*planid;
@property (strong, nonatomic)NSString*savename;
@property(strong,nonatomic)NSData*basedata;
@property(strong,nonatomic)NSString*encodedString;



/*Xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;

- (IBAction)clsebtn:(id)sender;
- (IBAction)deletebtn:(id)sender;
- (IBAction)savebtn:(id)sender;

@end
