//
//  Wallet.h
//  BVCWallet
//
//  Created by Bhavish Chandnani on 30/7/16.
//  Copyright © 2016 BVC. All rights reserved.
//

@import Foundation;
@import UIKit;
#import "Money.h"

@interface Wallet : NSObject<Money>
@property (nonatomic, readonly) NSUInteger count;
@property (nonatomic, readonly) NSUInteger numberOfCurrencies;
@property(nonatomic, strong) NSMutableArray *currencies;

-(void) subscribeToMemoryWarning: (NSNotificationCenter *) nc;

-(NSUInteger)numberOfMoneysForCurrency:(NSString *) currency;

@end
