//
//  HWItemButton.m
//  HWMeituan
//
//  Created by 黄文海 on 2018/2/2.
//  Copyright © 2018年 huang. All rights reserved.
//

#import "HWItemButton.h"

@interface HWItemButton()
@property(nonatomic, strong)UIImageView* contentImageView;
@property(nonatomic, strong)UILabel* nameLabel;
@property(nonatomic, strong)UIImageView* badgeImageView;
@end

@implementation HWItemButton

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)loadSubViews {
    
    _contentImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.model.imageUrl]];
    _nameLabel = [[UILabel alloc] init];
    _nameLabel.text = self.model.title;
    _nameLabel.textAlignment = NSTextAlignmentCenter;
    _nameLabel.font = [UIFont systemFontOfSize:9];
    _nameLabel.textColor = [UIColor grayColor];
    
    if (self.model.type != None) {
        _badgeImageView = [[UIImageView alloc] init];
        if (self.model.type == Envelop) {
            _badgeImageView.image = [UIImage imageNamed:@"envelop"];
        } else if (self.model.type == LowPrice) {
            _badgeImageView.image = [UIImage imageNamed:@"lowPrice"];
        } else if (self.model.type == HotSpring) {
            _badgeImageView.image = [UIImage imageNamed:@"hotSpring"];
        }
    } else {
        _badgeImageView = nil;
    }
    [self addSubview:_contentImageView];
    [self addSubview:_nameLabel];
    [self addSubview:_badgeImageView];
    
}

- (void)layoutSubviews {
    CGFloat width = CGRectGetWidth(self.frame);
    CGFloat height = CGRectGetHeight(self.frame);
    CGFloat nameLabelHeight = 10;
    CGFloat smallWidth = 30;
    if (self.isSmallImage) {
        self.contentImageView.frame = CGRectMake(width / 2 - smallWidth / 2, height * 0.25, smallWidth, smallWidth);
    } else {
        self.contentImageView.frame = CGRectMake(0, 0, width, height - nameLabelHeight - 7);
    }
    self.contentImageView.contentMode = UIViewContentModeScaleAspectFit;
    self.nameLabel.frame = CGRectMake(0, height - nameLabelHeight , width, nameLabelHeight);
    if (self.badgeImageView != nil) {
        self.badgeImageView.frame = CGRectMake(0, width - 15, 15, 10);
    }
}

- (void)setModel:(HWButtonModel *)model {
    _model = model;
    [self loadSubViews];
}

@end
