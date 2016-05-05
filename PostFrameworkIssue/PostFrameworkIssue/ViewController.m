//
//  ViewController.m
//  PostFrameworkIssue
//
//  Created by Narendra Verma on 5/3/16.
//  Copyright © 2016 Punchh. All rights reserved.
//

#import "ViewController.h"
#import "NUOrderOnlineManager.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (IBAction)btnPostTapped:(id)sender {
    if ([self isValid]) {
        [[NUOrderOnlineManager sharedManage] postMessageonSlack:_txtAppName.stringValue
                                                     moduleName:_txtModule.stringValue
                                                 viewController:_txtViewController.stringValue
                                                    description:_txtVDescription.stringValue
                                                    issuenumber:_txtRedminIssueNumber.stringValue];
    }
}

- (BOOL) isValid {
    NSArray * array = @[self.txtAppName,self.txtModule,_txtViewController,self.txtVDescription,self.txtRedminIssueNumber];
    
    for (NSTextFieldCell * text in array) {
        if (!text.stringValue.length) {
            return NO;
        }
    }
    return YES;
}
@end
