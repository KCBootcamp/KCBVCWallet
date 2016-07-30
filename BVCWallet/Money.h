//
//  Money.h
//  BVCWallet
//
//  Created by Bhavish Chandnani on 30/7/16.
//  Copyright © 2016 BVC. All rights reserved.
//

@import Foundation;

@interface Money : NSObject

@property(nonatomic, readonly) NSNumber *amount;
@property(nonatomic, readonly) NSString *currency;

+(id) euroWithAmount: (NSInteger) amount;

+(id) dollarWithAmount: (NSInteger) amount;

-(instancetype) initWithAmount:(NSInteger) amount andCurrency: (NSString *) currency;

-(id) times: (NSInteger) multiplier;

-(Money *) plus:(Money *) other;

@end
