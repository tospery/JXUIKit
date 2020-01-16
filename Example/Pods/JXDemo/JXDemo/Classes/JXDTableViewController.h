//
//  JXDTableViewController.h
//  MyJLRoutes
//
//  Created by 杨建祥 on 2019/12/29.
//  Copyright © 2019 杨建祥. All rights reserved.
//

#import "JXDBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface JXDTableViewController : JXDBaseViewController <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) NSArray *items;

- (Class)cellClass;

@end

NS_ASSUME_NONNULL_END
