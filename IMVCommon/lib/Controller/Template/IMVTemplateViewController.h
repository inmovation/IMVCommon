//
//  TemplateViewController.h
//  JXWKnowledgeManager
//
//  Created by Creolophus on 1/14/15.
//  Copyright (c) 2015 Creolophus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IMVThemeManager.h"

/**
 *  viewController的基类
 */
@interface IMVTemplateViewController : UIViewController

- (void)initTheme;

/**
 *  显示空列表的提示界面
 *
 *  @param frame  界面的frame，可以设置成展示table的frame
 *  @param status 提示语
 */
- (void)showEmptyViewWithFrame:(CGRect)frame status:(NSString *)status;

/**
 *  隐藏空列表的提示界面
 */
- (void)hideEmptyView;

/**
 *	显示网络错误提示界面
 *
 *  @param frame  界面的frame，可以设置成展示table的frame
 */
- (void)showNetworkErrorWithFrame:(CGRect)frame;

/**
 *	隐藏网络错误提示界面
 */
- (void)hideNetworkErrorView;

/**
 *	点击重新加载按钮
 */
- (void)loadDataAgain;

@end
