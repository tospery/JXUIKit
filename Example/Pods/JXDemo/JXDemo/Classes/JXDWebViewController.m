//
//  JXDWebViewController.m
//  MyJLRoutes
//
//  Created by 杨建祥 on 2019/12/29.
//  Copyright © 2019 杨建祥. All rights reserved.
//

#import "JXDWebViewController.h"
#import "JXDWebViewProgressView.h"
#import "UIView+JXDemo.h"
#import "NSURL+JXDemo.h"

#define kJXDEstimatedProgress          (@"estimatedProgress")

@interface JXDWebViewController ()
@property (nonatomic, strong, readwrite) WKWebView *webView;
@property (nonatomic, strong) JXDWebViewProgressView *progressView;

@end

@implementation JXDWebViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.webView];
    [self.view addSubview:self.progressView];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL jxd_urlWithString:self.urlString] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20];
    [self.webView loadRequest:request];
}

- (void)dealloc {
    if (_webView) {
        [_webView removeObserver:self forKeyPath:kJXDEstimatedProgress];
        _webView.navigationDelegate = nil;
        _webView.UIDelegate = nil;
    }
    _webView = nil;
}

- (WKWebView *)webView {
    if (!_webView) {
        WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc] init];
        WKWebView *webView = [[WKWebView alloc] initWithFrame:self.view.bounds configuration:configuration];
        webView.navigationDelegate = self;
        webView.UIDelegate = self;
        [webView addObserver:self forKeyPath:kJXDEstimatedProgress options:NSKeyValueObservingOptionNew context:nil];
        _webView = webView;
    }
    return _webView;
}

- (JXDWebViewProgressView *)progressView {
    if (!_progressView) {
        JXDWebViewProgressView *progressView = [[JXDWebViewProgressView alloc] initWithFrame:CGRectMake(0, 0, self.view.jxd_width, 1.5f)];
        progressView.progressBarView.backgroundColor = [UIColor greenColor];
        progressView.progress = 0.0f;
        _progressView = progressView;
    }
    return _progressView;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:kJXDEstimatedProgress]) {
        float progress = self.webView.estimatedProgress;
        if (progress > 0) {
            self.progressView.hidden = NO;
        }
        [self.progressView setProgress:progress animated:YES];
        
        if (self.progressView.progress == 1) {
            __weak typeof(self) weakSelf = self;
            [UIView animateWithDuration:0.25f delay:0.3f options:UIViewAnimationOptionCurveEaseOut animations:^{
                __strong typeof(weakSelf) strongSelf = weakSelf;
                strongSelf.progressView.transform = CGAffineTransformMakeScale(1.0f, 1.4f);
            } completion:^(BOOL finished) {
                __strong typeof(weakSelf) strongSelf = weakSelf;
                strongSelf.progressView.hidden = YES;
            }];
        }
        
        if (self.navigationItem.title.length == 0) {
            __weak typeof(self) weakSelf = self;
            [self.webView evaluateJavaScript:@"document.title" completionHandler:^(NSString *title, NSError *error) {
                __strong typeof(weakSelf) strongSelf = weakSelf;
                strongSelf.navigationItem.title = title;
            }];
        }
    }else{
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

- (void)updateProgress:(CGFloat)progress {
    [self.progressView setProgress:progress animated:YES];
    if (self.navigationItem.title.length == 0) {
        __weak typeof(self) weakSelf = self;
        [self.webView evaluateJavaScript:@"document.title" completionHandler:^(NSString *title, NSError *error) {
            __strong typeof(weakSelf) strongSelf = weakSelf;
            strongSelf.navigationItem.title = title;
        }];
    }
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    decisionHandler(WKNavigationActionPolicyAllow);
}

@end
