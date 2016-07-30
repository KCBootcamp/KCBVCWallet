//
//  Broker.h
//  BVCWallet
//
//  Created by Bhavish Chandnani on 30/7/16.
//  Copyright © 2016 BVC. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Money;

@interface Broker : NSObject

-(Money *)reduce:(Money *) money toCurrency: (NSString *) currency;

-(void) addRate:(NSInteger) rate
   fromCurrency:(NSString *) fromCurrency
     toCurrency:(NSString *) toCurrency;
@end
