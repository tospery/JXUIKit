//
//  UIApplication+JXDemo.m
//  Pods
//
//  Created by 杨建祥 on 2020/1/1.
//

#import "UIApplication+JXDemo.h"

@implementation UIApplication (JXDemo)
- (NSString *)jxd_displayName {
    return [NSBundle.mainBundle.infoDictionary objectForKey:@"CFBundleDisplayName"];
}

@end
