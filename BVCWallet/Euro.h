//
//  Euro.h
//  BVCWallet
//
//  Created by Bhavish Chandnani on 29/7/16.
//  Copyright © 2016 BVC. All rights reserved.
//

@import Foundation;

@interface Euro : NSObject

-(instancetype) initWithAmount:(NSInteger)amount;

-(Euro *) times: (NSInteger) multiplier;

@end
