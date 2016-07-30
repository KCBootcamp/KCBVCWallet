//
//  Money.m
//  BVCWallet
//
//  Created by Bhavish Chandnani on 30/7/16.
//  Copyright © 2016 BVC. All rights reserved.
//

#import "Money.h"
#import "NSObject+GNUStepAddons.h"


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

-(Money *) plus:(Money *) other{
    
    NSInteger totalAmount = [self.amount integerValue] + [other.amount integerValue];
    
    return [[Money alloc] initWithAmount:totalAmount andCurrency:self.currency];
    
}

#pragma mark - Overwritten
- (NSString *) description{
    return [NSString stringWithFormat:@"<%@: %@ %@>", [self class], self.currency,self.amount];
}

-(BOOL) isEqual:(id)object{
    if ([[self currency] isEqual:[object currency]]){
        return [self amount] == [object amount];
    } else{
        return NO;
    }
}

-(NSUInteger)hash{
    return [self.amount integerValue];
}

@end
