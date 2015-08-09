//
//  QueueViewController.m
//  WaitLess
//
//  Created by Hing Huynh on 8/8/15.
//  Copyright (c) 2015 waitless. All rights reserved.
//

#import "QueueViewController.h"
#import "DataManager.h"

@interface QueueViewController()

@property (nonatomic, assign) BOOL inLine;
@property (nonatomic, assign) int position;
@property (nonatomic, strong) DataManager *dataManager;
@end

@implementation QueueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[self navigationController] setNavigationBarHidden:NO animated:NO];
    _lineButton.backgroundColor = [UIColor colorWithRed:0.231f green:0.478f blue:0.859f alpha:1.00f];
    [DataManager getQueueData:^(int position, int delay, int size, NSError *error){
        if (!error){
            [self updateFirstViewWithMins:delay andPosition:position andSize:size-1];
        }
    }];
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    UIImage *actualImage = [UIImage imageNamed:@"logo_sub_screen.png"];
    UIImageView *attachmentImageNew = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, actualImage.size.width/2, actualImage.size.height/2)];
    attachmentImageNew.image = actualImage;
    attachmentImageNew.contentMode = UIViewContentModeScaleAspectFit;
    
    self.navigationItem.titleView = attachmentImageNew;
}


- (void) setSelectedPerson:(int)index {
    for (UIImageView *person in _personViews){
        if (person.tag == index){
            person.image = [person.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
            [person setTintColor:[UIColor blueColor]];
        } else {
            person.image = [person.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
            [person setTintColor:[UIColor whiteColor]];
        }
        
    }
}

- (IBAction)getInLine:(id)sender {
    if (_inLine){
        NSLog(@"hsasd");

        [self setSelectedPerson:20];
        _lineButton.backgroundColor = [UIColor colorWithRed:0.231f green:0.478f blue:0.859f alpha:1.00f];
        [_lineButton setTitle:@"GET IN LINE" forState:UIControlStateNormal];
        _inLine = NO;

    } else {
        NSLog(@"d1wqcq");
        [DataManager getQueueData:^(int position, int delay, int size, NSError *error){
            if (!error){
                [self updateViewWithMins:delay andPosition:position andSize:size];
            }
        }];
        
        _lineButton.backgroundColor = [UIColor colorWithRed:0.537f green:0.537f blue:0.537f alpha:1.00f];
        [_lineButton setTitle:@"GET OUT OF LINE" forState:UIControlStateNormal];
        _inLine = YES;
        [self startTimer];
    }
}

- (void) setSize:(int)size {
    for (UIImageView *person in _personViews){
        if (person.tag < size){
            person.hidden = NO;
        } else {
            person.hidden = YES;
        }
        
    }
}

- (void)updateViewWithMins:(int)mins andPosition:(int)position andSize:(int)size{
    [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         _minsLabel.text = [NSString stringWithFormat:@"%d",mins];
                         [self setSize:size];
                         [self setSelectedPerson:position];

                     }
                     completion:nil];
    
}

- (void)updateFirstViewWithMins:(int)mins andPosition:(int)position andSize:(int)size{
    [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         _minsLabel.text = [NSString stringWithFormat:@"%d",mins];
                         [self setSize:size];
                     }
                     completion:nil];
    
}

-(void) startTimer {
    [NSTimer scheduledTimerWithTimeInterval:1.0
                                     target:self
                                   selector:@selector(onTick:)
                                   userInfo:nil
                                    repeats:YES];
}

-(void)onTick:(NSTimer *)timer {
    [DataManager getQueueData:^(int position, int delay, int size, NSError *error){
        if (!error){
            [self updateViewWithMins:delay andPosition:position andSize:size];
        }
    }];
}

@end
