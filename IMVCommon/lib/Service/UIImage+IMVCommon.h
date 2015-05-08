//
//  UIImage+IMVCommon.h
//  IMVCommon
//
//  Created by 陈少华 on 15/5/8.
//  Copyright (c) 2015年 inmovation. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIImage+IMVTheme.h>

#define IMVImageTabBarBackground @"tabBarBackgroundImage"
#define IMVImageNaviBarBackground @"naviBarBackgroundImage"

#define IMVImageNetworkBrokenHint @"networkBrokenHintImage"
#define IMVImageEmptyHint @"emptyHintImage"

@interface UIImage (IMVCommon)

+ (UIImage *)imageForTabBarBackground;
+ (UIImage *)imageForNaviBarBackground;
+ (UIImage *)imageForNetworkBrokenHint;
+ (UIImage *)imageForEmptyHint;

@end
