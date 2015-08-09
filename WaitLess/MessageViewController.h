//
//  MessageViewController.h
//  WaitLess
//
//  Created by Hing Huynh on 8/8/15.
//  Copyright (c) 2015 waitless. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MessageViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *numberButton;
@property (weak, nonatomic) IBOutlet UIButton *sendButton;
@property (weak, nonatomic) IBOutlet UITextField *messageField;

- (IBAction)sendAction:(id)sender;
- (IBAction)numberButtonAction:(id)sender;
@end
