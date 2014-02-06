

#import "SectionHeaderView.h"
#import <QuartzCore/QuartzCore.h>

@implementation SectionHeaderView


@synthesize titleLabel=_titleLabel, disclosureButton=_disclosureButton, delegate=_delegate, section=_section;


+ (Class)layerClass {
    
    return [CAGradientLayer class];
}


-(id)initWithFrame:(CGRect)frame title:(NSString*)title section:(NSInteger)sectionNumber delegate:(id <SectionHeaderViewDelegate>)delegate {
    
    self = [super initWithFrame:frame];
    
    if (self != nil) {
        
        // Set up the tap gesture recognizer.
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(toggleOpen:)];
        [self addGestureRecognizer:tapGesture];

        _delegate = delegate;        
        self.userInteractionEnabled = YES;
        
        //create and configure detail button
        UIButton *detailbtn = [UIButton buttonWithType:UIButtonTypeCustom];
        detailbtn.frame = CGRectMake(15.0, 5.0, 35.0, 35.0);
        [detailbtn setImage:[UIImage imageNamed:@"carat.png"] forState:UIControlStateNormal];
        [detailbtn setImage:[UIImage imageNamed:@"carat-open.png"] forState:UIControlStateSelected];
        [detailbtn addTarget:self action:@selector(toggleOpen:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:detailbtn];
        _DetailButton = detailbtn;

        
        // Create and configure the title label.
        _section = sectionNumber;
        CGRect titleLabelFrame = self.bounds;
        titleLabelFrame.origin.x += 80.0;
        titleLabelFrame.size.width -= 35.0;
        CGRectInset(titleLabelFrame, 0.0, 5.0);
        UILabel *label = [[UILabel alloc] initWithFrame:titleLabelFrame];
        label.text = title;
        label.font = [UIFont fontWithName:@"Helvetica Neue" size:12];
        
        label.textColor = [UIColor blackColor];
        label.backgroundColor = [UIColor clearColor];
        //label.layer.borderColor=[UIColor blackColor].CGColor;
        //label.layer.borderWidth=0.5;

        [self addSubview:label];
        _titleLabel = label;
        
        
        // Create and configure the disclosure button.
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(210.0, 5.0, 35.0, 35.0);
        [button setImage:[UIImage imageNamed:@"carat.png"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"carat-open.png"] forState:UIControlStateSelected];
        //[button addTarget:self action:@selector(toggleOpen:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        _disclosureButton = button;
        
       
//       //create Namelabel
//        UILabel *namelabel = [[UILabel alloc] initWithFrame:CGRectMake(220, 0.0, 210, 45)];
//        namelabel.text = title;
//        namelabel.font = [UIFont boldSystemFontOfSize:17.0];
//        namelabel.textColor = [UIColor blackColor];
//        namelabel.backgroundColor = [UIColor clearColor];
//        //label.layer.borderColor=[UIColor blackColor].CGColor;
//        //label.layer.borderWidth=0.5;
//        
//        [self addSubview:namelabel];
//        _nameLabel = namelabel;

        
        
        // Set the colors for the gradient layer.
//        static NSMutableArray *colors = nil;
//        if (colors == nil) {
//            colors = [[NSMutableArray alloc] initWithCapacity:3];
//            UIColor *color = nil;
//             color = [UIColor whiteColor];
//            // color = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
//            [colors addObject:(id)[color CGColor]];
//             color = [UIColor whiteColor];
//            color = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
//          
//            [colors addObject:(id)[color CGColor]];
//            //color = [UIColor whiteColor];
//            color = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f];
//            [colors addObject:(id)[color CGColor]];
//        }
//        [(CAGradientLayer *)self.layer setColors:colors];
//        [(CAGradientLayer *)self.layer setLocations:[NSArray arrayWithObjects:[NSNumber numberWithFloat:0.0], [NSNumber numberWithFloat:0.48], [NSNumber numberWithFloat:1.0], nil]];
    }
    
    return self;
}


-(IBAction)toggleOpen:(id)sender {
    
    [self toggleOpenWithUserAction:YES];
}


-(void)toggleOpenWithUserAction:(BOOL)userAction {
    
    // Toggle the disclosure button state.
    self.DetailButton.selected = !self.DetailButton.selected;
    
    // If this was a user action, send the delegate the appropriate message.
    if (userAction) {
        if (self.DetailButton.selected) {
            if ([self.delegate respondsToSelector:@selector(sectionHeaderView:sectionOpened:)]) {
                [self.delegate sectionHeaderView:self sectionOpened:self.section];
            }
        }
        else {
            if ([self.delegate respondsToSelector:@selector(sectionHeaderView:sectionClosed:)]) {
                [self.delegate sectionHeaderView:self sectionClosed:self.section];
            }
        }
    }
}




@end
