//
//  NSString+JXDemo.m
//  MyJLRoutes
//
//  Created by 杨建祥 on 2019/12/29.
//  Copyright © 2019 杨建祥. All rights reserved.
//

#import "NSString+JXDemo.h"

@implementation NSString (JXDemo)
- (NSString *)jxd_urlEncoded {
    NSString *str = [self jxd_urlDecoded]; // 避免两次encode
    #pragma clang diagnostic push
    #pragma clang diagnostic ignored "-Wdeprecated-declarations"
    #pragma clang diagnostic pop
    return CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(NULL, (__bridge CFStringRef)str, NULL, NULL, kCFStringEncodingUTF8));
    #pragma clang diagnostic push
}

- (NSString *)jxd_urlDecoded {
    #pragma clang diagnostic push
    #pragma clang diagnostic ignored "-Wdeprecated-declarations"
    return CFBridgingRelease(CFURLCreateStringByReplacingPercentEscapesUsingEncoding(NULL, (__bridge CFStringRef)self, CFSTR(""), kCFStringEncodingUTF8));
    #pragma clang diagnostic pop
}

- (NSString *)jxd_urlComponentEncoded {
    NSString *str = [self jxd_urlComponentDecoded]; // 避免两次encode
    #pragma clang diagnostic push
    #pragma clang diagnostic ignored "-Wdeprecated-declarations"
    return CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(NULL,(__bridge CFStringRef)str, NULL,(CFStringRef)@":/?#[]@!$ &'()*+,;=\"<>%{}|\\^~`",kCFStringEncodingUTF8));
    #pragma clang diagnostic pop
}

- (NSString *)jxd_urlComponentDecoded {
    return [self jxd_urlDecoded];
}

@end
