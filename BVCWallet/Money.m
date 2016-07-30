//
//  Money.m
//  BVCWallet
//
//  Created by Bhavish Chandnani on 30/7/16.
//  Copyright © 2016 BVC. All rights reserved.
//

#import "Money.h"
#import "NSObject+GNUStepAddons.h"
#import "Money-Private.h"



@implementation Money

-(instancetype) initWithAmount:(NSInteger) amount{
    if (self= [super init]){
        _amount = @(amount);
    }
    return self;
}


-(Money *) times: (NSInteger) multiplier{
    // You should use the subclass method instead.
    
    return [self subclassResponsibility:_cmd];
}

#pragma mark - Overwritten
- (NSString *) description{
    return [NSString stringWithFormat:@"<%@ %ld>", [self class], (long)[self amount]];
}

-(BOOL) isEqual:(id)object{
    return [self amount] == [object amount];
}

-(NSUInteger)hash{
    return (NSUInteger) self.amount;
}

@end
