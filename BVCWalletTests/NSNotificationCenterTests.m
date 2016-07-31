//
//  NSNotificationCenterTests.m
//  BVCWallet
//
//  Created by Bhavish Chandnani on 31/7/16.
//  Copyright © 2016 BVC. All rights reserved.
//

@import XCTest;
#import "Wallet.h"
#import "FakeNotificationCenter.h"


@interface NSNotificationCenterTests : XCTestCase

@end

@implementation NSNotificationCenterTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void) testThatSubscribesToMemoruyWarning{
    //We create a false notification center to check if it is added the observer
    FakeNotificationCenter *fake =[FakeNotificationCenter new];
    
    Wallet *w =[Wallet new];
    
    [w subscribeToMemoryWarning:(NSNotificationCenter *)fake];
    
    NSDictionary *obs = [fake observers];
    id observer = [obs objectForKey:UIApplicationDidReceiveMemoryWarningNotification];
    
    XCTAssertEqual(observer, w, @"Fat object must suscribe to UIApplicationDidReceiveMemoryWarningNotification");
    
}

@end
