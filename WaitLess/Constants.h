//
//  Constants.h
//  UUTC-iOS
//
//  Created by Hing Huynh on 6/16/15.
//  Copyright (c) 2015 moback, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString * const kCurrentProgram = @"currentProgram";

// Color
#define mainColor [UIColor colorWithRed:0.176f green:0.216f blue:0.251f alpha:1.00f]
#define secondaryColor [UIColor colorWithRed:0.667f green:0.200f blue:0.392f alpha:1.00f]
#define fontColor [UIColor colorWithRed:0.859f green:0.867f blue:0.871f alpha:1.00f]
#define secondaryFontColor [UIColor whiteColor]
#define darkColor [UIColor blackColor]
#define selectedColor [UIColor colorWithRed:0.663f green:0.192f blue:0.388f alpha:1.00f]
#define tableBackgroundColor [UIColor colorWithRed:234.0 green:232.0 blue:233.0 alpha:1.0]
#define resumeBackgroundColor [UIColor colorWithRed:227.0 green:228.0 blue:226.0 alpha:1.0]

// Device Type
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_RETINA ([[UIScreen mainScreen] scale] >= 2.0)

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))

#define IS_IPHONE_4_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
#define IS_IPHONE_5 (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE_6 (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE_6P (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)

// Font
static NSString * const HELVETICA = @"Helvetica";
static NSString * const HELVETICA_LIGHT = @"Helvetica-Light";
static NSString * const HELVETICA_HEAVY = @"Helvetica-Bold";

// Notification
static NSString * const kRevealSelectedItemIndexKey = @"revealSelectedItemIndexKey";
static NSString * const kUpdateRevealSelectedItemNotification = @"UpdateRevealSelectedItemNotification";

#pragma mark - UITableViewCellIdentifiers
static NSString * const leftPanelTableViewCellIdentifier = @"LeftPanelCellIdentifier";
static NSString * const rightPanelTableViewCellIdentifier = @"RightPanelCellIdentifier";
static NSString * const rightHeaderTableViewCellIdentifier = @"RightHeaderCellIdentifier";
static NSString * const leftHeaderTableViewCellIdentifier = @"LeftHeaderCellIdentifier";
static NSString * const leftSearchBarIdentifier = @"LeftSearchBarCellIdentifier";
static NSString * const subNavigationTableViewCellIdentifier = @"SubNavigationTableViewCellIdentifier";
static NSString * const mainTableViewCellIdentifier = @"UTTCMainTableViewCellIdentifier";
static NSString * const discussionTableViewCellIdentifier = @"UTTCDiscussionTableViewCellIdentifier";
static NSString * const messageTableViewCellIdentifier = @"MessageTableViewCellIdentifier";
static NSString * const inboxTableViewCellIdentifier = @"InboxTableViewCellIdentifier";
static NSString * const contactTableViewCellIdentifier = @"ContactTableViewCellIdentifier";
static NSString * const profileTableViewCellIdentifier = @"ProfileTableViewCellIdentifier";
static NSString * const notificationSettingsTableViewCellIdentifier = @"NotificationSettingsTableViewCellIdentifier";
static NSString * const resumeTopTableViewCellIdentifier = @"ResumeTopTableViewCellIdentifier";
static NSString * const resumeMiddleTableViewCellIdentifier = @"ResumeMiddleTableViewCellIdentifier";
static NSString * const resumeBottomTableViewCellIdentifier = @"ResumeBottomTableViewCellIdentifier";
static NSString * const jobSearchTableViewCellIdentifier = @"JobSearchTableViewCellIdentifier";
static NSString * const jobResultTableViewCellIdentifier = @"JobResultTableViewCellIdentifier";

static NSString * const resourcesTableViewCellIdentifier = @"ResourcesTableViewCellIdentifier";

#pragma mark - Segue Identifier
static NSString * const mainControllerIdentifier = @"mainControllerIdentifier";

static NSString * const signupControllerIdentifier = @"SignupViewControllerIdentifier";
static NSString * const resetPasswordViewControllerIdentifier = @"ResetPasswordViewControllerIdentifier";

static NSString * const newsFeedControllerIdentifier = @"NewsFeedViewControllerIdentifier";
//static NSString * const programsControllerIdentifier = @"ProgramsControllerIdentifier";

static NSString * const messagesControllerIdentifier = @"ViewWithSubHeaderControllerIdentifier";
static NSString * const careersControllerIdentifier = @"ViewWithSubHeaderControllerIdentifier";
static NSString * const jobFinderControllerIdentifier = @"ViewWithSubHeaderControllerIdentifier";
static NSString * const favoriteItemsViewControllerIdentifier = @"FavoriteItemsViewControllerIdentifier";
static NSString * const settingControllerIdentifier = @"SettingViewControllerIdentifier";
static NSString * const discussionControllerIdentifier = @"DiscussionViewController";
