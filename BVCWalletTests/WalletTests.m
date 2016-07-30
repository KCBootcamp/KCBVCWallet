//
//  WalletTests.m
//  BVCWallet
//
//  Created by Bhavish Chandnani on 30/7/16.
//  Copyright © 2016 BVC. All rights reserved.
//

@import XCTest;

#import "Money.h"
#import "Broker.h"
#import "Wallet.h"

@interface WalletTests : XCTestCase

@end

@implementation WalletTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void) testAdditonWithReduction{
    //€40 + $20 = $100 2:1
    Broker *broker = [Broker new];
    [broker addRate: 2 fromCurrency:@"USD" toCurrency:@"EUR"];
    
    Wallet *wallet = [[Wallet alloc] initWithAmount:40 andCurrency:@"EUR"];
    
    [wallet plus: [Money dollarWithAmount: 20]];
    
    Money *reduced = [broker reduce:wallet toCurrency:@"USD"];
    
    XCTAssertEqualObjects(reduced, [Money dollarWithAmount:100], @"€40 + $20 = $100 2:1");
    
}

@end
