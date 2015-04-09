//
//  IMCommon.h
//  Common
//
//  Created by 陈少华 on 15/4/2.
//  Copyright (c) 2015年 inmovation. All rights reserved.
//

#define IOS7 [UIDevice currentDevice].systemVersion.floatValue >= 7.0
#define IOS6 [UIDevice currentDevice].systemVersion.floatValue >= 6.0
#define IOS5 [UIDevice currentDevice].systemVersion.floatValue >= 5.0

#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define StatusBarHeight 20.0
#define NavigationBarHeight 44.0
#define TabbarHeight 48.0

#define LineColor [UIColor colorWithWhite:224.0/255 alpha:1.0]
#define TextColor1 [UIColor colorWithWhite:50.0/255 alpha:1.0]
#define TextColor2 [UIColor colorWithWhite:120.0/255 alpha:1.0]

#define TextFont0 [UIFont systemFontOfSize:17.0]
#define TextFont1 [UIFont systemFontOfSize:15.0]
#define TextFont2 [UIFont systemFontOfSize:13.0]
#define TextFont3 [UIFont systemFontOfSize:11.0]
