//
//  Broker.m
//  BVCWallet
//
//  Created by Bhavish Chandnani on 30/7/16.
//  Copyright © 2016 BVC. All rights reserved.
//

#import "Broker.h"
#import "Money.h"


@implementation Broker

-(id) init{
    if (self = [super init]){
        _rates = [@{}mutableCopy];
    }
    return self;
}

-(Money *)reduce:(id<Money>) money toCurrency: (NSString *) currency{
    //double dispatch

    return [money reduceToCurrency:currency withBroker:self];
    
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

#pragma mark - Rates
-(void) parseJSONRates:(NSData *)jsonData{
    NSError *err = nil;
    id obj = [NSJSONSerialization JSONObjectWithData:jsonData
                                             options:NSJSONReadingAllowFragments
                                               error:&err];
    
    if (obj != nil){
        //We get and store the rates into he broker
    }else{
        //We don't have received anything
        [NSException raise:@"NoRatesInJSONException"
                    format:@"JSON must carry some data"];
    }
}
@end
