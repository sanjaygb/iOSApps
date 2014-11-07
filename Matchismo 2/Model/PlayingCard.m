//
//  PlayingCard.m
//  Matchismo
//
//  Created by Sanjay Bhatia on 10/29/14.
//  Copyright (c) 2014 Sanjay Bhatia. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

- (int) match:(NSArray *)otherCards
{
    int score  = 0;
    
    if ([otherCards count] == 1) {
        PlayingCard *otherCard = [otherCards firstObject];
        if (otherCard.rank == self.rank) {
            score = 4;
        } else if (otherCard.suit == self.suit) {
            score = 1;
        }
    }
    return score;
}


- (NSString *) contents
{
    NSArray *rankStrings = [PlayingCard rankStrings];
    return ([rankStrings[self.rank] stringByAppendingString:self.suit]);
}

- (void) setSuit:(NSString *)suit {
    
    if ( [ [PlayingCard validSuits] containsObject:suit ]) {
        _suit    = suit;
    }
}

- (NSString *)suit
{
    return _suit ? _suit : @"?";
}

// Because we provide the getter AND the setter
@synthesize suit = _suit;

- (void) setRank:(NSUInteger)rank {
    if ( rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}


+ (NSArray *) rankStrings
{
    return ( @[@"", @"A", @"2", @"3", @"4", @"5", @"6", @"7",
               @"8", @"9", @"10", @"J", @"Q", @"K"]);
}

+ (NSArray *) validSuits
{
    return ( @[@"♣︎", @"♦︎", @"♥︎", @"♠︎"]);
}

+ (NSUInteger) maxRank {
    return ( [[self rankStrings] count] - 1);
}


@end
