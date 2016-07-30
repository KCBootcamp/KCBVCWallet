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

-(void) testCurrency{
    XCTAssertEqualObjects(@"USD", [[Money dollarWithAmount:1] currency], @"Dollars should be dollars");
    
    XCTAssertEqualObjects(@"EUR", [[Money euroWithAmount:1] currency], @"Euros should be euro");
}


- (void)testMultiplication{
    Money *euro = [Money euroWithAmount: 5];
    Money *ten = [Money euroWithAmount:10];
    
    Money *total =  [euro times:2];
    
    XCTAssertEqualObjects(total, ten, @"€5*2 should be €10");
    
}

-(void) testEquality{
    Money *five = [Money euroWithAmount:5];
    Money *ten = [Money euroWithAmount:10];
    Money *total = [five times: 2];
    
    XCTAssertEqualObjects(ten, total, @"Equivalent objects should be equal");
    XCTAssertEqualObjects([Money dollarWithAmount:4], [[Money dollarWithAmount:2] times:2], @"Equivalent objects should be equal");
    
    
}

-(void) testDifferentCurrencies{
    Money *euro = [Money euroWithAmount:1];
    Money *dollar = [Money dollarWithAmount:1];
    
    XCTAssertNotEqualObjects(euro, dollar,@"Different currencies should not be equal!");
}

-(void) testHash{
    Money *a = [Money euroWithAmount:2];
    Money *b = [Money euroWithAmount:2];
    
    XCTAssertEqual([a hash], [b hash], @"Equal objects must have same hash");
    
    XCTAssertEqual([[Money dollarWithAmount:1] hash], [[Money dollarWithAmount:1] hash], @"Equal objects must have same hash");
}


-(void) testAmountStorage{
    Money *euro = [Money euroWithAmount:2];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    XCTAssertEqual(2, [[euro performSelector:@selector(amount)] integerValue], @"The value retrieved should be the same as th stored");
    
    XCTAssertEqual(2, [[[Money dollarWithAmount:2] performSelector:@selector(amount)] integerValue], @"The value retrieved should be the same as th stored");
#pragma clagg diagnostic pop
}


@end
