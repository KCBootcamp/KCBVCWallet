//
//  ControllerTests.m
//  BVCWallet
//
//  Created by Bhavish Chandnani on 31/7/16.
//  Copyright © 2016 BVC. All rights reserved.
//

@import XCTest;
#import "SimpleViewController.h"
#import "WalletTableViewController.h"
#import "Wallet.h"

@interface ControllerTests : XCTestCase
@property (nonatomic, strong) SimpleViewController *simpleVC;
@property (nonatomic, strong) UIButton *btn;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) WalletTableViewController *walletVC;
@property (nonatomic, strong) Wallet *wallet;
@end

@implementation ControllerTests

- (void)setUp {
    [super setUp];
    self.simpleVC = [[SimpleViewController alloc] initWithNibName:nil bundle:nil];
    self.btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.btn setTitle:@"Hola" forState:UIControlStateNormal];
    self.label = [[UILabel alloc] initWithFrame:CGRectZero];
    self.simpleVC.displayLabel = self.label;
    
    self.wallet = [[Wallet alloc] initWithAmount:1 andCurrency:@"USD"];
    [self.wallet plus:[Money euroWithAmount:1]];
    self.walletVC =[[WalletTableViewController alloc] initWithModel: self.wallet];
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

-(void) testThatTableHasOneSection{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wnonnull"
    NSUInteger sections = [self.walletVC numberOfSectionsInTableView:nil];
#pragma clang diagnostic pop
    XCTAssertEqual(sections, 1,@"There can be only one section!");
}

-(void) testThatNumberOfCellsIsNumberOfMoneyPlusOne{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wnonnull"
    XCTAssertEqual(self.wallet.count +1, [self.walletVC tableView:nil numberOfRowsInSection:0], @"Number of cells is the number of moneys plus 1");
#pragma clang diagnostic pop
}
@end
