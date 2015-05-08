//
//  UIColor+IMVCommon.h
//  IMVCommon
//
//  Created by 陈少华 on 15/5/8.
//  Copyright (c) 2015年 inmovation. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIColor+IMVTheme.h>
//颜色
#define IMVColorNaviBarTint @"naviBarTintColor"
#define IMVColorNaviBarBarTint @"naviBarBarTintColor"
#define IMVColorNaviBarTitle @"naviBarTitleColor"
#define IMVColorNaviBarItemTitle @"naviBarItemTitleColor"
#define IMVColorTabBarTint @"tabBarTintColor"
#define IMVColorTabBarBarTint @"tabBarBarTintColor"
#define IMVColorTabBarItemTitleNormal @"tabBarItemTitleNormalColor"
#define IMVColorTabBarItemTitleSelected @"tabBarItemTitleSelectedColor"
#define IMVColorViewBackground @"viewBackgroundColor"
#define IMVColorViewContent @"viewContentColor"
#define IMVColorTextTitle @"textTitleColor"
#define IMVColorTextDetail @"textDetailColor"

@interface UIColor (IMVCommon)

+ (UIColor *)colorForNaviBarTint;
+ (UIColor *)colorForNaviBarBarTint;
+ (UIColor *)colorForNaviBarTitle;
+ (UIColor *)colorForNaviBarItemTitle;

+ (UIColor *)colorForTabBarTint;
+ (UIColor *)colorForTabBarBarTint;
+ (UIColor *)colorForTabBarItemTitleNormal;
+ (UIColor *)colorForTabBarItemTitleSelected;

+ (UIColor *)colorForViewContent;
+ (UIColor *)colorForViewBackgroud;

+ (UIColor *)colorForTextDetail;
+ (UIColor *)colorForTextTitle;

@end
