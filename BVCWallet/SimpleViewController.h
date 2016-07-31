//
//  SimpleViewController.h
//  BVCWallet
//
//  Created by Bhavish Chandnani on 31/7/16.
//  Copyright © 2016 BVC. All rights reserved.
//

@import Foundation;
@import UIKit;

@interface SimpleViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *displayLabel;
- (IBAction)displayText:(id)sender;

@end
