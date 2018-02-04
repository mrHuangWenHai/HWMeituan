//
//  HWGetUrlString.h
//  HWMeituan
//
//  Created by 黄文海 on 2018/2/4.
//  Copyright © 2018年 huang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HWGetUrlString : NSObject

+(instancetype)sharedManager;

- (NSString *)urlWithRecomment;

@end
