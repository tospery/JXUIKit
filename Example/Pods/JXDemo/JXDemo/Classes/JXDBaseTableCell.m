//
//  JXDBaseTableCell.m
//  MyJLRoutes
//
//  Created by 杨建祥 on 2019/12/29.
//  Copyright © 2019 杨建祥. All rights reserved.
//

#import "JXDBaseTableCell.h"

@implementation JXDBaseTableCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.textLabel.font = [UIFont systemFontOfSize:14];
        self.textLabel.textColor = [UIColor blackColor];
    }
    return self;
}

- (void)prepareForReuse {
    [super prepareForReuse];
    self.textLabel.text = nil;
}

+ (NSString *)identifier {
    return [NSString stringWithFormat:@"%@Identifier", NSStringFromClass([self class])];
}

+ (CGFloat)heightForItem:(id)item {
    return 44.0f;
}

@end
