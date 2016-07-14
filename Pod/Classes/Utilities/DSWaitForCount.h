//
//  DSWaitForCount.h
//  DuaSmile
//
//  Created by Dana Devoe on 6/15/16.
//  Copyright © 2016 Dana Devoe. All rights reserved.
//

#import <Foundation/Foundation.h>

/* Use this object to syncrhonize the flow of your code.  Use a count in the initWithCount: intializer
 When waitUntilZero is call the thread blocks until the count reaches zero, alternately you can call
  waitUntil:(NSInteger)count to count up or down to a specific value at which time the wait will unblock once
 the value specified is reached.
 */

@interface DSWaitForCount : NSObject

- (instancetype) initWithCount:(NSInteger)count;

- (void) waitUntilZero;
- (void) waitUntil:(NSInteger)count;
- (void) releaseWait;

- (void) decrementCount;
- (void) incrementCount;

- (NSInteger) currentCount;

@end
