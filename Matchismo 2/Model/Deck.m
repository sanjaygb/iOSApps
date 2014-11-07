//
//  Deck.m
//  Matchismo
//
//  Created by Sanjay Bhatia on 10/30/14.
//  Copyright (c) 2014 Sanjay Bhatia. All rights reserved.
//

#import "Deck.h"

@interface Deck()

@property (strong, nonatomic) NSMutableArray *cards;
@end


@implementation Deck

- (NSMutableArray *) cards
{
    if (! _cards)   _cards = [[NSMutableArray alloc] init];
    
    return _cards;
}


- (void) addCard:(Card *)card atTop:(BOOL)atTop
{
    if (atTop) {
        [self.cards insertObject:card atIndex:0];
    }
    else {
        [self.cards addObject:card];
    }
    
    
}

- (void) addCard:(Card *) card
{
    [self addCard:card atTop:NO] ;
}

- (Card *) drawRandomCard
{
    Card *randomCard;
    
    //NSLog(@"Deck has %lu cards", (unsigned long)[self.cards count]);
    
    if ([self.cards count]) {
        unsigned index = arc4random() % [self.cards count];
        randomCard = self.cards[index];
        [self.cards removeObjectAtIndex:index];
    }
    
    return randomCard;
}

@end
