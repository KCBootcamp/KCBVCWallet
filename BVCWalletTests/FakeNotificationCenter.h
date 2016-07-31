//
//  FakeNotificationCenter.h
//  BVCWallet
//
//  Created by Bhavish Chandnani on 31/7/16.
//  Copyright © 2016 BVC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FakeNotificationCenter : NSObject
@property (nonatomic, strong) NSMutableDictionary *observers;

-(void) addObserver:(id) observer
           selector:(SEL) aSelector
               name:(NSString*) aName
             object: (id)anObject;
@end
