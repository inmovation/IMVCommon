//
//  UIImage+IMVCommon.m
//  IMVCommon
//
//  Created by 陈少华 on 15/5/8.
//  Copyright (c) 2015年 inmovation. All rights reserved.
//

#import "UIImage+IMVCommon.h"

@implementation UIImage (IMVCommon)

+ (UIImage *)imageForTabBarBackground
{
    return [self imageForName:IMVImageTabBarBackground];
}

+ (UIImage *)imageForNaviBarBackground
{
    return [self imageForName:IMVImageNaviBarBackground];
}

+ (UIImage *)imageForNetworkBrokenHint
{
    return [self imageForName:IMVImageNetworkBrokenHint];
}

+ (UIImage *)imageForEmptyHint
{
    return [self imageForName:IMVImageEmptyHint];
}

@end
