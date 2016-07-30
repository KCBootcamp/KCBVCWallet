//
//  NSObject+GNUStepAddons.m
//  BVCWallet
//
//  Created by Bhavish Chandnani on 30/7/16.
//  Copyright © 2016 BVC. All rights reserved.
//

#import "NSObject+GNUStepAddons.h"
#import <objc/runtime.h>

@implementation NSObject (GNUStepAddons)


- (id) subclassResponsibility: (SEL) aSel{
    
    char prefix = class_isMetaClass(object_getClass(self)) ? '+' : '-';
    
    [NSException raise:NSInvalidArgumentException
                format:@"%@%c%@ should be overriden by its class", NSStringFromClass([self class]), prefix, NSStringFromSelector(aSel)];
    return self;
}
@end
