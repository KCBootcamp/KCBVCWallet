//
//  Money.m
//  BVCWallet
//
//  Created by Bhavish Chandnani on 30/7/16.
//  Copyright © 2016 BVC. All rights reserved.
//

#import "Money.h"
#import "NSObject+GNUStepAddons.h"

@interface Money()

@property(nonatomic) NSNumber *amount;

@end

@implementation Money

+(id) euroWithAmount: (NSInteger) amount{
    return [[Money alloc] initWithAmount: amount andCurrency:@"EUR"];
}

+(id) dollarWithAmount: (NSInteger) amount{
    return [[Money alloc] initWithAmount: amount andCurrency:@"USD"];
    
}

-(instancetype) initWithAmount:(NSInteger) amount andCurrency: (NSString *) currency{
    if (self= [super init]){
        _amount = @(amount);
        _currency = currency;
    }
    return self;
}


-(id) times: (NSInteger) multiplier{
    return [[Money alloc] initWithAmount: [self.amount integerValue] * multiplier andCurrency:self.currency];
}

#pragma mark - Overwritten
- (NSString *) description{
    return [NSString stringWithFormat:@"<%@ %ld>", [self class], (long)[self amount]];
}

-(BOOL) isEqual:(id)object{
    if ([[self currency] isEqual:[object currency]]){
        return [self amount] == [object amount];
    } else{
        return NO;
    }
}

-(NSUInteger)hash{
    return (NSUInteger) self.amount;
}

@end
