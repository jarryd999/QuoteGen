//
//  ViewController.h
//  QuoteGen
//
//  Created by Goodman, Jarryd A - (jarryd999) on 9/26/14.
//  Copyright (c) 2014 Goodman, Jarryd A - (jarryd999). All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, strong) NSArray *myQuotes;
@property (nonatomic, strong) NSMutableArray *movieQuotes;

@property (nonatomic, strong) IBOutlet UITextView *quoteText;

- (IBAction)quoteButtonTapped:(id)sender;


@end

