//
//  Broker.m
//  BVCWallet
//
//  Created by Bhavish Chandnani on 30/7/16.
//  Copyright © 2016 BVC. All rights reserved.
//

#import "Broker.h"
#import "Money.h"

@interface Broker()
@property (nonatomic, strong) NSMutableDictionary *rates;
@end

@implementation Broker

-(id) init{
    if (self = [super init]){
        _rates = [@{}mutableCopy];
    }
    return self;
}

-(Money *)reduce:(Money *) money toCurrency: (NSString *) currency{
    //double dispatch
    double rate = [[self.rates objectForKey:[self keyFromCurrency: money.currency toCurrency:currency]]doubleValue];
    return [money reduceToCurrency:currency withRate:rate];
    
}

-(void) addRate:(NSInteger) rate
   fromCurrency:(NSString *) fromCurrency
     toCurrency:(NSString *) toCurrency{
    [self.rates setObject:@(rate) forKey:[self keyFromCurrency: fromCurrency toCurrency: toCurrency]];
    NSNumber *invRate = @(1.0/rate);
    [self.rates setObject:invRate forKey:[self keyFromCurrency: toCurrency toCurrency: fromCurrency]];
}


#pragma mark - utils
-(NSString *) keyFromCurrency:(NSString *) fromCurrency toCurrency:(NSString *) toCurrency{
    return [NSString stringWithFormat:@"%@-%@",fromCurrency,toCurrency];
}
     
@end
