# KCBVCWallet

This is a project is an iOS application to have a control of all the money you have in your wallet. The main purpose of this project is to learn, acquire and apply the principles of TDD.

The current project allows to create an object of type Wallet where you can add money with amount in different currencies(Euros and Dollars). Besides that, it implements methods to sum money units of different currencies and to provide the total amount you have in the the wallet for each currency and for all the currencies in Euros.

## Model

In order to work with the necessary data, this application implements different classes to define the money units, the composition of all the different money units and the change rates for the different currencies.

### Money
This class represents the money units saved in the Wallet.

##### Parameters
	Parameter	|	Type		|	Description
	------------|---------------|---------------
	amount 		|	Integer		|	Integer with the amount value of the money unit.
    currency	|	String		|	String that defines the currency of the amount.

##### Protocol methods
	+ Multiplier method -(id<Money>) times: (NSInteger) multiplier: Method that given an Integer returns an Object that implements the protocol Money, it gets the amount of the money unit and multiplies by a multiplier factor. 

	+ Addition method -(id<Money>) plus:(Money *) other: Method that given an Object Money returns an Object that implements the protocol Money, it makes a sum of two money units even if they are in different currencies.

	+ Currency reduction method -(id<Money>) reduceToCurrency:(NSString *) currency withBroker:(Broker *) broker: Method that given a String and a Broker Object returns an Object that implements the protocol Money, it converts a money object to another one with a different currency applying a conversion rate provided by the broker.

### Broker
This class provides methods for the currency conversion of a money object.

##### Parameters
	Parameter	|	Type		|	Description
	------------|---------------|---------------
	rates 		|	Dictionary	|	Dictionary with the conversion rates between different currencies.

##### Methods
	+ Currency reduction method -(Money *)reduce:(id<Money>) money toCurrency: (NSString *) currency: Method that given a String and an object that implements Money Protocol, it returns a Money object with a different currency applying a conversion rate.

	+ Rate addition method -(void) addRate:(NSInteger) rate fromCurrency:(NSString *) fromCurrency toCurrency:(NSString *) toCurrency: Method that given two currencies and a rate, stores the conversion rate in rates parameter.

	+ Dictionary conversion rate key method -(NSString *) keyFromCurrency:(NSString *) fromCurrency toCurrency:(NSString *) toCurrency: Method that given two currencies returns the key that should be used to store the conversion rate in the dictionary.

###### JSON parser method -(void) parseJSONRates:(NSData *)jsonData;
Method to serialize and parse a JSON with conversion rates.

### Wallet

##### Parameters
	Parameter			|	Type		|	Description
	--------------------|---------------|---------------
	count 				|	Integer		|	Number of money units saved in the wallet.
	currencies 			|	Array		|	Different currencies that the wallet has.

##### Methods
	+ Money count for currency method -(NSUInteger)numberOfMoneysForCurrency:(NSString *) currency: Method that given a currency returns the number of money objects of that currency saved in the wallet.

	+ Money for currency method -(NSMutableArray *)moneysForCurrency:(NSString *) currency: Method that given a currency returns an array with the money objects of that currency saved in the wallet.

	+ Amount addition for currency method -(NSUInteger)sumOfAllMoneysForCurrency:(NSString *) currency: Method that given a currency, makes the sum of all the amounts of the money objects with that currency.

	+ Amount addition method-(NSUInteger)sumOfAllMoneys: Method that makes the sum of all the amounts of the money objects saved in the wallet.

## Controllers

### WalletTable
The main view of the application, is a table divided by sections that correspond to each different currency saved in the wallet and each row represents a money object with the specific currency of the section. In the row it is displayed a text with the amount of the money unit. Additionally, each section has a row with the total amount for the specific currency and the last section of the table has a row with the total amount saved in the whole wallet in Euros.

## Tests
As the main purpose of this project is to learn, acquire and apply the principles of TDD; there are implemented several tests.

### Model Tests

#### Money Tests

	+ testCurrency: Checks if the currency stored is the correct one.

	+ testMultiplication: Checks times method implementation, if the multiplication is properly made.

	+ testEquality: Checks isEqual method implementation, this method is to compare if two objects are equivalent.

	+ testDifferentCurrencies: Checks that Money objects with different currencies are not equal.

	+ testHash: Checks that equal objects have the same hash.

	+ testAmountStorage: Checks that the retrieved amount value is the same as the stored.

	+ testSimpleAddition: Checks the proper implementation of the sum of two objects with the same currency.

	+ testHashIsAmount: Checks that the hash has the same value as the amount.

	+ testDescription: Checks that the description method retrieves a string with the correct format.

#### Broker Tests

	+ testSimpleReduction: Checks that the currency conversion to the same currency retrieves the same value.

	+ testReduction: Checks that the currency conversion to the a different currency retrieves the correct value.

	+ testThatNoRateRaisesException: Checks if an exception is caused when there is not any conversion rate.

	+ testThatNilConversionDoesNotChangeMoney: Checks that a nil conversion has no effect.

#### Wallet 

	+ testAdditonWithReduction:  Checks that the addition of two money object with different currencies is correct.

### Controller Tests

	+ testThatTextOnLabelIsEqualToTextOnButton: Checks in the simple view controller if the text in the label is the same as the text in the.

	+ testThatTableHasNumberOfCurrenciesSectionsPlusOne: Checks that the number of sections of the table is equal than the number of currencies plus one (total amount).

	+ testThatNumberOfCellsIsNumberOfMoneyPlusNumberOfSectionsPlusOne: Checks that the number of rows of the table is equal than the number of money objects plus the number of currencies plus one (total amount).

	+ testThatNumberOfCellsInEachSectionIsNumberOfMoneyOfThatCurrencyPlusOne: Checks that the number of rows for a specific section is equal than the number of money objects for a that currency plus one (total amount).

### Other tests

	+ testThatEmptyRatesRaisesException (Network behavior test); Checks if a empty JSON for the rates is provided it is raised an exception.

	+testThatSubscribesToMemoruyWarning (Notification center test): Checks if an object has subscribe to a memory warning notification.