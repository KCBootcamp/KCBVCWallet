//
//  Dollar.m
//  BVCWallet
//
//  Created by Bhavish Chandnani on 29/7/16.
//  Copyright © 2016 BVC. All rights reserved.
//

#import "Dollar.h"

@interface Dollar()
@property (nonatomic, readonly) NSInteger amount;

@end

@implementation Dollar

-(instancetype) initWithAmount:(NSInteger) amount{
    if (self= [super init]){
        _amount = amount;
    }
    return self;
}


-(Dollar *) times: (NSInteger) multiplier{
    return [[Dollar alloc] initWithAmount: _amount * multiplier];
}

#pragma mark - Overwritten
-(BOOL) isEqual:(id)object{
    return [self amount] == [object amount];
}

@end
