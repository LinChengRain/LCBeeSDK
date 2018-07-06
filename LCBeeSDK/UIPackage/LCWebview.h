//
//  LCWebview.h
//  LCWebView
//
//  Created by Changlin Yu on 2016/12/2.
//  Copyright © 2016年 ChangLin Yu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

@class LCWebview;
@protocol LCWebviewDelegate <NSObject>
@optional
- (void)lcWebview:(LCWebview* )webview didFinishLoadingURL:(NSURL *)URL title:(NSString *)title;
- (void)lcWebview:(LCWebview* )webview didFailToLoadURL:(NSURL *)URL error:(NSError *)error;
- (void)lcWebview:(LCWebview* )webview shouldStartLoadWithURL:(NSURL *)URL;
- (void)lcWebviewDidStartLoad:(LCWebview *)webview;

@end
@interface LCWebview : UIView<WKNavigationDelegate, WKUIDelegate, UIWebViewDelegate>

#pragma mark - Public Properties
//zlcdelegate
@property (nonatomic, weak) id <LCWebviewDelegate> delegate;

// The main and only UIProgressView
@property (nonatomic, strong) UIProgressView *progressView;
//@property (nonatomic, assign) BOOL isaddObserver;

// The web views
// Depending on the version of iOS, one of these will be set
@property (nonatomic, strong) WKWebView *wkWebView;
@property (nonatomic, strong) UIWebView *webView;
#pragma mark - Initializers view
- (instancetype)initWithFrame:(CGRect)frame;


#pragma mark - Static Initializers
@property (nonatomic, strong) UIBarButtonItem *actionButton;
@property (nonatomic, strong) UIColor *tintColor;
@property (nonatomic, strong) UIColor *barTintColor;
@property (nonatomic, assign) BOOL actionButtonHidden;
@property (nonatomic, assign) BOOL showsURLInNavigationBar;
@property (nonatomic, assign) BOOL showsPageTitleInNavigationBar;
//Allow for custom activities in the browser by populating this optional array
@property (nonatomic, strong) NSArray *customActivityItems;

#pragma mark - Public Interface


// Load a NSURLURLRequest to web view
// Can be called any time after initialization
- (void)loadRequest:(NSURLRequest *)request;

// Load a NSURL to web view
// Can be called any time after initialization
- (void)loadURL:(NSURL *)URL;

// Loads a URL as NSString to web view
// Can be called any time after initialization
- (void)loadURLString:(NSString *)URLString;


// Loads an string containing HTML to web view
// Can be called any time after initialization
- (void)loadHTMLString:(NSString *)HTMLString;


@end
