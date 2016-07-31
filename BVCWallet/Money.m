//
//  Money.m
//  BVCWallet
//
//  Created by Bhavish Chandnani on 30/7/16.
//  Copyright © 2016 BVC. All rights reserved.
//

#import "Money.h"
#import "Broker.h"

@implementation Money

+(id) euroWithAmount: (NSInteger) amount{
    return [[Money alloc] initWithAmount: amount andCurrency:@"EUR"];
}

+(id) dollarWithAmount: (NSInteger) amount{
    return [[Money alloc] initWithAmount: amount andCurrency:@"USD"];
    
}

-(id) initWithAmount:(NSInteger) amount andCurrency: (NSString *) currency{
    if (self= [super init]){
        _amount = @(amount);
        _currency = currency;
    }
    return self;
}


-(id<Money>) times: (NSInteger) multiplier{
    return [[Money alloc] initWithAmount: [self.amount integerValue] * multiplier andCurrency:self.currency];
}

-(id<Money>) plus:(Money *) other{
    
    NSInteger totalAmount = [self.amount integerValue] + [other.amount integerValue];
    
    return [[Money alloc] initWithAmount:totalAmount andCurrency:self.currency];
    
}


-(id<Money>) reduceToCurrency:(NSString *) currency withBroker:(Broker *) broker{
    double rate = [[broker.rates objectForKey:[broker keyFromCurrency: self.currency toCurrency:currency]]doubleValue];
    
    Money *result;
    
    if ([self.currency isEqual:currency]){
        result = self;
    }else if (rate == 0){
        // There is not convesion rate, exception
        [NSException raise:@"NoConversionRateException" format:@"Must have a conversion from %@ to %@", self.currency, currency];
    }else{
        
        NSInteger newAmount = [self.amount integerValue]* rate;
        
        Money *newMoney = [[Money alloc] initWithAmount:newAmount
                                            andCurrency:currency];
        
        result = newMoney;
    }
    
    return result;

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
