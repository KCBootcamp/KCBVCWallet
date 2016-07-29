//
//  EuroTests.m
//  BVCWallet
//
//  Created by Bhavish Chandnani on 29/7/16.
//  Copyright © 2016 BVC. All rights reserved.
//

@import XCTest;

#import "Euro.h"

@interface EuroTests : XCTestCase

@end

@implementation EuroTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testMultiplication{
    Euro *euro = [[Euro alloc] initWithAmount: 5];
    Euro *total =  [euro times:2];
    
    XCTAssertEqual(total.amount, 10, @"Both should be equal");
    
}

-(void) testEquality{
    Euro *five = [[Euro alloc] initWithAmount:5];
    Euro *ten = [[Euro alloc] initWithAmount:10];
    Euro *total = [five times: 2];
    
    XCTAssertEqualObjects(ten, total, @"Equivalent objects shoul be equal");
    
}

@end
