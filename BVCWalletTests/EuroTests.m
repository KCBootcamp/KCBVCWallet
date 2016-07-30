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
    Euro *ten = [[Euro alloc] initWithAmount:10];
    
    Euro *total =  [euro times:2];
    
    XCTAssertEqualObjects(total, ten, @"€5*2 should be €10");
    
}

-(void) testEquality{
    Euro *five = [[Euro alloc] initWithAmount:5];
    Euro *ten = [[Euro alloc] initWithAmount:10];
    Euro *total = [five times: 2];
    
    XCTAssertEqualObjects(ten, total, @"Equivalent objects shoul be equal");
    
}

-(void) testHash{
    Euro *a = [[Euro alloc] initWithAmount:2];
    Euro *b = [[Euro alloc] initWithAmount:2];
    
    XCTAssertEqual([a hash], [b hash], @"Equal objects must have same hash");
}


-(void) testAmountStorage{
    Euro *euro = [[Euro alloc] initWithAmount:2];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    XCTAssertEqual(2, [[euro performSelector:@selector(amount)] integerValue], @"The value retrieved should be the same as th stored");
#pragma clagg diagnostic pop
}

@end
