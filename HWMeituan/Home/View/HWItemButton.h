//
//  HWItemButton.h
//  HWMeituan
//
//  Created by 黄文海 on 2018/2/2.
//  Copyright © 2018年 huang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HWButtonModel.h"

@interface HWItemButton : UIButton
@property(nonatomic, strong)HWButtonModel* model;
@property(nonatomic, assign)BOOL isSmallImage;
@end
