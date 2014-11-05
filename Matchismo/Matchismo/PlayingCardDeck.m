//
//  PlayingCardDeck.m
//  Matchismo
//
//  Created by Sanjay Bhatia on 10/30/14.
//  Copyright (c) 2014 Sanjay Bhatia. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"
#import "Deck.h"

@implementation PlayingCardDeck


- (instancetype) init
{
    self = [super init] ;
    
    if (self) {
        for (NSString *suit in [PlayingCard validSuits]) {
            for (NSUInteger rank = 1; rank <= [PlayingCard maxRank] ; rank++) {
                PlayingCard *myCard = [[PlayingCard alloc] init];
                myCard.rank = rank;
                myCard.suit = suit;
               // NSLog(@"Created Card %@", [myCard contents] );
                [self addCard:myCard];
            }
        }
    }
    
    return self;
}


@end
