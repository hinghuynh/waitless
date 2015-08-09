//
//  SearchViewController.m
//  WaitLess
//
//  Created by Hing Huynh on 8/8/15.
//  Copyright (c) 2015 waitless. All rights reserved.
//

#import "SearchViewController.h"
#import "SVProgressHUD.h"

@interface SearchViewController ()

@property (weak, nonatomic) IBOutlet UITextField *searchField;
@property (weak, nonatomic) IBOutlet UIButton *serviceButton;

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_searchField.layer setCornerRadius:7.0f];
    [_searchField.layer setBorderColor: [UIColor whiteColor].CGColor];
    _searchField.layer.borderWidth = 2.0f;
    UIColor *color = [UIColor whiteColor];
    _searchField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"please enter company name" attributes:@{NSForegroundColorAttributeName: color}];
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    _searchField.leftView = paddingView;
    _searchField.leftViewMode = UITextFieldViewModeAlways;
    
    [_serviceButton.layer setCornerRadius:50.0f];
    [_serviceButton.layer setBorderColor:[UIColor colorWithRed:0.494f green:0.831f blue:0.227f alpha:1.00f].CGColor];
    _serviceButton.layer.borderWidth = 2.0f;
    [[self navigationController] setNavigationBarHidden:YES animated:NO];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
}
- (void) viewDidAppear:(BOOL)animated {
    [[self navigationController] setNavigationBarHidden:YES animated:NO];
}
- (IBAction)serviceAction:(id)sender {
    [SVProgressHUD show];
    dispatch_async(dispatch_queue_create("fetchTradesPostData", 0), ^(){
        [DataManager getSessionWithString:_searchField.text completion:^(BOOL succeeded, NSError *error){
            dispatch_async(dispatch_get_main_queue(), ^(){
                [SVProgressHUD dismiss];
                if (succeeded){
                    [self performSegueWithIdentifier:@"joinQueueSegue" sender:self];
                }
            });
        }];
    });
}

-(void)dismissKeyboard {
    [_searchField resignFirstResponder];
}
@end
