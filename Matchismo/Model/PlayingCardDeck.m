//
//  PlayingCardDeck.m
//  Matchismo
//
//  Created by Sanjay Bhatia on 11/18/13.
//  Copyright (c) 2013 Sanjay Bhatia. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck

- (instancetype) init
{
    self = [super init];
    
    if (self)
    {
        for (NSString *suit in [PlayingCard validSuits]) {
            for (int rank = 1 ; rank <= [PlayingCard maxRank] ; rank++) {
                PlayingCard *card = [[PlayingCard alloc] init];
                card.rank = rank;
                card.suit = suit;
                [self addCard:card];
            }
        }
    }
    return self;
}

@end
