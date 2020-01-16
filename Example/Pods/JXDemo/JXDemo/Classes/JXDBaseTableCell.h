//
//  JXDBaseTableCell.h
//  MyJLRoutes
//
//  Created by 杨建祥 on 2019/12/29.
//  Copyright © 2019 杨建祥. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JXDBaseTableCell : UITableViewCell
@property (nonatomic, strong) id item;

+ (NSString *)identifier;
+ (CGFloat)heightForItem:(id)item;

@end

NS_ASSUME_NONNULL_END
