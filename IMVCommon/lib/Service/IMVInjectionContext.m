//
//  IMVInjectContext.m
//  IMVCommon
//
//  Created by 陈少华 on 15/6/17.
//  Copyright (c) 2015年 inmovation. All rights reserved.
//
#import <objc/runtime.h>
#import <dlfcn.h>
#import <mach-o/ldsyms.h>

#import "IMVInjectionContext.h"

@interface IMVInjectionContext ()

@property (strong, nonatomic) NSDictionary *injectorInfo;

@end
@implementation IMVInjectionContext

+ (instancetype)sharedInstence
{
    static id sharedInstence = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedInstence = [[self alloc] init];
    });
    return sharedInstence;
}

- (id)init
{
    self = [super init];
    if (self) {
        _injectorInfo = [self getInjectionInfo];
    }
    return self;
}

- (NSDictionary *)getInjectionInfo {
    
    NSMutableDictionary *injectorInfo = [NSMutableDictionary dictionary];
    
    //以下代码获取开发者创建的类名，不需要扫描所有的类，
    unsigned int count;
    const char **classes;
    Dl_info info;
    
    dladdr(&_mh_execute_header, &info);
    classes = objc_copyClassNamesForImage(info.dli_fname, &count);
    
    for (int i = 0; i < count; i++) {
        NSString *clsName = [NSString stringWithCString:classes[i] encoding:NSUTF8StringEncoding];
        Class cls = NSClassFromString (clsName);;
        if (class_getClassMethod(cls, @selector(conformsToProtocol:)) && [cls conformsToProtocol:@protocol(IMVInjection)]) {
            [injectorInfo setObject:[NSNull null] forKey:clsName];
        }
    }
    
    return injectorInfo;
}

- (NSArray *)getInjectorsWithInjection:(Protocol *)injection
{
    NSMutableArray *injectors = [NSMutableArray array];
    [_injectorInfo enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        
        if ([NSClassFromString(key) conformsToProtocol:injection]) {
            if ([obj isKindOfClass:[NSNull class]]) { //懒注入
                obj = [[NSClassFromString(key) alloc] init];
                if ([obj respondsToSelector:@selector(inject)]) {
                    [obj inject];
                }
                [_injectorInfo setValue:obj forKey:key];
            }
            [injectors addObject:obj];
        }
    }];
    return injectors;
}

- (id<IMVInjection>)getInjectorWithName:(NSString *)className
{
    id injector = [_injectorInfo objectForKey:className];
    if ([injector isKindOfClass:[NSNull class]]) { //懒注入
        injector = [[NSClassFromString(className) alloc] init];
        if ([injector respondsToSelector:@selector(inject)]) {
            [injector inject];
        }
        [_injectorInfo setValue:injector forKey:className];
    }
    return injector;
}

@end
