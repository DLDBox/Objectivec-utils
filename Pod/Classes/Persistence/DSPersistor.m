//
//  DSPersistor.m
//  DuaSmile
//
//  Created by Dana Devoe on 4/17/16.
//  Copyright © 2016 Dana Devoe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objectivec-utils/ArchiveManager.h>
#import <objc/runtime.h>
#import "DSPersistor.h"

@interface DSPersistor()

//DLD: I need to change this to a prototype of a DSArchiverProtocol
//That way I write to file, cloudkit, icloud, a web endpoint, or tpcip even
@property (nonatomic,strong) ArchiveManager *archiver;

@end

static NSString *objectStoreName = @"self";

@implementation DSPersistor

- (instancetype) init{
    self = [super init];
    
    id newSelf = [self.archiver objectFromArchiveWithKey:objectStoreName];
    if (newSelf) {
        self = newSelf;
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(sync) name:UIApplicationWillTerminateNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(sync) name:UIApplicationDidEnterBackgroundNotification object:nil];
        
    }
    return self ;
}

- (void) dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [self sync];
}

- (void) sync
{
    IAMHERE();
    
    [self.archiver addObjectToArchive:self withKey:objectStoreName];
    [self.archiver saveArchiveToFile:[self classInstanceName]];
    [self.archiver close];
    
    _archiver = nil;
}

- (void) wipe
{
    NSString *path = [self.archiver dataPathWithFile:[self classInstanceName]];
    NSError *error;
    [[NSFileManager defaultManager] removeItemAtPath:path error:&error];
}


- (NSString *)classInstanceName{
    return NSStringFromClass([self class]);
}

#pragma mark - lazy initializer
- (ArchiveManager *)archiver{
    if ( _archiver == nil ) {
        _archiver = [[ArchiveManager alloc] init];
        
        NSString *path = [self.archiver dataPathWithFile:[self classInstanceName]];
        [_archiver openPathWithFile:path];
    }
    
    return _archiver;
}

#pragma mark - sample code
- (void) transverseSelf
{
    Class clazz = [self class];
    u_int count;
    
    Ivar* ivars = class_copyIvarList(clazz, &count);
    NSMutableArray* ivarArray = [NSMutableArray arrayWithCapacity:count];
    for (int i = 0; i < count ; i++)
    {
        const char* ivarName = ivar_getName(ivars[i]);
        [ivarArray addObject:[NSString  stringWithCString:ivarName encoding:NSUTF8StringEncoding]];
    }
    free(ivars);
    
    objc_property_t* properties = class_copyPropertyList(clazz, &count);
    NSMutableArray* propertyArray = [NSMutableArray arrayWithCapacity:count];
    for (int i = 0; i < count ; i++)
    {
        const char* propertyName = property_getName(properties[i]);
        [propertyArray addObject:[NSString  stringWithCString:propertyName encoding:NSUTF8StringEncoding]];
    }
    free(properties);
    
    Method* methods = class_copyMethodList(clazz, &count);
    NSMutableArray* methodArray = [NSMutableArray arrayWithCapacity:count];
    for (int i = 0; i < count ; i++)
    {
        SEL selector = method_getName(methods[i]);
        const char* methodName = sel_getName(selector);
        [methodArray addObject:[NSString  stringWithCString:methodName encoding:NSUTF8StringEncoding]];
    }
    free(methods);
    
    NSDictionary* classDump = [NSDictionary dictionaryWithObjectsAndKeys:
                               ivarArray, @"ivars",
                               propertyArray, @"properties",
                               methodArray, @"methods",
                               nil];
    
    NSLog(@"%@", classDump);
}

@end
