;//
//  NUOrderOnlineManager.m
//  freebirds
//
//  Created by Narendra Verma on 2/5/16.
//  Copyright © 2016 Punchh. All rights reserved.
//

#import "NUOrderOnlineManager.h"
@implementation NUOrderOnlineManager
+ (instancetype) sharedManage {
    static dispatch_once_t oncePredicate = 0;
    __strong static NUOrderOnlineManager *_sharedInstance = nil;
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[self alloc] initWithBaseURL:[NSURL URLWithString:@"https://hooks.slack.com/services"]];
    });
    return _sharedInstance;
}

-(instancetype) initWithBaseURL:(NSURL *)url {
    if (self = [super initWithBaseURL:url]) {
        self.responseSerializer = [AFHTTPResponseSerializer serializer];
        self.securityPolicy.allowInvalidCertificates = true;
        [self.slackPost.requestSerializer setValue:@"text/html"
                                forHTTPHeaderField:@"coding-compliant"];
    }
    return self;
}

- (void) postMessageonSlack:(NSString *)AppName
                 moduleName:(NSString *)moduleName
               viewController:(NSString *)viewController
                description:(NSString *)desc
                issuenumber:(NSString *)issuenumber {
    NSMutableArray * arrayAttributs = [NSMutableArray array];
    [arrayAttributs addObject:@{@"fields": @[@{@"title": @"App Name",
                                               @"value": AppName,
                                               @"short": @"true"},
                                             @{@"title": @"Module",
                                               @"value": moduleName,
                                               @"short": @"true"},
                                             @{@"title": @"ViewController",
                                               @"value": viewController,
                                               @"short": @"true"},
                                             @{@"title": @"Issue Number",
                                               @"title_link": @"https://api.slack.com/",
                                               @"value": issuenumber,
                                               @"short": @"true"},
                                             @{@"title": @"Description",
                                               @"value": desc,
                                               @"short": @"0"}],
                                @"color": @"#F35A00"}];
    NSDictionary * dict = @{@"text":@"Framework Issue",
                            @"attachments": arrayAttributs};
    [self slackPost:dict];
}

- (void) slackPost:(NSDictionary *)dict {
    [self POST:@"<SlackHookID>"
     parameters:@{@"payload" : [self postString:dict]}
     success:^(AFHTTPRequestOperation *operation, id responseObject) {
         NSLog(@"response : %@",operation.responseString);
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"%@response : %@",error,operation.responseString);
     }];
}

- (NSString *) postString:(NSDictionary *)dict {
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:nil];
    return [[NSString alloc] initWithData:jsonData
                                 encoding:NSUTF8StringEncoding];
}
@end
