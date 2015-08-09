//
//  meMessageCell.m
//  WaitLess
//
//  Created by Hing Huynh on 8/8/15.
//  Copyright (c) 2015 waitless. All rights reserved.
//

#import "meMessageCell.h"

@implementation meMessageCell

- (void)awakeFromNib {
    [_nameLabel.layer setCornerRadius:25.0f];
    _nameLabel.layer.masksToBounds = YES;
    [_messageView.layer setCornerRadius:6.0f];
    _messageView.layer.masksToBounds = YES;
}

- (void)configureCell:(NSString*) message {
    _messageLabel.text = message;
}

@end
