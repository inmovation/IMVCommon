//
//  UIFont+IMVCommon.m
//  IMVCommon
//
//  Created by 陈少华 on 15/5/8.
//  Copyright (c) 2015年 inmovation. All rights reserved.
//

#import "UIFont+IMVCommon.h"

@implementation UIFont (IMVCommon)

+ (UIFont *)fontForNaviBarTitle
{
    return [self fontForName:IMVFontNaviBarTitle];
}

+ (UIFont *)fontForNaviBarItemTitle
{
    return [self fontForName:IMVFontNaviBarItemTitle];
}

+ (UIFont *)fontForTabBarItemTitle
{
    return [self fontForName:IMVFontTabBarItemTitle];
}

+ (UIFont *)fontForTextTitle
{
    return [self fontForName:IMVFontTextTitle];
}

+ (UIFont *)fontForTextDetail
{
    return [self fontForName:IMVFontTextDetail];
}

@end
