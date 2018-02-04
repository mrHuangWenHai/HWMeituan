//
//  HWButtonModel.h
//  HWMeituan
//
//  Created by 黄文海 on 2018/2/3.
//  Copyright © 2018年 huang. All rights reserved.
//


#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, BadgeType)
{
    None,
    Envelop,
    LowPrice,
    HotSpring
};

@interface HWButtonModel : NSObject
@property(nonatomic, copy)NSString* imageUrl;
@property(nonatomic, copy)NSString* title;
@property(nonatomic, assign)BadgeType type;
@end
