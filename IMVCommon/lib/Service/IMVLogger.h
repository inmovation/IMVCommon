//
//  IMVLogger.h
//  IMVCommon
//
//  Created by 陈少华 on 15/6/3.
//  Copyright (c) 2015年 inmovation. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_OPTIONS(NSUInteger, IMVLogFlag) {
    IMVLogFlagError      = (1 << 0), // 0...00001
    IMVLogFlagWarning    = (1 << 1), // 0...00010
    IMVLogFlagInfo       = (1 << 2), // 0...00100
    IMVLogFlagDebug      = (1 << 3), // 0...01000
};

typedef NS_ENUM(NSUInteger, IMVLogLevel) {
    IMVLogLevelOff       = 0,
    IMVLogLevelError     = (IMVLogFlagError),                       // 0...00001
    IMVLogLevelWarning   = (IMVLogLevelError   | IMVLogFlagWarning), // 0...00011
    IMVLogLevelInfo      = (IMVLogLevelWarning | IMVLogFlagInfo),    // 0...00111
    IMVLogLevelDebug     = (IMVLogLevelInfo    | IMVLogFlagDebug),   // 0...01111
    IMVLogLevelAll       = NSUIntegerMax                           // 1111....11111
};

#ifdef DEBUG
static const int imvLogLevel = IMVLogLevelDebug;
#else
static const int imvLogLevel = IMVLogLevelOff;
#endif

#define NSLogError(frmt, ...)    do{ if(imvLogLevel & IMVLogFlagError) NSLog((@"[error] " frmt), ##__VA_ARGS__); } while(0)
#define NSLogWarning(frmt, ...)     do{ if(imvLogLevel & IMVLogFlagWarning) NSLog((@"[warning] " frmt), ##__VA_ARGS__); } while(0)
#define NSLogInfo(frmt, ...)    do{ if(imvLogLevel & IMVLogFlagInfo) NSLog((@"[info] " frmt), ##__VA_ARGS__); } while(0)
#define NSLogDebug(frmt, ...)  do{ if(imvLogLevel & IMVLogFlagDebug) NSLog((@"[debug] " frmt), ##__VA_ARGS__); } while(0)
