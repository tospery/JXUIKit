//
//  UIWindow+JXDemo.h
//  JXDemo
//
//  Created by 杨建祥 on 2019/12/29.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIWindow (JXDemo)
@property (nonatomic, assign, readonly) UIEdgeInsets jxd_safeArea;
@property (nonatomic, assign, readonly) CGFloat jxd_safeTop;
@property (nonatomic, assign, readonly) CGFloat jxd_safeBottom;

@end

NS_ASSUME_NONNULL_END
