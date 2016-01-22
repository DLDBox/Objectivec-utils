//
//  objectivec-utilsTests.m
//  objectivec-utilsTests
//
//  Created by DDevoe on 01/21/2016.
//  Copyright (c) 2016 DDevoe. All rights reserved.
//

@import XCTest;
#import "DTBiDiQue.h"
#import "DTLinear.h"
#import "DTRecipricalLine.h"
#import "DTHyperbola.h"
#import "DTPower.h"


@interface Tests : XCTestCase

@end

@implementation Tests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
    NSMutableArray *array = [[NSMutableArray alloc] initWithArray: @[@1,@2,@3,@4,@5,@6]];
    DTBiDiQue *dbq = [[DTBiDiQue alloc] initWithArray:array];
    
    XCTAssertTrue( [dbq depth],@"Depth Error"  );

}

- (void)testRegression{
    
    DTLinear *linear = [[DTLinear alloc] init];
    DTRecipricalLine *rLine = [[DTRecipricalLine alloc] initWith100Doubles:linear->r];
    DTHyperbola *hyperbola = [[DTHyperbola alloc] initWith100Doubles:linear->r];
    DTPower *power = [[DTPower alloc] initWith100Doubles:linear->r];
    
    [linear test_runAll];
    [rLine test_runAll];
    [hyperbola test_runAll];
    [power test_runAll];
    
}

@end

