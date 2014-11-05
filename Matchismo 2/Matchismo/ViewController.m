//
//  ViewController.m
//  Matchismo
//
//  Created by Sanjay Bhatia on 10/29/14.
//  Copyright (c) 2014 Sanjay Bhatia. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;

@property (strong, nonatomic) Deck *myDeck;

@end

@implementation ViewController

- (Deck *) myDeck {
    if (! _myDeck) {
        _myDeck = [[PlayingCardDeck alloc] init];
    }
    return _myDeck;
}


- (IBAction)touchCardButton:(UIButton *)sender {

    if ([sender.currentTitle length]) {
        [sender setBackgroundImage:[UIImage imageNamed:@"cardback"]
                          forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
        self.flipCount++;
    }
    else {
        Card *myCard = [self.myDeck drawRandomCard];
        
        if (myCard) {
            [sender setBackgroundImage:[UIImage imageNamed:@"cardfront"]
                              forState:UIControlStateNormal];
            [sender setTitle:myCard.contents forState:UIControlStateNormal];
            self.flipCount++;
        }
    }    
}


- (void) setFlipCount:(int)flipCount {
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
    NSLog(@"flipCount changed to %d", self.flipCount);
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
