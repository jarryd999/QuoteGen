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


-(IBAction)quoteButtonTapped:(id)sender {
    // 1 - Get personal quotes when the final segment is selected
    if (self.quoteOpt.selectedSegmentIndex == 2) {
        // 1 - Get number of rows in array
        int array_tot = [self.myQuotes count];
        // 2 - Get random index
        int index = (arc4random() % array_tot);
        // 3 - Get the quote string for the index
        NSString *my_quote = self.myQuotes[index];
        // 4 - Display the quote in the text view
        self.quoteText.text = [NSString stringWithFormat:@"Quote:\n\n%@",  my_quote];
    }
    
    //2 - Get Movie Quotes
    else {
        // Determine Category
        NSString *selectedCategory = @"classic";
        if (self.quoteOpt.selectedSegmentIndex == 1){
            selectedCategory = @"modern";
        }

        //2 Filter array by category using predicate
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"category == %@", selectedCategory];
        NSArray *filteredArray = [self.movieQuotes filteredArrayUsingPredicate:predicate];
        
        //get array size in filtered array
        int array_tot = [filteredArray count];
        
        //check for empty array
        if (array_tot > 0){
            //get random index
            int index = (arc4random() % array_tot);
            //get the quote string at index
            NSString *quote = filteredArray[index][@"quote"];
            
            //Check if the quote has a source (movie its from)
            NSString *source = [[filteredArray objectAtIndex:index] valueForKey:@"source"];
            
            //if source isn't empty (there is a source listed) change the text to include it
            if (![source length] == 0)
                quote = [NSString stringWithFormat:@"%@\n\n(%@)", quote, source];
            self.quoteText.text = [NSString stringWithFormat:@"Movie Quote:\n\n%@", quote];
        }
        else{
            self.quoteText.text = @"No quotes to display.";
        }
    }
}

//- (IBAction)quoteButtonTapped:(id)sender {
//    //1 - Get total number of elements in array
//    int array_tot = [self.movieQuotes count];
//    
//    // 2 - Get random index
//    int index = (arc4random() % array_tot);
//    // 3 - Get the quote string for the index
//    
//    //NSString *my_quote = [self.myQuotes objectAtIndex:index];
//    NSString *my_quote = self.movieQuotes[index][@"quote"];
//    
//    // 4 - Display the quote in the text view
//    self.quoteText.text = [NSString stringWithFormat:@"Quote:\n\n%@",  my_quote];
//    
//}


@end
