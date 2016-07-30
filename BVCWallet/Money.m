//
//  Money.m
//  BVCWallet
//
//  Created by Bhavish Chandnani on 30/7/16.
//  Copyright © 2016 BVC. All rights reserved.
//

#import "Money.h"


@interface Money()

@property(nonatomic) NSInteger amount;

@end

@implementation Money

-(instancetype) initWithAmount:(NSInteger) amount{
    if (self= [super init]){
        _amount = amount;
    }
    return self;
}


-(Money *) times: (NSInteger) multiplier{
    // You should use the subclass method instead.
    
    return self;
}

@end
