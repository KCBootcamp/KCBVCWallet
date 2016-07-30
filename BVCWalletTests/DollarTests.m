//
//  DollarTests.m
//  BVCWallet
//
//  Created by Bhavish Chandnani on 29/7/16.
//  Copyright © 2016 BVC. All rights reserved.
//

@import XCTest;
#import "Dollar.h"

@interface DollarTests : XCTestCase

@end

@implementation DollarTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testMultiplication{
    Dollar *five = [[Dollar alloc] initWithAmount: 5];
    Dollar *ten = [[Dollar alloc] initWithAmount:10];
    
    Dollar *total =  [five times:2];
    
    XCTAssertEqualObjects(total, ten, @"$5*2 should be $10");
    
}

-(void) testEquality{
    Dollar *five = [[Dollar alloc] initWithAmount:5];
    Dollar *ten = [[Dollar alloc] initWithAmount:10];
    Dollar *total = [five times: 2];
    
    XCTAssertEqualObjects(ten, total, @"Equivalent objects shoul be equal");
    
}

@end
