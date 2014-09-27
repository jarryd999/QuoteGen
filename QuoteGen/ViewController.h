//
//  ViewController.h
//  QuoteGen
//
//  Created by Goodman, Jarryd A - (jarryd999) on 9/26/14.
//  Copyright (c) 2014 Goodman, Jarryd A - (jarryd999). All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

//arrays to store both types of quotes
@property (nonatomic, strong) NSArray *myQuotes;
@property (nonatomic, strong) NSMutableArray *movieQuotes;


//text for the quote, linked to the view controller
@property (nonatomic, strong) IBOutlet UITextView *quoteText;


//method called when change-quote button is hit
- (IBAction)quoteButtonTapped:(id)sender;

//property to link to segmented control for selecting movie type
@property (nonatomic, strong) IBOutlet UISegmentedControl *quoteOpt;


@end

