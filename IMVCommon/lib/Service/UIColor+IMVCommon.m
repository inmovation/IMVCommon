//
//  UIColor+IMVCommon.m
//  IMVCommon
//
//  Created by 陈少华 on 15/5/8.
//  Copyright (c) 2015年 inmovation. All rights reserved.
//

#import "UIColor+IMVCommon.h"

@implementation UIColor (IMVCommon)

/************ navigation bar color *****************/
+ (UIColor *)colorForNaviBarTint
{
    return [self colorForName:IMVColorNaviBarTint];
}

+ (UIColor *)colorForNaviBarBarTint
{
    return [self colorForName:IMVColorNaviBarBarTint];
}

+ (UIColor *)colorForNaviBarTitle
{
    return [self colorForName:IMVColorNaviBarTitle];
}
+ (UIColor *)colorForNaviBarItemTitle
{
    return [self colorForName:IMVColorNaviBarItemTitle];
}


/************* tab bar color *****************/
+ (UIColor *)colorForTabBarTint
{
    return [self colorForName:IMVColorTabBarTint];
}
+ (UIColor *)colorForTabBarBarTint
{
    return [self colorForName:IMVColorTabBarBarTint];
}

+ (UIColor *)colorForTabBarItemTitleNormal
{
    return [self colorForName:IMVColorTabBarItemTitleNormal];
}

+ (UIColor *)colorForTabBarItemTitleSelected
{
    return [self colorForName:IMVColorTabBarItemTitleSelected];
}


/************** view color ***************/
+ (UIColor *)colorForViewContent
{
    return [self colorForName:IMVColorViewContent];
}

+ (UIColor *)colorForViewBackgroud
{
    return [self colorForName:IMVColorViewBackground];
}


/************** text color ***************/
+ (UIColor *)colorForTextDetail
{
    return [self colorForName:IMVColorTextDetail];
}

+ (UIColor *)colorForTextTitle
{
    return [self colorForName:IMVColorTextTitle];
}

@end
