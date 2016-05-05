//
//  ViewController.h
//  PostFrameworkIssue
//
//  Created by Narendra Verma on 5/3/16.
//  Copyright © 2016 Punchh. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController
@property (weak) IBOutlet NSTextFieldCell *txtAppName;
@property (weak) IBOutlet NSTextFieldCell *txtModule;
@property (weak) IBOutlet NSTextFieldCell *txtViewController;
@property (weak) IBOutlet NSTextFieldCell *txtVDescription;
@property (weak) IBOutlet NSTextFieldCell *txtRedminIssueNumber;

- (IBAction)btnPostTapped:(id)sender;

@end

