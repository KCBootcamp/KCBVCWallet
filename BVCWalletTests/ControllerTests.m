//
//  ControllerTests.m
//  BVCWallet
//
//  Created by Bhavish Chandnani on 31/7/16.
//  Copyright © 2016 BVC. All rights reserved.
//

@import XCTest;
#import "SimpleViewController.h"

@interface ControllerTests : XCTestCase
@property (nonatomic, strong) SimpleViewController *simpleVC;
@property (nonatomic, strong) UIButton *btn;
@property (nonatomic, strong) UILabel *label;
@end

@implementation ControllerTests

- (void)setUp {
    [super setUp];
    self.simpleVC = [[SimpleViewController alloc] initWithNibName:nil bundle:nil];
    self.btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.btn setTitle:@"Hola" forState:UIControlStateNormal];
    self.label = [[UILabel alloc] initWithFrame:CGRectZero];
    self.simpleVC.displayLabel = self.label;
}

- (void)tearDown {

    [super tearDown];
    self.simpleVC =nil;
    self.btn=nil;
    self.label=nil;
}

-(void) testThatTeextOnLabelIsEqualToTextOnButton{
    // Send the message
    [self.simpleVC displayText: self.btn];
    
    //Check if button and label have the same text
    XCTAssertEqualObjects(self.btn.titleLabel.text, self.label.text, @"Button and label should have the same text");
}
@end
