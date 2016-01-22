//
//  DTLinear.h
//  CurveFit
//
//  Created by AtWorkUser on 10/29/15.
//  Copyright © 2015 Thinaire. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DTRegression.h"
#import "DTTestProtocol.h"

//y = a + bx
//x = (y-a)/b
@interface DTLinear : DTRegression<DTTestProtocol>

@property (nonatomic,readonly) double a;
@property (nonatomic,readonly) double b;
@property (nonatomic,readonly) double rr;
@property (nonatomic,readonly) double rr_corrected;


- (void) add_x:(double)x y:(double)y;
- (void) remove_x:(double)x y:(double)y;

- (double) x:(double)x; // returns Y for x
- (double) y:(double)y; // returns X for y

@end
