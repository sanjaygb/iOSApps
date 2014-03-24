//
//  Deck.m
//  Matchismo
//
//  Created by Sanjay Bhatia on 11/18/13.
//  Copyright (c) 2013 Sanjay Bhatia. All rights reserved.
//

#import "Deck.h"

@interface Deck()
@property (strong, nonatomic) NSMutableArray *cards;
@end


@implementation Deck

- (NSMutableArray *) cards
{
    if (! _cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

- (void) addCard:(Card *) card atTop:(BOOL)atTop
{
    if (atTop) {
        [self.cards insertObject:card atIndex:0];
    }
    else {
        [self.cards addObject:card];
    }
}

- (void) addCard:(Card *)card
{
    [self.cards addObject:card];
}

- (Card *) drawRandomCard
{
    Card * randomCard = nil;
    if ([self.cards count])
    {
        NSLog(@"Card count = %lu", (unsigned long)[self.cards count]);
        int returnIndex = arc4random() % [self.cards count];
        NSLog(@"Random card index generated was %d", returnIndex);
        randomCard = self.cards[returnIndex];
        [self.cards removeObjectAtIndex:returnIndex];
    }
    
    return randomCard;
}

@end
