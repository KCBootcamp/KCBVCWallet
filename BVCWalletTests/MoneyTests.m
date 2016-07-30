//
//  MoneyTests.m
//  BVCWallet
//
//  Created by Bhavish Chandnani on 30/7/16.
//  Copyright © 2016 BVC. All rights reserved.
//

@import XCTest;
#import "Money.h"

@interface MoneyTests : XCTestCase

@end

@implementation MoneyTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void) testThatTimesRaisesException{
    Money *money = [[Money alloc] initWithAmount:1];
    XCTAssertThrows([money times:2], @"Should raise an exception");
}



@end
