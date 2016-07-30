////
////  DollarTests.m
////  BVCWallet
////
////  Created by Bhavish Chandnani on 29/7/16.
////  Copyright © 2016 BVC. All rights reserved.
////
//
//@import XCTest;
//#import "Dollar.h"
//
//@interface DollarTests : XCTestCase
//
//@end
//
//@implementation DollarTests
//
//- (void)setUp {
//    [super setUp];
//    // Put setup code here. This method is called before the invocation of each test method in the class.
//}
//
//- (void)tearDown {
//    // Put teardown code here. This method is called after the invocation of each test method in the class.
//    [super tearDown];
//}
//
//- (void)testMultiplication{
//    Dollar *five = [Money dollarWithAmount: 5];
//    Dollar *ten = [Money dollarWithAmount:10];
//    
//    Dollar *total =  [five times:2];
//    
//    XCTAssertEqualObjects(total, ten, @"$5*2 should be $10");
//    
//}
//
//-(void) testEquality{
//    Dollar *five = [Money dollarWithAmount:5];
//    Dollar *ten = [Money dollarWithAmount:10];
//    Dollar *total = [five times: 2];
//    
//    XCTAssertEqualObjects(ten, total, @"Equivalent objects shoul be equal");
//    XCTAssertFalse([total isEqual:five], @"Non equivalent objects should not be equal");
//    
//}
//
//-(void) testHash{
//    Dollar *a = [Money dollarWithAmount:2];
//    Dollar *b = [Money dollarWithAmount:2];
//    
//    XCTAssertEqual([a hash], [b hash], @"Equal objects must have same hash");
//}
//
//-(void) testAmountStorage{
//    Dollar *dollar = [Money dollarWithAmount:2];
//#pragma clang diagnostic push
//#pragma clang diagnostic ignored "-Wundeclared-selector"
//    XCTAssertEqual(2, [[dollar performSelector:@selector(amount)] integerValue], @"The value retrieved should be the same as th stored");
//#pragma clagg diagnostic pop
//}
//
//@end
