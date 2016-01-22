//
//  DTRegression.h
//  CurveFit
//
//  Created by AtWorkUser on 10/29/15.
//  Copyright © 2015 Thinaire. All rights reserved.
//

#import <Foundation/Foundation.h>

/* Regression handler, this object will accumulate all of the summation values
   each new curve will inherit form this object and use the summation values for calculations

 */

@interface DTRegression : NSObject{
@public
    double *r;
}

@property (nonatomic,readonly) double a;
@property (nonatomic,readonly) double b;
@property (nonatomic,readonly) double c;
@property (nonatomic,readonly) double d;
@property (nonatomic,readonly) double rr;
@property (nonatomic,readonly) double rr_corrected;

- (instancetype) initWith100Doubles:(double *)doubles;

- (void) add_x:(double)x y:(double)y z:(double)z;
- (void) remove_x:(double)x y:(double)y z:(double)z;
- (void) reset;

- (double) x:(double)x; // returns Y for x
- (double) y:(double)y; // returns X for y

@end
