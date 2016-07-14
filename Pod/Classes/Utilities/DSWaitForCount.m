//
//  DSWaitForCount.m
//  DuaSmile
//
//  Created by Dana Devoe on 6/15/16.
//  Copyright © 2016 Dana Devoe. All rights reserved.
//

#import "DSWaitForCount.h"

@interface DSWaitForCount()

@property (nonatomic,assign) NSInteger initialCount;
@property (nonatomic,assign) NSInteger releaseCount;

@property (nonatomic,strong) dispatch_semaphore_t sem;

@end

@implementation DSWaitForCount

- (instancetype) initWithCount:(NSInteger)count
{
    self = [super init];
    
    if ( self ) {
        _sem = dispatch_semaphore_create(0);
        _initialCount = count;
        _releaseCount = 0;
    }
    
    return self;
}

- (void) dealloc{
    dispatch_semaphore_signal(self.sem);
}

- (void) waitUntilZero {
    dispatch_semaphore_wait(self.sem, DISPATCH_TIME_FOREVER);
}

- (void) waitUntil:(NSInteger)count
{
    _releaseCount = count;
    dispatch_semaphore_wait(self.sem, DISPATCH_TIME_FOREVER);
}

- (void) decrementCount
{
    self.initialCount -= 1;
    
    if ( self.initialCount == self.releaseCount ) {
        dispatch_semaphore_signal(self.sem);
    }
}

- (void) incrementCount
{
    self.initialCount += 1;
    
    if ( self.initialCount == self.releaseCount ) {
        dispatch_semaphore_signal(self.sem);
    }
}

- (void) releaseWait
{
    dispatch_semaphore_signal(self.sem);
    _initialCount = 0;
    _releaseCount = 0;
}

- (NSInteger) currentCount{
    return self.initialCount;
}

@end
