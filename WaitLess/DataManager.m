//
//  DataManager.m
//  WaitLess
//
//  Created by Hing Huynh on 8/8/15.
//  Copyright (c) 2015 waitless. All rights reserved.
//

#import "DataManager.h"
#import <AFNetworking/AFNetworking.h>
@implementation DataManager

+ (id)sharedManager {
    static DataManager *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}
//- (id)init {
//    if (self = [super init]) {
//        _sessionId = [[NSString alloc] initWithString:@"Default Property Value"];
//    }
//    return self;
//}

+ (void)getSessionWithString:(NSString*)string completion:(void (^)(BOOL succeeded, NSError *error))completion {
    
    NSString *urlString = [NSString stringWithFormat:@"http://waitless-1031.appspot.com/api/session/start?company_name=%@", string];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    AFHTTPResponseSerializer *serializer = [AFHTTPResponseSerializer serializer];
    
    serializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    manager.responseSerializer = serializer;
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    
    [manager GET:urlString parameters:nil
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             
             NSError* error = nil;
             NSArray* json = [NSJSONSerialization
                              JSONObjectWithData:responseObject
                              
                              options:kNilOptions
                              error:&error];
             NSDictionary *responseDict = (NSDictionary*)json;

             DataManager *dataManager = [DataManager sharedManager];
        
             dataManager.sessionId = responseDict[@"session_id"];
              NSLog(@"json data = %@", dataManager.sessionId);
             completion(YES,nil);

             
         }
         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             NSLog(@"json data = %@",error);
             completion(YES,nil);
//
//             UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error"
//                                                                 message:[error localizedDescription]
//                                                                delegate:nil
//                                                       cancelButtonTitle:@"Ok"
//                                                       otherButtonTitles:nil];
//             [alertView show];
         }];
}

+ (void)getQueueData:(void (^)(int position, int delay, int size, NSError *error))completion {
    DataManager *dataManager = [DataManager sharedManager];

    NSString *urlString = [NSString stringWithFormat:@"http://waitless-1031.appspot.com/api/session/status?session_id=%@", dataManager.sessionId];
    NSLog(@"url: %@",urlString);

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    AFHTTPResponseSerializer *serializer = [AFHTTPResponseSerializer serializer];
    
    serializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    manager.responseSerializer = serializer;
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    
    [manager GET:urlString parameters:nil
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             
             NSError* error = nil;
             NSArray* json = [NSJSONSerialization
                              JSONObjectWithData:responseObject
                              
                              options:kNilOptions
                              error:&error];
             NSDictionary *responseDict = (NSDictionary*)json;
             
             NSLog(@"json data = %@",responseDict);
             dataManager.position = [responseDict[@"position"]intValue];
             dataManager.delay = [responseDict[@"delay"]intValue];
             dataManager.size = [responseDict[@"size"]intValue];

             completion([responseDict[@"position"]intValue],[responseDict[@"delay"]intValue],[responseDict[@"size"]intValue], nil);
         }
         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             NSLog(@"json data = %@",error);
             completion(0,0,0, error);
//             UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error"
//                                                                 message:[error localizedDescription]
//                                                                delegate:nil
//                                                       cancelButtonTitle:@"Ok"
//                                                       otherButtonTitles:nil];
//             [alertView show];
         }];


}
@end
