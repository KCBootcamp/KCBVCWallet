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

-(id) initWithAmount:(NSInteger) amount andCurrency:(NSString *) currency{
    if (self = [super init]){
        Money *money = [[Money alloc] initWithAmount:amount andCurrency:currency];
        _moneys = [NSMutableArray array];
        [_moneys addObject:money];
    }
    return self;
}

-(id<Money>) plus:(Money *) money{
    [self.moneys addObject: money];
    
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
