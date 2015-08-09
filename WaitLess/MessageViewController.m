//
//  MessageViewController.m
//  WaitLess
//
//  Created by Hing Huynh on 8/8/15.
//  Copyright (c) 2015 waitless. All rights reserved.
//

#import "MessageViewController.h"
#import "businessCell.h"
#import "botMessageCell.h"
#import "meMessageCell.h"
#import "Constants.h"

@interface MessageViewController ()<UITableViewDataSource,UITableViewDelegate, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, assign) BOOL numberShown;

@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[self navigationController] setNavigationBarHidden:NO animated:NO];
    [_numberButton.layer setCornerRadius:6.0f];
    [_numberButton.layer setBorderColor: [UIColor colorWithRed:0.475f green:0.827f blue:0.161f alpha:1.00f].CGColor];
    _numberButton.layer.borderWidth = 2.0f;
    _dataSource = [[NSMutableArray alloc]init];
    _dataSource = [@[@"businessCell",@"Hey Nick, what is troubling you today?"]mutableCopy];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _messageField.delegate = self;
    [_tableView reloadData];
    
    UIImage *actualImage = [UIImage imageNamed:@"logo_sub_screen.png"];
    UIImageView *attachmentImageNew = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, actualImage.size.width/2, actualImage.size.height/2)];
    attachmentImageNew.image = actualImage;
    attachmentImageNew.contentMode = UIViewContentModeScaleAspectFit;
    
    self.navigationItem.titleView = attachmentImageNew;

    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];

//    self.tableView.estimatedRowHeight = 50;
//    self.tableView.rowHeight = UITableViewAutomaticDimension;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"indexpath: %ld", (long)indexPath.row);
    UITableViewCell *cell;
    if (indexPath.row == 0){
        businessCell *newCell = (businessCell *)[_tableView dequeueReusableCellWithIdentifier: @"businessCell" forIndexPath:indexPath];
        cell = newCell;
    } else if (indexPath.row == 1){
        botMessageCell *newCell = [_tableView dequeueReusableCellWithIdentifier: @"botMessageCell" forIndexPath:indexPath];
        [newCell configureCell:_dataSource[indexPath.row]];
        cell = newCell;
        
    } else {
        meMessageCell *newCell = [_tableView dequeueReusableCellWithIdentifier: @"meMessageCell" forIndexPath:indexPath];
        [newCell configureCell:_dataSource[indexPath.row]];
        cell = newCell;
    }
    
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_dataSource count];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
    if (IS_IPHONE_4_OR_LESS || IS_IPHONE_5){
        [UIView animateWithDuration:0.3 animations:^{
            CGRect theFrame = self.view.frame;
            theFrame.size.height -= 253;
            [self.view setFrame:theFrame];
        }];
        
    } else {
        [UIView animateWithDuration:0.3 animations:^{
            CGRect theFrame = self.view.frame;
            theFrame.size.height -= 283;
            [self.view setFrame:theFrame];
        }];
    }
    [self scrollToBottom];
    return YES;
}

-(void)scrollToBottom {
    if (_dataSource.count > 0) {
        double delayInSeconds = 0.1;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            if (_dataSource.count > 0)
                [_tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:_dataSource.count-1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
        });
    }
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    if (IS_IPHONE_4_OR_LESS || IS_IPHONE_5){
        
        [UIView animateWithDuration:0.3 animations:^{
            CGRect theFrame = self.view.frame;
            theFrame.size.height += 253;
            [self.view setFrame:theFrame];
        }];
    }
    else {
        [UIView animateWithDuration:0.3 animations:^{
            CGRect theFrame = self.view.frame;
            theFrame.size.height += 258;
            [self.view setFrame:theFrame];
        }];
    }
    return YES;
}

- (IBAction)sendAction:(id)sender {
    [self.view endEditing:YES];
    [_dataSource addObject:_messageField.text];
    _messageField.text = @"";
    [_tableView reloadData];
    [self scrollToBottom];
}

- (IBAction)numberButtonAction:(id)sender {
    if (_numberShown){
        [_dataSource removeLastObject];
        [_tableView reloadData];
        [_numberButton setTitle:@"leave your number" forState:UIControlStateNormal];
        _numberShown = NO;

    } else {
        [_dataSource addObject:@"(650)253-7019"];
        [_tableView reloadData];
        [self scrollToBottom];
        [_numberButton setTitle:@"remove your number" forState:UIControlStateNormal];
        _numberShown = YES;
    }
  }
@end
