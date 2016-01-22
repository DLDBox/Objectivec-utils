//
//  DTRegression.m
//  CurveFit
//
//  Created by AtWorkUser on 10/29/15.
//  Copyright © 2015 Thinaire. All rights reserved.
//

#import "DTRegression.h"

@interface DTRegression()
@end

@implementation DTRegression

- (instancetype) init
{
    self = [super init];
    
    if (self) {
        r = (double *)malloc( sizeof(double)*100 );
        [self reset];
    }
    return self;
}

- (instancetype) initWith100Doubles:(double *)doubles
{
    self = [super init];
    if (self) {
        r = doubles;
    }
    return self ;
}

- (void) reset
{
    for ( int i = 0; i < 100; i++) {
        r[i] = 0.0;
    }
}

- (double) a{
    return r[1];
}

- (double) b{
    return r[2];
}

- (double) c{
    return r[3];
}

- (double) d{
    return r[4];
}

- (double) r05{
    r[5] = r[17]*r[21] - r[16]*r[16];
    return r[5];
}

- (double) r11{
    r[11] = (r[17]*r[18] - r[16]*r[20])/[self r05];
    return r[11];
}

- (double) r12{
    r[12] = (r[20]*r[21] - r[16]*r[18])/[self r05];
    return r[12];
}

- (void) add_x:(double)x y:(double)y z:(double)z
{
    r[16] += x;
    r[17] += x*x;
    r[18] += y;
    r[19] += y*y;
    r[20] += x*y;
    r[21]++;
    r[22] += 1/x;
    r[23] += 1/(x*x);
    r[24] += 1/y;
    r[25] += 1/(y*y);
    r[26] += 1/(x*y);
    r[27]++;
    r[28] += log(x); // note: log() == ln()
    r[29] += log(x) * log(x);
    r[30] += log(y);
    r[31] += log(y) * log(y);
    r[32] += log(x) * log(y);
    r[33]++;
    r[34] += (x/y);
    r[35] += (y/x);
}

- (void) remove_x:(double)x y:(double)y z:(double)z
{
    r[16] -= x;
    r[17] -= x*x;
    r[18] -= y;
    r[19] -= y*y;
    r[20] -= x*y;
    r[21]--;
    r[22] -= 1/x;
    r[23] -= 1/(x*x);
    r[24] -= 1/y;
    r[25] -= 1/(y*y);
    r[26] -= 1/(x*y);
    r[27]--;
    r[28] -= log(x);
    r[29] -= log(x) * log(x);
    r[30] -= log(y);
    r[31] -= log(y) * log(y);
    r[32] -= log(x) * log(y);
    r[33]--;
    r[34] -= (x/y);
    r[35] -= (y/x);

}
- (double) x:(double)x
{
    return 0.0;
}

- (double) y:(double)y
{
    return 0.0;
}

@end
