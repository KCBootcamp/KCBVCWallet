//
//  Broker.h
//  BVCWallet
//
//  Created by Bhavish Chandnani on 30/7/16.
//  Copyright © 2016 BVC. All rights reserved.
//

@import Foundation;
#import "Money.h"

@interface Broker : NSObject

@property (nonatomic, strong) NSMutableDictionary *rates;

-(Money *)reduce:(id<Money>) money toCurrency: (NSString *) currency;

-(void) addRate:(NSInteger) rate
   fromCurrency:(NSString *) fromCurrency
     toCurrency:(NSString *) toCurrency;

-(NSString *) keyFromCurrency:(NSString *) fromCurrency toCurrency:(NSString *) toCurrency;

-(void) parseJSONRates:(NSData *)jsonData;
@end
