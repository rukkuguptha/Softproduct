//
//  AllDetailsplandisplayViewController.m
//  Newproject
//
//  Created by GMSIndia 2 on 24/02/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import "AllDetailsplandisplayViewController.h"

@interface AllDetailsplandisplayViewController ()

@end

@implementation AllDetailsplandisplayViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        UIPanGestureRecognizer* panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanning:)];
        panGesture.delegate=self;
        [self.tuchgview addGestureRecognizer:panGesture];
        //[self.view addSubview:self.tuchgview];

    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.subtypetable.layer.borderWidth=3.0;
    self.subtypetable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    self.maintable.layer.borderWidth=3.0;
    self.maintable.layer.borderColor=[UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark-tableview datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
      return 5;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
        if (tableView==_subtypetable) {
            [[NSBundle mainBundle]loadNibNamed:@"Subtypecell" owner:self options:nil];
            cell=_subtypecell;
            
        }
        if (tableView==_maintable) {
            [[NSBundle mainBundle]loadNibNamed:@"maintablecell" owner:self options:nil];

            cell=_maintblecell;
        }

        cell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:12];

    }
  
   
    
    return cell;
}

-(IBAction)clsebtn:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark-drag&drop

- (void)handlePanning:(UIPanGestureRecognizer *)gestureRecognizer
{
    switch ([gestureRecognizer state]) {
        case UIGestureRecognizerStateBegan:
            [self startDragging:gestureRecognizer];
            break;
        case UIGestureRecognizerStateChanged:
            [self doDrag:gestureRecognizer];
            break;
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateFailed:
            [self stopDragging:gestureRecognizer];
            break;
        default:
            break;
    }
}
#pragma mark -
#pragma mark Helper methods for initialization


- (void)initDraggedCellWithCell:(UITableViewCell *)cell AtPoint:(CGPoint)point
{
    // get rid of old cell, if it wasn't disposed already
    if(draggedCell != nil)
    {
        [draggedCell removeFromSuperview];
        // [draggedCell release];
        draggedCell = nil;
    }
    
    draggedCell=_subtypecell;
//    CGRect frame = CGRectMake(point.x, point.y, cell.frame.size.width, cell.frame.size.height);
//    
//    draggedCell = [[WorkersCell alloc] init];
//    draggedCell.selectionStyle = UITableViewCellSelectionStyleGray;
//    draggedCell.textLabel.text =[NSString stringWithFormat:@"%@         %@",cell.cell1.text,cell.cell2.text];
//    
//    
//    draggedCell.textLabel.textColor = cell.textLabel.textColor;
//    draggedCell.highlighted = YES;
//    draggedCell.frame = frame;
//    draggedCell.alpha = 0.8;
    
    [self.view addSubview:draggedCell];
}

#pragma mark -
#pragma mark Helper methods for dragging

- (void)startDragging:(UIPanGestureRecognizer *)gestureRecognizer
{
    CGPoint pointInSrc = [gestureRecognizer locationInView:_subtypetable];
    CGPoint pointInDst = [gestureRecognizer locationInView:_maintable];
    
    if([_subtypetable pointInside:pointInSrc withEvent:nil])
    {
        [self startDraggingFromSrcAtPoint:pointInSrc];
        dragFromSource = YES;
    }
    else if([_maintable pointInside:pointInDst withEvent:nil])
    {
        [self startDraggingFromDstAtPoint:pointInDst];
        dragFromSource = NO;
    }
}

- (void)startDraggingFromSrcAtPoint:(CGPoint)point
{
    NSIndexPath* indexPath = [_subtypetable indexPathForRowAtPoint:point];
    UITableViewCell* cell = [_subtypetable cellForRowAtIndexPath:indexPath];
    if(cell != nil)
    {
        CGPoint origin = cell.frame.origin;
        origin.x += _subtypetable.frame.origin.x;
        origin.y += _subtypetable.frame.origin.y;
        
        [self initDraggedCellWithCell:cell AtPoint:origin];
        cell.highlighted = NO;
        
//        if(draggedData != nil)
//        {
//            //[draggedData release];
//            draggedData = nil;
//        }
//        draggedData = [srcData objectAtIndex:indexPath.row];
    }
}

- (void)startDraggingFromDstAtPoint:(CGPoint)point
{
    NSIndexPath* indexPath = [_maintable indexPathForRowAtPoint:point];
    UITableViewCell* cell = [_maintable cellForRowAtIndexPath:indexPath];
    if(cell != nil)
    {
        CGPoint origin = cell.frame.origin;
        origin.x += droparea.frame.origin.x;
        origin.y += droparea.frame.origin.y;
        
        [self initDraggedCellWithCell:cell AtPoint:origin];
        cell.highlighted = NO;
        
//        if(draggedData != nil)
//        {
//            //[draggedData release];
//            draggedData = nil;
//        }
//        draggedData = [dstData objectAtIndex:indexPath.row];
        
        // remove old cell
        //[dstData removeObjectAtIndex:indexPath.row];
        [_maintable deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationMiddle];
        pathFromDstTable = indexPath;
        
//        [UIView animateWithDuration:0.2 animations:^
//         {
//             CGRect frame = dstTableView.frame;
//             frame.size.height = kCellHeight * [dstData count];
//             _maintable.frame = frame;
//         }];
        
    }
}

- (void)doDrag:(UIPanGestureRecognizer *)gestureRecognizer
{
    if(draggedCell != nil && draggedData != nil)
    {
        CGPoint translation = [gestureRecognizer translationInView:[draggedCell superview]];
        [draggedCell setCenter:CGPointMake([draggedCell center].x + translation.x,
                                           [draggedCell center].y + translation.y)];
        [gestureRecognizer setTranslation:CGPointZero inView:[draggedCell superview]];
    }
}

- (void)stopDragging:(UIPanGestureRecognizer *)gestureRecognizer
{
    if(draggedCell != nil && draggedData != nil)
    {
        if([gestureRecognizer state] == UIGestureRecognizerStateEnded
           && [droparea pointInside:[gestureRecognizer locationInView:droparea] withEvent:nil])
        {
            NSIndexPath* indexPath = [_maintable indexPathForRowAtPoint:[gestureRecognizer locationInView:_maintable]];
            if(indexPath != nil)
            {
               // [dstData insertObject:draggedData atIndex:indexPath.row];
                [_maintable insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationMiddle];
            }
            else
            {
               // [dstData addObject:draggedData];
                [_maintable reloadData];
            }
        }
        else if(!dragFromSource && pathFromDstTable != nil)
        {
            // insert cell back where it came from
            //[dstData insertObject:draggedData atIndex:pathFromDstTable.row];
            [_maintable insertRowsAtIndexPaths:[NSArray arrayWithObject:pathFromDstTable] withRowAnimation:UITableViewRowAnimationMiddle];
            
            //[pathFromDstTable release];
            pathFromDstTable = nil;
        }
        
//        [UIView animateWithDuration:0.3 animations:^
//         {
//             CGRect frame = dstTableView.frame;
//             frame.size.height = kCellHeight * [dstData count];
//             _maintable.frame = frame;
//         }];
        
        [draggedCell removeFromSuperview];
        //[draggedCell release];
        draggedCell = nil;
        
        //[draggedData release];
        draggedData = nil;
    }
}

@end
