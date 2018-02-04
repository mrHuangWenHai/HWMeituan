//
//  HWGuessLikeCell.m
//  HWMeituan
//
//  Created by 黄文海 on 2018/2/4.
//  Copyright © 2018年 huang. All rights reserved.
//

#import "HWGuessLikeCell.h"
#import "UIImageView+WebCache.h"
@interface HWGuessLikeCell()

@property (strong, nonatomic) IBOutlet UIImageView *productImageView;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *distanceLabel;
@property (strong, nonatomic) IBOutlet UILabel *introduceLabel;
@property (strong, nonatomic) IBOutlet UILabel *priceLabel;
@property (strong, nonatomic) IBOutlet UILabel *sellLabel;

@end

@implementation HWGuessLikeCell

- (void)setUp {
    
    NSString *imageUrl = [self.model.imgurl stringByReplacingOccurrencesOfString:@"w.h" withString:@"160.0"];
    NSURL* url = [NSURL URLWithString:imageUrl];
    [self.productImageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"bg_merchant_photo_placeholder_small"]];
    self.nameLabel.text = self.model.brandname;
    self.distanceLabel.text = @"4.7km";
    self.introduceLabel.text = [NSString stringWithFormat:@"[%@] %@",self.model.range,self.model.mtitle];
    self.introduceLabel.textColor = [UIColor colorWithRed:120.0/255 green:120.0/255 blue:120.0/255 alpha:1];
    self.priceLabel.text = [NSString stringWithFormat:@"¥%@",self.model.price];
    self.priceLabel.textColor = [UIColor colorWithRed:255.0/255 green:102.0/255 blue:1.0/255 alpha:1];
    self.sellLabel.text = [NSString stringWithFormat:@"已售%@",self.model.solds];
    
}

- (void)setModel:(HWProductModel *)model {
    _model = model;
    [self setUp];
}
@end
