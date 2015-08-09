//
//  QueueViewController.h
//  WaitLess
//
//  Created by Hing Huynh on 8/8/15.
//  Copyright (c) 2015 waitless. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QueueViewController : UIViewController

@property (nonatomic, strong) IBOutletCollection(UIImageView) NSArray *personViews;
@property (weak, nonatomic) IBOutlet UIButton *lineButton;
@property (weak, nonatomic) IBOutlet UILabel *minsLabel;


- (IBAction)getInLine:(id)sender;

@end
