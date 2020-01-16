//
//  JXDTableViewController.m
//  MyJLRoutes
//
//  Created by 杨建祥 on 2019/12/29.
//  Copyright © 2019 杨建祥. All rights reserved.
//

#import "JXDTableViewController.h"
#import "JXDBaseTableCell.h"
#import "UIView+JXDemo.h"
#import "UIWindow+JXDemo.h"

@interface JXDTableViewController ()
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation JXDTableViewController
#pragma mark - Init
#pragma mark - View
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
}

#pragma mark - Super
#pragma mark - Accessor
- (UITableView *)tableView {
    if (!_tableView) {
        CGFloat top = UIApplication.sharedApplication.delegate.window.jxd_safeTop + 44;
        CGFloat bottom = UIApplication.sharedApplication.delegate.window.jxd_safeBottom;
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, top, self.view.jxd_width, self.view.jxd_height - top - bottom) style:UITableViewStylePlain];
        tableView.dataSource = self;
        tableView.delegate = self;
        tableView.tableFooterView = [[UIView alloc] init];
        [tableView registerClass:[self cellClass] forCellReuseIdentifier:[[self cellClass] identifier]];
        if (@available(iOS 11.0, *)) {
            tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
        _tableView = tableView;
    }
    return _tableView;
}

#pragma mark - Private
#pragma mark - Public
- (Class)cellClass {
    return [JXDBaseTableCell class];
}

#pragma mark - Action
#pragma mark - Notification
#pragma mark - Delegate
#pragma mark UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JXDBaseTableCell *cell = [tableView dequeueReusableCellWithIdentifier:[[self cellClass] identifier] forIndexPath:indexPath];
    cell.item = self.items[indexPath.row];
    return cell;
}

#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [[self cellClass] heightForItem:self.items[indexPath.row]];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - Class

@end
