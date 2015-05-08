//
//  MEDatabase.m
//  MobileExam
//
//  Created by 陈少华 on 15/4/1.
//  Copyright (c) 2015年 inmovation. All rights reserved.
//

#import "MEDatabase.h"

#define MEDbName @"exam.sqlite"
#define MEDbVersion 1.0

@interface MEDatabase ()


@end

@implementation MEDatabase

- (void)initialize
{
    [super initialize];

    if (self.dbversion < MEDbVersion || 1) {
        //可以在此做版本迁移
        
        [[NSFileManager defaultManager] createFileAtPath:self.dbPath contents:nil attributes:nil];
        
        
    }
}



@end
