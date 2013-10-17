//
//  WebViewController.h
//  Newproject
//
//  Created by GMSIndia 2 on 16/10/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController<UIWebViewDelegate>

@property (strong, nonatomic) IBOutlet UIWebView *webview;
@property(strong,nonatomic)NSString*docpdf;
@property(strong,nonatomic)IBOutlet UIActivityIndicatorView *activity;
@end
