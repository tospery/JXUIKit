//
//  JXDCaseViewController.m
//  MyJLRoutes
//
//  Created by 杨建祥 on 2019/12/29.
//  Copyright © 2019 杨建祥. All rights reserved.
//

#import "JXDCaseViewController.h"
#import <Mantle/Mantle.h>
#import "JXDCase.h"
#import "JXDCaseCell.h"
#import "JXDWebViewController.h"

@interface JXDCaseViewController ()

@end

@implementation JXDCaseViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *name = NSStringFromClass([self class]);
    name = [name substringToIndex:name.length - @"ViewController".length];
    if (name.length != 0) {
        NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:@"json"];
        NSData *data = [NSData dataWithContentsOfFile:path];
        id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        self.items = [MTLJSONAdapter modelsOfClass:JXDCase.class fromJSONArray:json error:nil];
    }
}

- (Class)cellClass {
    return [JXDCaseCell class];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [super tableView:tableView didSelectRowAtIndexPath:indexPath];
    
    JXDCase *item = self.items[indexPath.row];
    Class cls = NSClassFromString(item.forward);
    if (cls) {
        JXDBaseViewController *vc = [(JXDBaseViewController *)[cls alloc] initWithParams:item.params];
        vc.navigationItem.title = item.name;
        [self.navigationController pushViewController:vc animated:YES];
    }else {
        SEL sel = NSSelectorFromString([NSString stringWithFormat:@"%@:", item.forward]);
        if ([self respondsToSelector:sel]) {
            ((void (*)(id, SEL, NSDictionary *))[self methodForSelector:sel])(self, sel, item.params);
        }
    }
}

@end
