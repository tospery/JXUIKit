//
//  NSString+JXDemo.h
//  MyJLRoutes
//
//  Created by 杨建祥 on 2019/12/29.
//  Copyright © 2019 杨建祥. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (JXDemo)
- (NSString *)jxd_urlEncoded;
- (NSString *)jxd_urlDecoded;
- (NSString *)jxd_urlComponentEncoded;
- (NSString *)jxd_urlComponentDecoded;

@end

NS_ASSUME_NONNULL_END
