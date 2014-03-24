//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Sanjay Bhatia on 11/16/13.
//  Copyright (c) 2013 Sanjay Bhatia. All rights reserved.
//

#import "CardGameViewController.h"
#import "Deck.h"
#import "PlayingCardDeck.h"

@interface CardGameViewController ()

    @property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
    @property (nonatomic) int flipCount;

    @property (strong, nonatomic) Deck *myDeck;
@end

@implementation CardGameViewController


- (Deck *) myDeck {
    if (! _myDeck)
        _myDeck = [self createDeck];
    return _myDeck;
}

- (Deck *) createDeck
{
    return ([[PlayingCardDeck alloc] init]);
}
 


- (IBAction)touchCardButton:(UIButton *)sender {
    //UIImage *cardImage = ;
    
    //self.myDeck = [[PlayingCardDeck alloc] init];
    if ([sender.currentTitle length])
    {
        [sender setBackgroundImage:[UIImage imageNamed:@"cardback"]
                          forState:UIControlStateNormal];
        [sender setTitle:@"" forState: UIControlStateNormal];
    }
    else {
        Card *myRandomCard = [self.myDeck drawRandomCard];
        
        if (myRandomCard) {
            ++self.flipCount;
            [sender setBackgroundImage:[UIImage imageNamed:@"cardfront"]
                              forState:UIControlStateNormal];

            NSLog(@"Card contents == %@", myRandomCard.contents);
            [sender setTitle:myRandomCard.contents forState:UIControlStateNormal];
        }
        else {
            NSLog(@"Card contents is nil");
        }
        

    }

}

- (void) setFlipCount:(int)flipCount
{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
    NSLog(@"flipCount set to %d", self.flipCount);
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
