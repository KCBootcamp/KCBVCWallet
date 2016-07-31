//
//  WalletTableViewController.m
//  BVCWallet
//
//  Created by Bhavish Chandnani on 31/7/16.
//  Copyright © 2016 BVC. All rights reserved.
//

#import "WalletTableViewController.h"
#import "Wallet.h"

@interface WalletTableViewController ()
@property (nonatomic, strong) Wallet *model;
@end

@implementation WalletTableViewController

-(id) initWithModel:(Wallet *)model{
    if(self =[super initWithStyle:UITableViewStylePlain]){
        _model=model;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return [self.model numberOfCurrencies] +1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger rows=0;
    if (section == ([self.model numberOfCurrencies])){
        rows=1;
    }else{
        rows = [self.model numberOfMoneysForCurrency:[self.model.currencies objectAtIndex:section]] +1;
    }
    return rows;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell){
        cell =[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    if (indexPath.section == [self.model numberOfCurrencies]){
        cell.textLabel.text = [NSString stringWithFormat:@"Total Amount: %lu", (unsigned long)[self.model sumOfAllMoneys]];
    }else{
        NSString *currency = [self.model.currencies objectAtIndex:indexPath.section];
        NSArray * moneys = [self.model moneysForCurrency:currency];
        if (indexPath.section == [self.model numberOfCurrencies]){
            cell.textLabel.text = [NSString stringWithFormat:@"Total Amount for %@: %lu", currency, (unsigned long)[self.model sumOfAllMoneysForCurrency:currency]];
        
        }else{
    
            cell.textLabel.text = [NSString stringWithFormat:@"Amount: %@", ((Money *)[moneys objectAtIndex:indexPath.row]).amount];
        
        }
    }
    return cell;
}


-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSString *title;
    if (section == ([self.model numberOfCurrencies])){
        title=@"Total";
    }else{
        NSString *currency = [self.model.currencies objectAtIndex:section];
        title=currency;
    }
    return title;

}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
