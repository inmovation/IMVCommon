//
//  SFNavigationController.h
//  TCA
//
//  Created by shaohua.chen on 14-4-4.
//  Copyright (c) 2014年 shaohua.chen. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  封装了navigationController的一些样式，及旋转处理
 */
@interface IMVNavigationController : UINavigationController

/**
 *  封装了tabBarController的一些样式和旋转
 */
@property (assign, nonatomic) BOOL translucent;

/**
 *  背景图片
 */
@property (strong, nonatomic) UIImage *barBackgroundImage;

/**
 *  navigationBar背景颜色
 */
@property (strong, nonatomic) UIColor *barTintColor;

/**
 *  navigationItem的颜色
 */
@property (strong, nonatomic) UIColor *tintColor;

/**
 *  navigation title颜色
 */
@property (strong, nonatomic) UIColor *titleColor;

/**
 *  navigation title字体大小
 */
@property (strong, nonatomic) UIFont *titleFont;

@end
