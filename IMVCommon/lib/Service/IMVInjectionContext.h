//
//  IMVInjectContext.h
//  IMVCommon
//
//  Created by 陈少华 on 15/6/17.
//  Copyright (c) 2015年 inmovation. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IMVInjection.h"

@interface IMVInjectionContext : NSObject

+ (instancetype)sharedInstence;

- (NSArray *)getInjectorsWithInjection:(Protocol *)injection;
- (id<IMVInjection>)getInjectorWithName:(NSString *)className;

@end