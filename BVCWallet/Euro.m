//
//  Euro.m
//  BVCWallet
//
//  Created by Bhavish Chandnani on 29/7/16.
//  Copyright © 2016 BVC. All rights reserved.
//

#import "Euro.h"

@interface Euro()
@property (nonatomic) NSInteger amount;
@end

@implementation Euro

-(instancetype) initWithAmount:(NSInteger) amount{
    if (self= [super init]){
        _amount = amount;
    }
    return self;
}


-(Euro *) times: (NSInteger) multiplier{
    return [[Euro alloc] initWithAmount: _amount * multiplier];
}

#pragma mark - Overwritten
-(BOOL) isEqual:(id)object{
    return [self amount] == [object amount];
}
@end
