//
//  DTLinear.m
//  CurveFit
//
//  Created by AtWorkUser on 10/29/15.
//  Copyright © 2015 Thinaire. All rights reserved.
//

#import "DTLinear.h"

@implementation DTLinear

- (void) add_x:(double)x y:(double)y
{
    [super add_x:x y:y z:0.0];
}

- (void) remove_x:(double)x y:(double)y
{
    [super remove_x:x y:y z:0.0];
}

- (double) a
{
    r[5] = r[17]*r[21] - r[16]*r[16];
    r[1] = r[11] = (r[17]*r[18] - r[16]*r[20])/r[5];
    return r[11];
}

- (double) b
{
    r[5] = r[17]*r[21] - r[16]*r[16];
    r[2] = r[12] = (r[20]*r[21] - r[16]*r[18])/r[5];
    return r[12];
}

- (double) rr
{
    double r18s = r[18]*r[18];
    return ([self a] * r[18] + [self b] * r[20] - (r18s)/r[21]) / (r[19] - r18s/r[21]);
}

- (double) rr_corrected
{
   return 1 - (( (1 - [self rr])*(r[21] - 1) ) / (r[21] - 2)) ;
}

- (double) x:(double)x
{
    return [self a] + [self b]*x;
}

- (double) y:(double)y
{
    return (y - [self a])/[self b];
}

- (BOOL) test_runAll
{
    DTLinear *linear = [[DTLinear alloc] init];
    
    [linear add_x:10 y:28];
    [linear add_x:20 y:32];
    [linear add_x:30 y:46];
    [linear add_x:40 y:59];
    [linear add_x:50 y:72];
    
    if ( [linear a] != 12.90 ) {
        NSLog( @"Error in linear regression fit (%f)",[linear a] );
    }
    
    if ( [linear b] != 1.15 ) {
        NSLog( @"Error in linear regression fit (%f)",[linear b] );
    }
    
    
    if ( fabs(0.975871 - [linear rr]) > 0.01   ) {
        NSLog( @"Error in linear regression fit (%f)",[linear rr] );
    }
    return TRUE;
}

@end
