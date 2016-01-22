//
//  DTHyperbola.m
//  CurveFit
//
//  Created by AtWorkUser on 11/2/15.
//  Copyright © 2015 Thinaire. All rights reserved.
//

#import "DTHyperbola.h"

@implementation DTHyperbola

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
    return [self b]/(y - [self a]);
}

- (BOOL) test_runAll
{
    DTHyperbola *hyperbola = [[DTHyperbola alloc] init];
    
    [hyperbola add_x:1 y:5.1];
    [hyperbola add_x:2 y:3.1];
    [hyperbola add_x:3 y:2.2];
    [hyperbola add_x:4 y:1.7];
    [hyperbola add_x:5 y:1.4];
    
    
    if ( fabs([hyperbola a] - 0.613) > 0.01 ) {
        NSLog( @"Error in linear regression fit a = (%f)",[hyperbola a] );
    }
    
    if ( fabs([hyperbola b] - 4.570) > 0.01 ) {
        NSLog( @"Error in linear regression fit b = (%f)",[hyperbola b] );
    }
    
    if ( fabs(0.992 - [hyperbola rr]) > 0.01   ) {
        NSLog( @"Error in linear regression fit rr = (%f)",[hyperbola rr] );
    }
    
    ////////////////////////////////////////////
    //calculating y from x
    if ( fabs([hyperbola x:1.0] - 5.1) > 0.1 ) {
        NSLog( @"Error calculating y from x - %f should be 5.1",[hyperbola x:1.0] );
    }
    
    if ( fabs([hyperbola x:2.0] - 3.1) > 0.3 ) {
        NSLog( @"Error calculating y from x, %f should be 3.1 for 2.0",[hyperbola x:2.0] );
    }
    
    if ( fabs([hyperbola x:3.0] - 2.2) > 0.1 ) {
        NSLog( @"Error calculating y from x, %f should be 2.2 for 3.0",[hyperbola x:3.0] );
    }
    
    if ( fabs([hyperbola x:4.0] - 1.7) > 0.1 ) {
        NSLog( @"Error calculating y from x, %f should be 1.7 for 4.0",[hyperbola x:4.0] );
    }
    
    if ( fabs([hyperbola x:5.0] - 1.4) > 0.2 ) {
        NSLog( @"Error calculating y from x, %f should be 1.4 for 5.0",[hyperbola x:5.0] );
    }
    
    ////////////////////////////////////////////
    //calculating x from y
    if ( fabs([hyperbola y:5.1] - 1.0) > 0.2 ) {
        NSLog( @"Error calculating x from y" );
    }
    
    if ( fabs([hyperbola y:3.1] - 2.0) > 0.2 ) {
        NSLog( @"Error calculating x from y" );
    }
    
    if ( fabs([hyperbola y:2.2] - 3.0) > 0.2 ) {
        NSLog( @"Error calculating x from y" );
    }
    
    if ( fabs([hyperbola y:1.7] - 4.0) > 0.2 ) {
        NSLog( @"Error calculating x from y" );
    }
    
    if ( fabs([hyperbola y:1.4] - 5.0) > 0.2 ) {
        NSLog( @"Error calculating y from x, %f should be 5.0 for 1.4",[hyperbola y:1.4] );
    }
    
    return TRUE;
}


@end
