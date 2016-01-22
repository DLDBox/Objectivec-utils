//
//  DTPower.m
//  CurveFit
//
//  Created by AtWorkUser on 11/10/15.
//  Copyright © 2015 Thinaire. All rights reserved.
//

#import "DTPower.h"

@implementation DTPower

- (double) a
{
    r[5] = r[21]*r[29] - r[28]*r[28];
    r[11] = (r[29]*r[30] - r[28]*r[32])/r[5];
    return exp(r[11]);
}

- (double) b
{
    r[5] = r[21]*r[29] - r[28]*r[28];
    r[12] = (r[21]*r[32] - r[28]*r[30])/r[5];
    return r[12];
}

- (double) rr
{
    double r30s = r[30]*r[30];
    return (r[11] * r[30] + r[12] * r[32] - (r30s)/r[21]) / (r[31] - r30s/r[21]);
}

- (double) rr_corrected
{
    return 1 - (( (1 - [self rr])*(r[21] - 1) ) / (r[21] - 2)) ;
}

- (double) x:(double)x
{
    return [self a] * pow( x ,[self b]);
}

- (double) y:(double)y
{
    return pow(y/[self a],1/[self b]);
}

- (BOOL) test_runAll
{
    DTPower *power = [[DTPower alloc] init];
    
    [power add_x:1 y:2.8];
    [power add_x:2 y:3.2];
    [power add_x:3 y:4.6];
    [power add_x:4 y:5.9];
    [power add_x:5 y:7.2];
    
    if ( fabs([power a] - 2.5) > 0.01 ) {
        NSLog( @"Error in linear regression fit (%f)",[power a] );
    }
    
    if ( fabs([power b] - 0.6) > 0.01 ) {
        NSLog( @"Error in linear regression fit (%f)",[power b] );
    }
    
    if ( fabs(0.917 - [power rr]) > 0.01   ) {
        NSLog( @"Error in linear regression fit (%f)",[power rr] );
    }
    
    ////////////////////////////////////////////
    //calculating y from x
    if ( fabs([power x:1.0] - 2.8) > 0.1 ) {
        NSLog( @"Error calculating y from x - %f should be 2.8",[power x:1.0] );
    }
    
    if ( fabs([power x:2.0] - 3.2) > 0.1 ) {
        NSLog( @"Error calculating y from x" );
    }
    
    if ( fabs([power x:3.0] - 4.6) > 0.1 ) {
        NSLog( @"Error calculating y from x" );
    }
    
    if ( fabs([power x:4.0] - 5.9) > 0.1 ) {
        NSLog( @"Error calculating y from x" );
    }
    
    if ( fabs([power x:5.0] - 7.2) > 0.1 ) {
        NSLog( @"Error calculating y from x" );
    }
    
    ////////////////////////////////////////////
    //calculating x from y
    if ( fabs([power y:2.8] - 1.0) > 0.1 ) {
        NSLog( @"Error calculating x from y" );
    }
    
    if ( fabs([power y:3.2] - 2.0) > 0.1 ) {
        NSLog( @"Error calculating x from y" );
    }
    
    if ( fabs([power y:4.6] - 3.0) > 0.1 ) {
        NSLog( @"Error calculating x from y" );
    }
    
    if ( fabs([power y:5.9] - 4.0) > 0.1 ) {
        NSLog( @"Error calculating x from y" );
    }
    
    if ( fabs([power y:7.2] - 5.0) > 0.1 ) {
        NSLog( @"Error calculating x from y" );
    }
    
    return TRUE;
}

@end
