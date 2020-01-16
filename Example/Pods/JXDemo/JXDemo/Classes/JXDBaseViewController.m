//
//  JXDBaseViewController.m
//  MyJLRoutes
//
//  Created by 杨建祥 on 2019/12/29.
//  Copyright © 2019 杨建祥. All rights reserved.
//

#import "JXDBaseViewController.h"
#import "JXDWebViewController.h"
#import "UIImage+JXDemo.h"

@interface JXDBaseViewController ()
@property (nonatomic, strong, readwrite) NSDictionary *params;

@end

@implementation JXDBaseViewController
- (instancetype)initWithParams:(NSDictionary *)params {
    if (self = [super init]) {
        self.params = params;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.extendedLayoutIncludesOpaqueBars = YES;
    self.edgesForExtendedLayout = UIRectEdgeAll;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSString *title = self.params[@"title"];
    if (title.length != 0) {
        self.navigationItem.title = title;
    }
    
    if (self.navigationController.viewControllers.count > 1) {
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage jxd_imageInBundle:@"JXDemo/jxd_nav_back"] style:UIBarButtonItemStylePlain target:self action:@selector(backItemPressed:)];
    }
    
    NSString *ref = self.params[@"ref"];
    if (ref.length != 0) {
        UIBarButtonItem *refItem = [[UIBarButtonItem alloc] initWithTitle:@"参考" style:UIBarButtonItemStylePlain target:self action:@selector(refItemPressed:)];
        self.navigationItem.rightBarButtonItem = refItem;
    }
}

- (void)backItemPressed:(id)sender {
    if (self.navigationController.viewControllers.count > 1) {
        [self.navigationController popViewControllerAnimated:YES];
    }else {
        [self dismissViewControllerAnimated:YES completion:NULL];
    }
}

- (void)refItemPressed:(id)sender {
    NSString *ref = self.params[@"ref"];
    if (ref.length != 0) {
        JXDWebViewController *webVC = [[JXDWebViewController alloc] init];
        webVC.urlString = ref;
        [self.navigationController pushViewController:webVC animated:YES];
    }
}

@end
