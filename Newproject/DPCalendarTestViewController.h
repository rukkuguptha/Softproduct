//
//  DPCalendarTestViewController.h
//  DPCalendar
//
//  Created by Ethan Fang on 19/12/13.
//  Copyright (c) 2013 Ethan Fang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalEventDetailViewController.h"

@interface DPCalendarTestViewController : UINavigationController<UIActionSheetDelegate>{
    BOOL recordResults;
    NSString*previoustitle;

}
@property(strong,nonatomic)CalEventDetailViewController * calctrl;
@property(strong,nonatomic)NSDate*previousdate;
/*xmlParser*/
@property(strong,nonatomic)NSMutableData *webData;
@property(strong,nonatomic)NSMutableString *soapresults;
@property(strong,nonatomic)NSXMLParser *xmlparser;

/*Arrays*/
@property(strong,nonatomic)NSMutableArray *datearray;
@property(strong,nonatomic)NSMutableArray *titlearray;
@property(strong,nonatomic)NSMutableArray *sumarray;
@property(strong,nonatomic)NSMutableArray *eventdatearray;


@end
