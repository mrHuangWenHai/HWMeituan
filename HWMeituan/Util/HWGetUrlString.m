//
//  HWGetUrlString.m
//  HWMeituan
//
//  Created by 黄文海 on 2018/2/4.
//  Copyright © 2018年 huang. All rights reserved.
//

#import "HWGetUrlString.h"
#import "AppDelegate.h"

@implementation HWGetUrlString

+ (instancetype)sharedManager {
    static HWGetUrlString* getUrlString;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        getUrlString = [[HWGetUrlString alloc] init];
    });
    return getUrlString;
}

- (NSString *)urlWithRecomment {
    
    AppDelegate* delegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    NSString *urlStr = [NSString stringWithFormat:@"http://api.meituan.com/group/v1/recommend/homepage/city/1?__skck=40aaaf01c2fc4801b9c059efcd7aa146&__skcy=mrUZYo7999nH8WgTicdfzaGjaSQ=&__skno=51156DC4-B59A-4108-8812-AD05BF227A47&__skts=1434530933.303717&__skua=bd6b6e8eadfad15571a15c3b9ef9199a&__vhost=api.mobile.meituan.com&ci=1&client=iphone&limit=40&movieBundleVersion=100&msid=48E2B810-805D-4821-9CDD-D5C9E01BC98A2015-06-17-14-50363&offset=0&position=%f,%f&userId=104108621&userid=104108621&utm_campaign=AgroupBgroupD100Fab_chunceshishuju__a__a___b1junglehomepagecatesort__b__leftflow___ab_gxhceshi__nostrategy__leftflow___ab_gxhceshi0202__b__a___ab_pindaochangsha__a__leftflow___ab_xinkeceshi__b__leftflow___ab_gxtest__gd__leftflow___ab_gxh_82__nostrategy__leftflow___ab_pindaoshenyang__a__leftflow___i_group_5_2_deallist_poitype__d__d___ab_b_food_57_purepoilist_extinfo__a__a___ab_trip_yidizhoubianyou__b__leftflow___ab_i_group_5_3_poidetaildeallist__a__b___ab_waimaizhanshi__b__b1___a20141120nanning__m1__leftflow___ab_pind",delegate.latitude,delegate.longitude];
    
    return urlStr;
    
}


@end