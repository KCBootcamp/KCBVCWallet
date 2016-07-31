//
//  Wallet.m
//  BVCWallet
//
//  Created by Bhavish Chandnani on 30/7/16.
//  Copyright © 2016 BVC. All rights reserved.
//

#import "Wallet.h"
#import "Broker.h"

@interface Wallet()

@property(nonatomic, strong) NSMutableArray *moneys;

@end

@implementation Wallet

-(NSUInteger) count{
    return [self.moneys count];
}

-(NSUInteger) numberOfCurrencies{
    return [self.currencies count];
}

-(id) initWithAmount:(NSInteger) amount andCurrency:(NSString *) currency{
    if (self = [super init]){
        Money *money = [[Money alloc] initWithAmount:amount andCurrency:currency];
        _moneys = [NSMutableArray array];
        _currencies = [NSMutableArray array];
        [_moneys addObject:money];
        [_currencies addObject: currency];
    }
    return self;
}

-(id<Money>) plus:(Money *) money{
    [self.moneys addObject: money];
    if (![self.currencies containsObject:money.currency]){
        [self.currencies addObject: money.currency];
    }
    return self;
}

-(id<Money>) times: (NSInteger) multiplier{
    NSMutableArray *newMoneys = [NSMutableArray arrayWithCapacity:self.moneys.count];
    for (Money *each in self.moneys) {
        Money *newMoney = [each times:multiplier];
        [newMoneys addObject:newMoney];
    }
    self.moneys=newMoneys;
    return self;
}


-(id<Money>) reduceToCurrency:(NSString *) currency
                     withBroker:(Broker *) broker{

    Money *result= [[Money alloc]initWithAmount:0 andCurrency:currency];
    
    for (Money *each in self.moneys) {
        result = [result plus: [each reduceToCurrency:currency withBroker:broker] ];
    }
    return result;
}

-(NSUInteger)numberOfMoneysForCurrency:(NSString *) currency{
    NSUInteger count=0;
    for (Money *each in self.moneys) {
        if ([each.currency isEqual:currency]){
            count++;
        }
    }
    return count;
}

-(NSMutableArray *)moneysForCurrency:(NSString *) currency{
    NSMutableArray *moneys=[NSMutableArray array];
    for (Money *each in self.moneys) {
        if ([each.currency isEqual:currency]){
            [moneys addObject:each];
        }
    }
    return moneys;
}

- (NSUInteger)sumOfAllMoneysForCurrency:(NSString *) currency{
    Money *m = [[Money alloc] initWithAmount:0 andCurrency:@"EUR"];

    for (Money *each in self.moneys) {
        if ([each.currency isEqual:currency]){
            m = [m plus:each];
        }
    }
    return [m.amount integerValue];
}

- (NSUInteger)sumOfAllMoneys{
    Money *m = [[Money alloc] initWithAmount:0 andCurrency:@"EUR"];
    
    for (Money *each in self.moneys) {
        m = [m plus:each];
    }
    return [m.amount integerValue];
}

#pragma mark - Notifications
-(void) subscribeToMemoryWarning: (NSNotificationCenter *) nc{
    
    
    [nc addObserver:self
           selector: @selector(dumpToDisk:)
               name:UIApplicationDidReceiveMemoryWarningNotification
             object:nil];
}

-(void) dumpToDisk:(NSNotification *) notification{
    //Save your stuff on disk.
}
@end
