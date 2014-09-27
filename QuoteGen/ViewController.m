//
//  ViewController.m
//  QuoteGen
//
//  Created by Goodman, Jarryd A - (jarryd999) on 9/26/14.
//  Copyright (c) 2014 Goodman, Jarryd A - (jarryd999). All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    // 1 - Add array of personal quotes
    self.myQuotes = @[
                      @"Live and let live",
                      @"Don't cry over spilt milk",
                      @"Always look on the bright side of life",
                      @"Nobody's perfect",
                      @"Can't see the woods for the trees",
                      @"Better to have loved and lost then not loved at all",
                      @"The early bird catches the worm",
                      @"As slow as a wet week"
                      ];
    
    NSString *plistCatPath = [[NSBundle mainBundle] pathForResource:@"quotes" ofType:@"plist"];
    self.movieQuotes = [NSMutableArray arrayWithContentsOfFile:plistCatPath];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)quoteButtonTapped:(id)sender {
    //1 - Get total number of elements in array
    int array_tot = [self.movieQuotes count];
    
    // 2 - Get random index
    int index = (arc4random() % array_tot);
    // 3 - Get the quote string for the index
    
    //NSString *my_quote = [self.myQuotes objectAtIndex:index];
    NSString *my_quote = self.movieQuotes[index][@"quote"];
    
    // 4 - Display the quote in the text view
    self.quoteText.text = [NSString stringWithFormat:@"Quote:\n\n%@",  my_quote];
    
}


@end
