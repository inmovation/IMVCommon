//
//  MEFileManager.m
//  MobileExam
//
//  Created by 陈少华 on 15/4/1.
//  Copyright (c) 2015年 inmovation. All rights reserved.
//

#import "MEFileManager.h"


#define EXAM_PATH @"exams"

@interface MEFileManager ()


@end

@implementation MEFileManager

- (void)initialize
{
    [super initialize];
    _examsPath = [self.rootPath stringByAppendingPathComponent:EXAM_PATH];
    if (![self.fileManager createDirectoryAtPath:_examsPath withIntermediateDirectories:YES attributes:nil error:nil]) {
        _examsPath = nil;
    }
}

@end
