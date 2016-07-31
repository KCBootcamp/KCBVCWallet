//
//  WalletTableViewController.h
//  BVCWallet
//
//  Created by Bhavish Chandnani on 31/7/16.
//  Copyright © 2016 BVC. All rights reserved.
//

@import UIKit;
@class Wallet;

@interface WalletTableViewController : UITableViewController

-(id) initWithModel: (Wallet * ) model;

@end
