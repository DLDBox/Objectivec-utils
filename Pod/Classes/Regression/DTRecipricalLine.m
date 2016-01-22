//
//  DTRecipricalLine.m
//  CurveFit
//
//  Created by AtWorkUser on 11/2/15.
//  Copyright © 2015 Thinaire. All rights reserved.
//

#import "DTRecipricalLine.h"

@implementation DTRecipricalLine

- (double) a
{
    r[5] = r[17]*r[21] - r[16]*r[16];
    r[1] = r[11] = (r[17]*r[24] - r[16]*r[34])/r[5];
    return r[11];
}

- (double) b
{
    r[5] = r[17]*r[21] - r[16]*r[16];
    r[2] = r[12] = (r[21]*r[34] - r[16]*r[24])/r[5];
    return r[12];
}

- (double) rr
{
    double r24s = r[24]*r[24];
    return ([self a] * r[24] + [self b] * r[34] - (r24s)/r[21]) / (r[25] - r24s/r[21]);
}

- (double) x:(double)x
{
    return 1/([self a] + [self b]*x);
}

- (double) y:(double)y
{
    return ((1/y) - [self a])/[self b];
}

- (BOOL) test_runAll
{
    DTRecipricalLine *rLinear = [[DTRecipricalLine alloc] init];
    
    [rLinear add_x:1 y:5.1];
    [rLinear add_x:2 y:3.1];
    [rLinear add_x:3 y:2.2];
    [rLinear add_x:4 y:1.7];
    [rLinear add_x:5 y:1.4];
    
    if ( ([rLinear a] - 0.065) > 0.01 ) {
        NSLog( @"Error in linear regression fit (%f)",[rLinear a] );
    }
    
    if ( ([rLinear b] - 0.130) > 0.01 ) {
        NSLog( @"Error in linear regression fit (%f)",[rLinear b] );
    }
    
    
    if ( fabs(1.0 - [rLinear rr]) > 0.01   ) {
        NSLog( @"Error in linear regression fit (%f)",[rLinear rr] );
    }
    return TRUE;
}


@end
