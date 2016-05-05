//
//  NUOrderOnlineManager.h
//  freebirds
//
//  Created by Narendra Verma on 2/5/16.
//  Copyright © 2016 Punchh. All rights reserved.
//

//#import "AFHTTPRequestOperationManager.h"
#import <AFNetworking/AFHTTPRequestOperationManager.h>
@interface NUOrderOnlineManager : AFHTTPRequestOperationManager
@property (strong, nonatomic ) AFHTTPRequestOperationManager * slackPost;
+ (NUOrderOnlineManager *) sharedManage;

- (void) slackPost:(NSDictionary *)dict;
- (void) postMessageonSlack:(NSString *)AppName
                 moduleName:(NSString *)moduleName
             viewController:(NSString *)viewController
                description:(NSString *)desc
                issuenumber:(NSString *)issuenumber;
@end
