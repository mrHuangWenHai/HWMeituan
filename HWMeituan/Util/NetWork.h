//
//  NetWork.h
//  HWMeituan
//
//  Created by 黄文海 on 2018/2/4.
//  Copyright © 2018年 huang. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  定义请求成功的block
 */
typedef void(^successBlock)(id responseBody);
/**
 *  定义请求失败的block
 */
typedef void(^failureBlock)(NSError *error);

@interface NetWork : NSObject
/**
 *  发送get请求
 *
 *  @param url     网络请求的URL
 *  @param params  传一个字典
 *  @param success 请求成功的block
 *  @param failure 请求失败的block
 */
+(void)sendGetUrl:(NSString *)url withParams:(NSDictionary *)params success:(successBlock) success failure:(failureBlock)failure;

/**
 *  发送get请求
 *
 *  @param url     网络请求的URL 这里的URL转码方式跟上面的不一样注意一下
 *  @param params  传一个字典
 *  @param success 请求成功的block
 *  @param failure 请求失败的block
 */
+(void)sendGetByReplacingUrl:(NSString *)url withParams:(NSDictionary *)params success:(successBlock) success failure:(failureBlock)failure;

@end
