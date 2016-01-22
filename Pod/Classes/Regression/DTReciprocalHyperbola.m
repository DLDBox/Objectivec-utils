//
//  DTReciprocalHyperbola.m
//  CurveFit
//
//  Created by AtWorkUser on 11/2/15.
//  Copyright © 2015 Thinaire. All rights reserved.
//

#import "DTReciprocalHyperbola.h"

@implementation DTReciprocalHyperbola

- (double) a
{
    r[5] = r[21]*r[23] - r[22]*r[22];
    r[11] = (r[18]*r[23] - r[22]*r[35])/r[5];
    return r[11];
}

- (double) b
{
    r[5] = r[21]*r[23] - r[22]*r[22];
    r[12] = (r[21]*r[35] - r[18]*r[22])/r[5];
    return r[12];
}

- (double) rr
{
    double r18s = r[18]*r[18];
    return ([self a] * r[18] + [self b] * r[35] - (r18s)/r[21]) / (r[19] - r18s/r[21]);
}

- (double) rr_corrected
{
    return 1 - (( (1 - [self rr])*(r[21] - 1) ) / (r[21] - 2)) ;
}

- (double) x:(double)x
{
    return [self a] + [self b]/x;
}

- (double) y:(double)y
{
    return (y - [self b])/(y - [self a]);
}

- (BOOL) test_runAll
{
    DTReciprocalHyperbola *rhyperbola = [[DTReciprocalHyperbola alloc] init];
    
    [rhyperbola add_x:1 y:5.1];
    [rhyperbola add_x:2 y:3.1];
    [rhyperbola add_x:3 y:2.2];
    [rhyperbola add_x:4 y:1.7];
    [rhyperbola add_x:5 y:1.4];
    
    if ( fabs([rhyperbola a] - 0.013) > 0.01 ) {
        NSLog( @"Error in linear regression fit (%f)",[rhyperbola a] );
    }
    
    if ( fabs([rhyperbola b] - 4.570) > 0.01 ) {
        NSLog( @"Error in linear regression fit (%f)",[rhyperbola b] );
    }
    
    if ( fabs(0.992 - [rhyperbola rr]) > 0.01   ) {
        NSLog( @"Error in linear regression fit (%f)",[rhyperbola rr] );
    }
    
    ////////////////////////////////////////////
    //calculating y from x
    if ( fabs([rhyperbola x:1.0] - 5.1) > 0.01 ) {
        NSLog( @"Error calculating y from x" );
    }
    
    if ( fabs([rhyperbola x:2.0] - 3.1) > 0.01 ) {
        NSLog( @"Error calculating y from x" );
    }
    
    if ( fabs([rhyperbola x:3.0] - 2.2) > 0.01 ) {
        NSLog( @"Error calculating y from x" );
    }
    
    if ( fabs([rhyperbola x:4.0] - 1.7) > 0.01 ) {
        NSLog( @"Error calculating y from x" );
    }
    
    if ( fabs([rhyperbola x:5.0] - 1.4) > 0.01 ) {
        NSLog( @"Error calculating y from x" );
    }
    
    ////////////////////////////////////////////
    //calculating x from y
    if ( fabs([rhyperbola y:5.1] - 1.0) > 0.01 ) {
        NSLog( @"Error calculating x from y" );
    }
    
    if ( fabs([rhyperbola y:3.1] - 2.0) > 0.01 ) {
        NSLog( @"Error calculating x from y" );
    }
    
    if ( fabs([rhyperbola y:2.2] - 3.0) > 0.01 ) {
        NSLog( @"Error calculating x from y" );
    }
    
    if ( fabs([rhyperbola y:1.7] - 4.0) > 0.01 ) {
        NSLog( @"Error calculating x from y" );
    }
    
    if ( fabs([rhyperbola y:1.4] - 5.0) > 0.01 ) {
        NSLog( @"Error calculating x from y" );
    }
    
    return TRUE;
}

@end
