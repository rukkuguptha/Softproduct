//
//  CommentsViewController.h
//  Newproject
//
//  Created by GMSIndia1 on 6/21/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommentsViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIScrollView *scrollview;
@property(strong,nonatomic)IBOutlet UITableView *commentTable;
@property(strong,nonatomic)IBOutlet UITableViewCell *commentcell;
@property(strong,nonatomic)IBOutlet UITextView *cmntTextView;
@property(strong,nonatomic)IBOutlet UITextView *commenttextfortable;
-(IBAction)saveComment:(id)sender;
-(IBAction)cancelcomment:(id)sender;
@property(strong,nonatomic)NSMutableArray *commentArray;
@end
