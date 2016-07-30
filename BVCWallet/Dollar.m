//
//  Dollar.m
//  BVCWallet
//
//  Created by Bhavish Chandnani on 29/7/16.
//  Copyright © 2016 BVC. All rights reserved.
//

#import "Dollar.h"
#import "Money-Private.h"



@implementation Dollar


-(Dollar *) times: (NSInteger) multiplier{
    return [[Dollar alloc] initWithAmount: [self.amount integerValue] * multiplier];
}


@end
