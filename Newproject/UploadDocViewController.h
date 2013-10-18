//
//  UploadDocViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 9/26/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "Base64.h"
#import "WebViewController.h"
@class PDFImageConverter;

@interface UploadDocViewController : UIViewController<UIImagePickerControllerDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>{
    BOOL  recordResults;
}

@property(strong,nonatomic)NSString*Unitstring;
/*Dictionary*/

@property(strong,nonatomic)NSMutableDictionary*DocumentDictionary;

/*Arrays*/
@property(strong,nonatomic)NSArray*DoculistArray;
@property (readwrite)NSInteger applicantid;
@property (strong, nonatomic) IBOutlet UIImageView *imageview;

@property (strong, nonatomic)NSString*encodedstring;

/*popover*/
@property(strong,nonatomic)UIPopoverController *popOverController;
@property(strong,nonatomic)UITableView *popOverTableView;

/*xmlparse*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;

@property (strong, nonatomic) IBOutlet UITextField *docnametxt;


@property (strong, nonatomic) NSString*ssnstring;
@property (nonatomic) BOOL newMedia;
@property(strong,nonatomic)NSString *doc;
@property(strong,nonatomic)WebViewController *webctrl;
@property (strong, nonatomic) IBOutlet UIButton *popoverbtnlbl;

- (IBAction)prevewbtn:(id)sender;

- (IBAction)uploadbtn:(id)sender;

- (IBAction)popoverbtn:(id)sender;
@end
