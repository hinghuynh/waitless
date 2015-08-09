//
//  DataManager.h
//  WaitLess
//
//  Created by Hing Huynh on 8/8/15.
//  Copyright (c) 2015 waitless. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataManager : NSObject

@property (nonatomic,strong) NSString *sessionId;
@property (nonatomic, assign) int position;
@property (nonatomic, assign) int delay;
@property (nonatomic, assign) int size;

+ (void)getSessionWithString:(NSString*)string completion:(void (^)(BOOL succeeded, NSError *error))completion;
+ (void)getQueueData:(void (^)(int position, int delay, int size, NSError *error))completion;

+ (id)sharedManager;

@end
