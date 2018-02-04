//
//  HWMenuView.m
//  HWMeituan
//
//  Created by 黄文海 on 2018/2/3.
//  Copyright © 2018年 huang. All rights reserved.
//

#import "HWMenuView.h"
#import "HWButtonModel.h"
#import "HWItemButton.h"

@implementation HWMenuView
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)loadSubviews {
    
    CGFloat width = CGRectGetWidth(self.frame);
//    CGFloat height = CGRectGetHeight(self.frame);
    CGFloat spare = 10;
    CGFloat recommandHeight = 30;
    CGFloat otherHeigth = 20;
    CGFloat buttonWidth = (width - spare * 6) / 5;
    
    HWItemButton* button;
    for (int i = 0; i < self.modelArray.count; i++) {
        CGRect frame;
        BOOL isSmallImage;
        if (i < 5) {
            frame = CGRectMake(spare * (i + 1) + i * buttonWidth, spare, buttonWidth, buttonWidth);
            isSmallImage = NO;
        } else {
            int index = i % 5;
            frame = CGRectMake(spare * (index + 1) + index * buttonWidth, spare + 1 + buttonWidth * (i / 5), buttonWidth, buttonWidth);
            isSmallImage = true;
        }
        button = [[HWItemButton alloc] initWithFrame:frame];
        button.model = _modelArray[i];
        button.isSmallImage = isSmallImage;
        [self addSubview:button];
    }
    
    CALayer* layer = [[CALayer alloc] init];
    layer.frame = CGRectMake(0, buttonWidth + spare + 8, width, 1);
    layer.backgroundColor = [UIColor grayColor].CGColor;
    [self.layer addSublayer:layer];
}

- (void)setModelArray:(NSArray<HWButtonModel *> *)modelArray {
    _modelArray = modelArray;
    [self loadSubviews];
}
@end
