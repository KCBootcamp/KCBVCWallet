//
//  Money.h
//  BVCWallet
//
//  Created by Bhavish Chandnani on 30/7/16.
//  Copyright © 2016 BVC. All rights reserved.
//

@import Foundation;

@interface Money : NSObject

-(instancetype) initWithAmount:(NSInteger)amount;

-(Money *) times: (NSInteger) multiplier;

@end
