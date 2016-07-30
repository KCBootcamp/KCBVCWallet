//
//  Euro.m
//  BVCWallet
//
//  Created by Bhavish Chandnani on 29/7/16.
//  Copyright © 2016 BVC. All rights reserved.
//

#import "Euro.h"
#import "Money-Private.h"

@implementation Euro


-(Euro *) times: (NSInteger) multiplier{
    return [[Euro alloc] initWithAmount: [self.amount integerValue] * multiplier];
}


@end
