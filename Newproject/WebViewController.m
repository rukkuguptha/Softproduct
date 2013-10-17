//
//  WebViewController.m
//  Newproject
//
//  Created by GMSIndia 2 on 16/10/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
     [self.view addSubview:_webview];
    _activity=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    UIBarButtonItem*barbutton=[[UIBarButtonItem alloc]initWithCustomView:_activity];
    
    
    [self.navigationItem setRightBarButtonItem:barbutton];

    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
   NSString *header=@"http://";
    NSString *urlstring=[NSString stringWithFormat:@"%@%@",header,_docpdf];

    NSLog(@"reportname%@",urlstring);
    NSURL *targetURL = [NSURL URLWithString:urlstring];
    NSURLRequest *request = [NSURLRequest requestWithURL:targetURL];
    [_webview loadRequest:request];

    
      [self.view addSubview:_webview];
//    //_webview= [[UIWebView alloc] initWithFrame:CGRectMake(10, 10, 200, 200)];
//    NSString *path = [[NSBundle mainBundle] pathForResource:urlstring ofType:nil];
//    NSURL *targetURL = [NSURL fileURLWithPath:path];
//    NSURLRequest *request = [NSURLRequest requestWithURL:targetURL];
//    [_webview loadRequest:request];
    
  
       
}
- (void)webViewDidStartLoad:(UIWebView *)webView{
    [_activity startAnimating];

}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [_activity stopAnimating];
    _activity.hidden=YES;

}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
   
    
    NSLog(@"ef%@",error);

}



@end
