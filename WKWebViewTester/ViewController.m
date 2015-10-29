//
//  ViewController.m
//  WKWebViewTester
//
//  Created by Shane Brinkman-Davis on 10/29/15.
//  Copyright © 2015 Imikimi LLC. All rights reserved.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>


@interface ViewController ()
@property (nonatomic, strong, readwrite) UIView* engineWebView;

@end

@implementation ViewController

- (NSString*)pathForResource:(NSString*)resourcepath
{
    NSBundle* mainBundle = [NSBundle mainBundle];
    NSString* directoryStr = @"www";

    return [mainBundle pathForResource:resourcepath ofType:@"" inDirectory:directoryStr];
}

- (NSURL*)appUrl
{
    NSString* startPage = @"index.html";
    NSString* startFilePath = [self pathForResource:startPage];
    
    NSURL* appURL = [NSURL fileURLWithPath:startFilePath];
    NSLog(@"appURL: %@", appURL);
    return appURL;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    WKUserContentController* userContentController = [[WKUserContentController alloc] init];
    
    WKWebViewConfiguration* configuration = [[WKWebViewConfiguration alloc] init];
    configuration.userContentController = userContentController;
    
    WKWebView* wkWebView = [[WKWebView alloc] initWithFrame:self.view.frame configuration:configuration];
    self.engineWebView = wkWebView;
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[self appUrl]];
    [wkWebView loadRequest:request];
    [self.view addSubview:wkWebView];
}

@end
