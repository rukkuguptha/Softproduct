//
//  ActivityViewController.m
//  Newproject
//
//  Created by GMSIndia1 on 6/17/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import "ActivityViewController.h"

@interface ActivityViewController ()

@end

@implementation ActivityViewController



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
    _scroll.frame=CGRectMake(0, 0, 1024,708);
    [_scroll setContentSize:CGSizeMake(1024,760)];
    _activityTable.layer.borderWidth = 2.0;
    _activityTable.layer.borderColor = [UIColor colorWithRed:210.0/255.0f green:230.0/255.0f blue:450.0/255.0f alpha:1.0f].CGColor;
    self.navigationController.navigationBar.tintColor=[UIColor blackColor];
    self.newviewactivity.hidden=YES;
     _view2.backgroundColor=[UIColor colorWithRed:227.0/255.0f green:240.0/255.0f blue:247.0/255.0f alpha:1.0f];
    _activityNav.tintColor=[UIColor colorWithRed:227.0/255.0f green:240.0/255.0f blue:247.0/255.0f alpha:1.0f];
   _btnArray=[[NSMutableArray alloc]initWithObjects:@"New Activity",@"Edit Activity",@"Delete Activity" ,nil];
    _popoverArray=[[NSMutableArray alloc]initWithObjects:@"Follow Up", nil];
    self.navigationController.navigationBar.tintColor=[UIColor grayColor];
       // Do any additional setup after loading the view from its nib.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
   
    
    
    UIBarButtonItem*addbtn=[[UIBarButtonItem alloc]initWithTitle:@"ADD" style:UIBarButtonItemStylePlain target:self action:@selector(addaction)];
    UIBarButtonItem*editbtn=[[UIBarButtonItem alloc]initWithTitle:@"DELETE" style:UIBarButtonItemStylePlain target:self action:@selector(editaction)];
    NSArray*barbutns=[[NSArray alloc]initWithObjects:addbtn,editbtn, nil];
    [self.navigationItem setRightBarButtonItems:barbutns animated:YES];

    
    
}
-(void)editaction{
    
    if ([self.activityTable isEditing]) {
        // If the tableView is already in edit mode, turn it off. Also change the title of the button to reflect the intended verb (‘Edit’, in this case).
        
        [self.activityTable setEditing:NO animated:YES];
        //[_Editbtn setTitle:@"Edit"forState:UIControlStateNormal];
    }
    else {
        // [_Editbtn setTitle:@"Done"forState:UIControlStateNormal];
        
        // Turn on edit mode
        
        [self.activityTable setEditing:YES animated:YES];
    }
}




-(void)butnaction{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"EDIT"
                                                             delegate:self
                                                    cancelButtonTitle:nil
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:nil];
    for (NSString *fruit in self.btnArray) {
        [actionSheet addButtonWithTitle:fruit];
    }
    actionSheet.cancelButtonIndex = [actionSheet addButtonWithTitle:@"Cancel"];
    [actionSheet showInView:self.view];
    
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSString *buttonTitle = [actionSheet buttonTitleAtIndex:buttonIndex];
    if  ([buttonTitle isEqualToString:@"Edit Leads"]) {
        NSLog(@"Destructive pressed --> Delete Something");
    }
    if ([buttonTitle isEqualToString:@"New Activity"]) {
        _newviewactivity.hidden=NO;
        // self.leadTable.userInteractionEnabled=NO;
    }
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    // Return the number of rows in the section.
    if (tableView==_popOverTableView) {
        return [_popoverArray count];
        
    }
    else{
    return 3;
    }
    return YES;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        if (tableView==_activityTable) {

        [[NSBundle mainBundle]loadNibNamed:@"ActivityCustomCell" owner:self options:nil];
        cell=_actvityCell;
        }
        
    }
    //cell.textLabel.text=@"Leads";
      if (tableView==_popOverTableView) {
          cell.textLabel.font = [UIFont fontWithName:@"Helvetica Neue Light" size:12];
          cell.textLabel.font = [UIFont systemFontOfSize:12.0];

          cell.textLabel.text=[_popoverArray objectAtIndex:indexPath.row];
      }
    return cell;
    
    
}

#pragma mark - Table View delegate
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //alternating cell back ground color
    if (indexPath.row%2 == 0) {
        [cell setBackgroundColor:[UIColor whiteColor]];
    }else
    {
        
        //[cell setBackgroundColor:[UIColor colorWithRed:247.0/255.0f green:247.0/255.0f blue:247.0/255.0f alpha:1.0f]];
        
        [cell setBackgroundColor:[UIColor colorWithRed:227.0/255.0f green:240.0/255.0f blue:247.0/255.0f alpha:1.0f]];

            }
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView==_popOverTableView) {
        
        if (indexPath.row==0) {
            
            if (!self.followupVCtrl) {
                self.followupVCtrl=[[FollowupViewController alloc]initWithNibName:@"FollowupViewController" bundle:nil];
            }
            [self.navigationController pushViewController:self.followupVCtrl animated:YES];
            
        }

        

    }
    
       [self.popOverController dismissPopoverAnimated:YES];
    
}




#pragma mark - Calendar
-(void)createCalenderPopover
{
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 315, 330)];
    
    popoverView.backgroundColor = [UIColor lightTextColor];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(315, 330);
    
    CKCalendarView *calendar = [[CKCalendarView alloc] initWithStartDay:startMonday];
    self.calendar = calendar;
    calendar.delegate = self;
    
    
    NSDate *date = [NSDate date];
    
    // format it
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
    [dateFormat setDateFormat:@"dd/MM/YYYY"];
    
    // convert it to a string
    NSString *dateString = [dateFormat stringFromDate:date];
    //NSLog(@"datestring%@",dateString);
    
    self.dateFormatter = [[NSDateFormatter alloc] init];
    [self.dateFormatter setDateFormat:@"dd/MM/yyyy"];
    
    calendar.selectedDate = [self.dateFormatter dateFromString:dateString];
    
    calendar.minimumDate = [self.dateFormatter dateFromString:@"09/07/2011"];
    calendar.maximumDate = [self.dateFormatter dateFromString:@"1/07/2013"];
    calendar.shouldFillCalendar = YES;
    calendar.adaptHeightToNumberOfWeeksInMonth = NO;
    
    calendar.frame = CGRectMake(10, 10, 300, 320);
    [popoverView addSubview:calendar];
    
       
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(localeDidChange) name:NSCurrentLocaleDidChangeNotification object:nil];
    
    
    //create a popover controller
    self.popOverController = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    [self.popOverController presentPopoverFromRect:_dateBtn.frame
                                            inView:self.newviewactivity
                          permittedArrowDirections:UIPopoverArrowDirectionUp
                                          animated:YES];
    
}
  


- (void)localeDidChange {
    [self.calendar setLocale:[NSLocale currentLocale]];
}



#pragma mark - CKCalendarDelegate

- (void)calendar:(CKCalendarView *)calendar didSelectDate:(NSDate *)date {
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
    [dateFormat setDateFormat:@"MM/dd/YYYY"];
    
    NSString *dateString = [dateFormat stringFromDate:date];
    [_dateBtn setTitle:dateString forState:UIControlStateNormal];
    
}



#pragma mark - Buttons

-(IBAction)addNewActivity:(id)sender
{
    self.newviewactivity.hidden=NO;
}
-(IBAction)closetheView:(id)sender
{
    self.newviewactivity.hidden=YES;
}



-(IBAction)selectDate:(id)sender
{
    [self createCalenderPopover];
}


-(void)addaction {
    _newviewactivity.hidden=NO;
}

- (IBAction)editcellbtn:(id)sender
{
    _newviewactivity.hidden=NO;
}

- (IBAction)disbtn:(id)sender {
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 120, 70)];
    
    popoverView.backgroundColor = [UIColor whiteColor];
    _popOverTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 120, 70)];
    
    _popOverTableView.delegate=(id)self;
    _popOverTableView.dataSource=(id)self;
    _popOverTableView.rowHeight= 32;
    _popOverTableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    
    
       [popoverView addSubview:_popOverTableView];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(120, 70);
    
    //create a popover controller
    
    self.popOverController = [[UIPopoverController alloc]
                              initWithContentViewController:popoverContent];
    
       
    UIButton *button = (UIButton *)sender;
    
    UITableViewCell *cell = (UITableViewCell *)[[button superview] superview];
    UITableView *table = (UITableView *)[cell superview];
    NSIndexPath *IndexPath = [table indexPathForCell:cell];
    
    
    
    
    [self.popOverController presentPopoverFromRect:_disbtnlbl.frame
                                            inView:cell
                          permittedArrowDirections:UIPopoverArrowDirectionLeft
                                          animated:YES];
    

    
    
}




@end
