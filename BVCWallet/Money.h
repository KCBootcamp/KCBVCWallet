//
//  Money.h
//  BVCWallet
//
//  Created by Bhavish Chandnani on 30/7/16.
//  Copyright © 2016 BVC. All rights reserved.
//

@import Foundation;
@class Money;
@class Broker;

@protocol Money <NSObject>

-(id) initWithAmount:(NSInteger) amount andCurrency: (NSString *) currency;

-(id<Money>) times: (NSInteger) multiplier;

-(id<Money>) plus:(Money *) other;

-(id<Money>) reduceToCurrency:(NSString *) currency withRate:(double) rate;

@end

@interface Money : NSObject<Money>

@property(nonatomic, readonly) NSNumber *amount;
@property(nonatomic, readonly) NSString *currency;

+(id) euroWithAmount: (NSInteger) amount;

+(id) dollarWithAmount: (NSInteger) amount;

@end
