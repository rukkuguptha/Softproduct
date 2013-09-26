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

@interface UploadDocViewController : UIViewController<UIImagePickerControllerDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (strong, nonatomic) IBOutlet UIImageView *imageview;
@property (nonatomic) BOOL newMedia;

@end
