//
//  UIWindow+JXDemo.m
//  JXDemo
//
//  Created by 杨建祥 on 2019/12/29.
//

#import "UIWindow+JXDemo.h"

@implementation UIWindow (JXDemo)
- (UIEdgeInsets)jxd_safeArea {
    UIEdgeInsets safeArea = UIEdgeInsetsMake(20, 0, 0, 0);
    if (@available(iOS 11.0, *)) {
        safeArea = UIApplication.sharedApplication.delegate.window.safeAreaInsets;
    }
    return safeArea;
}

- (CGFloat)jxd_safeTop {
    return self.jxd_safeArea.top;
}

- (CGFloat)jxd_safeBottom {
    return self.jxd_safeArea.bottom;
}

@end
