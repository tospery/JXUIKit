//
//  JXDWebViewProgressView.h
//  MyJLRoutes
//
//  Created by 杨建祥 on 2019/12/29.
//  Copyright © 2019 杨建祥. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JXDWebViewProgressView : UIView
@property (nonatomic, assign) CGFloat progress;
@property (nonatomic, assign) NSTimeInterval barAnimationDuration;  // default 0.1
@property (nonatomic, assign) NSTimeInterval fadeAnimationDuration; // default 0.27
@property (nonatomic, assign) NSTimeInterval fadeOutDelay;          // default 0.1
@property (nonatomic, strong) UIView *progressBarView;

- (void)setProgress:(CGFloat)progress animated:(BOOL)animated;

@end

NS_ASSUME_NONNULL_END
