//
//  DTGlobals.h
//  TASampleApp
//
//  Created by Thinaire
//  Copyright (c) 2014 Thinaire. All rights reserved.
//

#import <Foundation/Foundation.h>

//
// DebugLog helper
// In order to use this properly, you need to define DEBUG_MODE in the project settings for the debug build of the app only.
#ifdef DEBUG
#define DebugLog( s, ... ) NSLog( @"%@@%d<%@>", self, [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__] )
#define DLog( s, ... ) NSLog( @"%@", [NSString stringWithFormat:(s), ##__VA_ARGS__] )
#define IAMHERE() NSLog( @"%s@%d-mainthread(%@)",__PRETTY_FUNCTION__,__LINE__,[NSThread isMainThread] ? @"YES" : @"NO" )
#define PLACEHOLDER(x) NSLog( @"This should not be executed %s%d - %@",__PRETTY_FUNCTION__,__LINE__,x )
#define NOTYET(x) NSLog( @"Not implemented Yet %s%d - %@",__PRETTY_FUNCTION__,__LINE__,x )
#else
#define DLog( s, ... )
#define IAMHERE()
#define PLACEHOLDER(x)
#define NOTYET(x)
#endif

#define SEL2OBJ(s) [NSValue valueWithPointer:@selector(s)] // ...
#define OBJ2SEL(o) [o pointerValue] //usage: SEL selector = OBJ2SEL(obj);


#define DO_ONCE(b) {static dispatch_once_t onceToken_t; dispatch_once(&onceToken_t,b);}

#define WEAKSELF(x)  __weak typeof(self) x = self
#define BLOCKSELF(x) __weak typeof(self) weakSelf = self;__strong typeof(self) x = weakSelf
#define STRONGSELF(x) __strong typeof(self) x = self

#define ERROR(s,n) [NSError errorWithDomain:s code:n userInfo:nil]

#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

typedef NS_ENUM(NSUInteger, TApplicationOptions){
    TApplicationOptionNONE,
    TApplicationOptionURLSettings
};


// Color helpers
#define RGBA(r,g,b,a) (r)/255.0, (g)/255.0, (b)/255.0, (a)
#define RGBCOLOR(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define HSVCOLOR(h,s,v) [UIColor colorWithHue:h saturation:s value:v alpha:1]
#define HSVACOLOR(h,s,v,a) [UIColor colorWithHue:h saturation:s value:v alpha:a]
#define WEBCOLOR(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

