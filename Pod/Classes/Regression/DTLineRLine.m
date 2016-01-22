//
//  DTLineRLine.m
//  CurveFit
//
//  Created by AtWorkUser on 11/2/15.
//  Copyright © 2015 Thinaire. All rights reserved.
//

#import "DTLineRLine.h"

@implementation DTLineRLine

- (double) a
{
    double r22s = r[22]*r[22];
    
    r[5] = r[17]*r[21] - r[16]*r[16];
    r[6] = r[21]*r[35] - r[18]*r[22];
    r[7] = r22s - r[16]*r[22];
    r[8] = r[20]*r[21] - r[16]*r[18];
    r[9] = r[21]*r[23] - r22s;
    
    r[13] = (r[5]*r[6] - r[7]*r[8])/(r[5]*r[9] - r[7]*r[7]);
    r[12] = (r[8] - r[7]*r[13])/r[5];
    r[11] = (r[18] - r[12]*r[16] - r[13]*r[22])/r[21];
    return r[11];
}

- (double) b
{
    [self a];
    return r[12];
}

- (double) c
{
    [self a];
    return r[13];
}

- (double) rr
{
    double r18s = r[18]*r[18];
    return ([self a] * r[18] + [self b] * r[20] + r[13] *r[35] - r18s/r[21]) / (r[19] - r18s/r[21]);
}

- (BOOL) test_runAll
{
    DTLineRLine *rLinear = [[DTLineRLine alloc] init];
    
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
