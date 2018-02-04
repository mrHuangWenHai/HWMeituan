//
//  DiscountViewCell.m
//  HWMeituan
//
//  Created by 黄文海 on 2018/2/3.
//  Copyright © 2018年 huang. All rights reserved.
//

#import "DiscountViewCell.h"
#import "UIView+Frame.h"

@interface DiscountViewCell()
@property(nonatomic, strong)UIImageView* leftImageView;
@property(nonatomic, strong)UIImageView* topImageView;
@property(nonatomic, strong)UIImageView* bottomLeftImageView;
@property(nonatomic, strong)UIImageView* bottomRightImageView;
@end

@implementation DiscountViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    }
    return self;
}

- (void)loadSubviews {
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = 250;
    CGFloat bottomLabelHeight = 30;
    CGFloat imageLabelWidth = width * 0.3 * 0.4;
    
    CALayer* layer = [[CALayer alloc] init];
    layer.frame = CGRectMake(0, 0, width, 5);
    layer.backgroundColor = [UIColor colorWithRed:239.0 / 255 green:239.0 / 255 blue:239 / 255.0 alpha:1].CGColor;
    [self.contentView.layer addSublayer:layer];
    
    DiscountModel* model1 = self.modelArray[0];
    UIView* leftView = [[UIView alloc] initWithFrame:CGRectMake(5, 10, width * 0.3, height - bottomLabelHeight - 15)];
    leftView.backgroundColor = [UIColor colorWithRed:251.0 / 255 green:241.0 / 255 blue:242.0 / 255 alpha:1];
    UIImageView* imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"discount"]];
    imageView.frame = CGRectMake(0, 3, imageLabelWidth, 20);
    [leftView addSubview:imageView];
    
    UILabel* nameLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(5, imageView.dtHeight + 3, width * 0.3 - 5, 0)];
    nameLabel1.text = model1.title;
    [leftView addSubview:nameLabel1];
    nameLabel1.numberOfLines = 2;
    [nameLabel1 sizeToFit];
    
    _leftImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:model1.flagUrl]];
    _leftImageView.frame = CGRectMake(0, (height - bottomLabelHeight - 15) / 2, width * 0.3, (height - bottomLabelHeight - 15) / 2);
    [leftView addSubview:self.leftImageView];
    UIImageView* maskImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"left"]];
    maskImageView.frame = self.leftImageView.bounds;
    [self.leftImageView addSubview:maskImageView];
    [self.contentView addSubview:leftView];
    
    
    CGFloat topViewWidth = width - leftView.dtWidth - 10;
    CGFloat topViewHeight = (height - bottomLabelHeight - 15 - 5) / 2;
    DiscountModel* model2 = self.modelArray[1];
    UIView* topView = [[UIView alloc] initWithFrame:CGRectMake(leftView.dtWidth + 5, 10,  topViewWidth, topViewHeight)];
    
    topView.backgroundColor = [UIColor colorWithRed:240.0 / 255 green:239.0 / 255 blue:235.0 / 255 alpha:1];
    UIImageView* flagImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"style"]];
    flagImageView.frame = CGRectMake(0, 3, imageLabelWidth, 20);
    [topView addSubview:flagImageView];
    
    UILabel* nameLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(5, flagImageView.dtHeight + 3, topViewWidth - 5, 0)];
    nameLabel2.text = model2.title;
    [topView addSubview:nameLabel2];
    nameLabel2.numberOfLines = 2;
    [nameLabel2 sizeToFit];
    
    _topImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:model2.flagUrl]];
    _topImageView.frame = CGRectMake(topViewWidth / 2, 0, topViewWidth / 2, topViewHeight);
    UIImageView* topMaskImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"topmask"]];
    topMaskImageView.frame = _topImageView.bounds;
    [_topImageView addSubview:topMaskImageView];
    [topView addSubview:_topImageView];
    [self.contentView addSubview:topView];
    
    CGFloat bottomWidth = (topViewWidth - 5) / 2;
    CGFloat bottomHeight = topViewHeight;
    DiscountModel* model3 = self.modelArray[2];
    UIView* bottomLeftView = [[UIView alloc] initWithFrame:CGRectMake(leftView.dtWidth + 5, topView.dtHeight + 5, bottomWidth, bottomHeight)];
    bottomLeftView.backgroundColor = [UIColor colorWithRed:249.0 / 255 green:249.0 / 255 blue:242.0 / 255 alpha:1];
    UIImageView* flagImageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"night"]];
    flagImageView1.frame = CGRectMake(0, 3, imageLabelWidth, 20);
    [bottomLeftView addSubview:flagImageView1];
    
    UILabel* nameLabel3 = [[UILabel alloc] initWithFrame:CGRectMake(5, flagImageView1.dtHeight + 3, bottomWidth / 2, 0)];
    nameLabel3.text = model3.title;
    [bottomLeftView addSubview:nameLabel3];
    nameLabel3.numberOfLines = 2;
    [nameLabel3 sizeToFit];
    
    _bottomLeftImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:model3.flagUrl]];
    _bottomLeftImageView.frame = CGRectMake(bottomWidth / 2, bottomHeight / 2, bottomWidth / 2, bottomHeight / 2);
    UIImageView* bottomLeftMaskImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bottomleftmask"]];
    bottomLeftMaskImageView.frame = _bottomLeftImageView.bounds;
    [_bottomLeftImageView addSubview:bottomLeftMaskImageView];
    [bottomLeftView addSubview:_bottomLeftImageView];
    [self.contentView addSubview:bottomLeftView];
    
    DiscountModel* model4 = self.modelArray[3];
    UIView* bottomRightView = [[UIView alloc] initWithFrame:CGRectMake(bottomLeftView.dtWidth + 5, topView.dtHeight + 5, bottomWidth, bottomHeight)];
    bottomRightView.backgroundColor = [UIColor colorWithRed:244.0 / 255 green:246.0 / 255 blue:255.0 / 255 alpha:1];
    UIImageView* flagImageView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"week"]];
    flagImageView2.frame = CGRectMake(0, 3, imageLabelWidth, 20);
    [bottomRightView addSubview:flagImageView2];
    
    UILabel* nameLabel4 = [[UILabel alloc] initWithFrame:CGRectMake(5, flagImageView2.dtHeight + 3, bottomWidth / 2, 0)];
    nameLabel4.text = model4.title;
    [bottomRightView addSubview:nameLabel4];
    nameLabel4.numberOfLines = 2;
    [nameLabel4 sizeToFit];
    
    _bottomRightImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:model4.flagUrl]];
    _bottomRightImageView.frame = CGRectMake(bottomWidth / 2, bottomHeight / 2, bottomWidth / 2, bottomHeight / 2);
    UIImageView* bottomRightMaskImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bottomrightmask"]];
    bottomRightMaskImageView.frame = _bottomRightImageView.bounds;
    [_bottomRightImageView addSubview:bottomRightMaskImageView];
    [bottomRightView addSubview:_bottomRightImageView];
    [self.contentView addSubview:bottomRightView];
    
    CALayer* bottomLayer = [[CALayer alloc] init];
    bottomLayer.frame = CGRectMake(0, leftView.dtHeight, width, 5);
    bottomLayer.backgroundColor = [UIColor colorWithRed:239.0 / 255 green:239.0 / 255 blue:239 / 255.0 alpha:1].CGColor;
    [self.contentView.layer addSublayer:bottomLayer];
    
    UILabel* guessLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, leftView.dtHeight + 5, width, height - leftView.dtHeight - 5)];
    guessLabel.text = @"- 猜你喜欢 -";
    guessLabel.textAlignment = NSTextAlignmentCenter;
    guessLabel.textColor = [UIColor colorWithRed:172.0 / 255 green:172.0 / 255 blue:172.0 / 255 alpha:1];
    [self.contentView addSubview:guessLabel];
}

- (void)setModelArray:(NSArray *)modelArray {
    _modelArray = modelArray;
    [self loadSubviews];
}
@end
