//
//  Dollar.h
//  BVCWallet
//
//  Created by Bhavish Chandnani on 29/7/16.
//  Copyright © 2016 BVC. All rights reserved.
//

@import Foundation;

#import "Money.h"

@interface Dollar : Money


-(Dollar *) times: (NSInteger) multiplier;

@end
