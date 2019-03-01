//
//  ViewController.m
//  alert应用
//
//  Created by mx1614 on 2/22/19.
//  Copyright © 2019 ludy. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}

- (NSAlert *)alert
{
    if(!_alert)
    {
        _alert = [[NSAlert alloc] init];
        _alert.messageText = @"温馨提示";
        _alert.informativeText = @"这是一个警告!";
        _alert.icon = [NSImage imageNamed:@"2"];
        [_alert addButtonWithTitle:@"第一个按钮"];
        [_alert addButtonWithTitle:@"第二个按钮"];
        _alert.showsHelp = YES;
        _alert.delegate = self;
        _alert.alertStyle = NSAlertStyleWarning;
        _alert.helpAnchor = @"哈哈哈";
        _alert.showsSuppressionButton = YES;
        _alert.suppressionButton.target = self;
        _alert.suppressionButton.action = @selector(handleSuppressionButton:);
        _alert.suppressionButton.title = @"hasdljfoi";
        NSImageView *image = [[NSImageView alloc] initWithFrame:NSMakeRect(20, 20, 5, 5)];
        image.image = [NSImage imageNamed:@"2"];
        _alert.accessoryView = image;
    }
    return _alert;
}

- (void)handleSuppressionButton:(NSButton *)button
{
    NSLog(@"hello");
}

- (BOOL)alertShowHelp:(NSAlert *)alert
{
    [[NSWorkspace sharedWorkspace] openURL:[NSURL URLWithString:@"http://www.baidu.com"]];
    return YES;
}

- (IBAction)handleAlert:(id)sender {
    
    [self.alert beginSheetModalForWindow:self.view.window completionHandler:^(NSModalResponse returnCode) {
        for (NSButton *btn in _alert.buttons) {
            NSLog(@"__%@",btn.title);
        }
    }];
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
