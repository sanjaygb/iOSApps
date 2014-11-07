//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Sanjay Bhatia on 11/1/14.
//  Copyright (c) 2014 Sanjay Bhatia. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards; // Array of Cards
@end

@implementation CardMatchingGame

static const int MATCH_PENALTY  = 2;
static const int MATCH_BONUS    = 4;
static const int COST_TO_CHOOSE = 1;


- (NSArray *) cards
{
    if (! _cards)   _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (void)chooseCardAtIndex:(NSUInteger)index
{
    Card *myCard = [self.cards objectAtIndex:index];
    
    if (! myCard.isMatched) {
        if (myCard.isChosen) {
            myCard.chosen = NO;
        }
        else {
            // match against other chosen cards
            for (Card *otherCard in self.cards) {
                if ((otherCard.isChosen) && (!otherCard.isMatched)) {
                    int matchScore = [myCard match:@[otherCard]];
                    if (matchScore) {
                        self.score += matchScore * MATCH_BONUS;
                        otherCard.matched = YES;
                        myCard.matched = YES;
                    }
                    else {
                        self.score -= MATCH_PENALTY;
                        otherCard.chosen = NO;
                    }
                    break;
                }
            }
            self.score -= COST_TO_CHOOSE;
            myCard.chosen = YES;
        }
    }
}


- (instancetype) initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck
{
    self = [super init] ;

    if (self) {
        
        for (int i = 0 ; i < count ; i++) {
            Card *card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            }
            else {
                self = nil;
                break;
            }
        }
    }
    return self;
}

- (Card *) cardAtIndex:(NSUInteger)index
{
    if (index < [self.cards count]) {
        return [self.cards objectAtIndex:index];
    }
    else {
        return nil;
    }
}

@end
