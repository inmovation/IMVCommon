//
//  UIFont+IMVCommon.h
//  IMVCommon
//
//  Created by 陈少华 on 15/5/8.
//  Copyright (c) 2015年 inmovation. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIFont+IMVTheme.h>

//以下几个必须得在theme.plist中定义
//字体大小
#define IMVFontNaviBarTitle @"naviBarTitleFont"
#define IMVFontNaviBarItemTitle @"naviBarItemTitleFont"
#define IMVFontTabBarItemTitle @"tabBarItemTitleFont"
#define IMVFontTextTitle @"textTitleFont"
#define IMVFontTextDetail @"textDetailFont"

@interface UIFont (IMVCommon)

+ (UIFont *)fontForNaviBarTitle;
+ (UIFont *)fontForNaviBarItemTitle;
+ (UIFont *)fontForTabBarItemTitle;
+ (UIFont *)fontForTextTitle;
+ (UIFont *)fontForTextDetail;

@end
