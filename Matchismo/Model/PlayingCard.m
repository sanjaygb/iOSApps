//
//  PlayingCard.m
//  Matchismo
//
//  Created by Sanjay Bhatia on 11/17/13.
//  Copyright (c) 2013 Sanjay Bhatia. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

- (NSString *) contents
{
    NSArray *rankStrings = [PlayingCard rankStrings] ;
    return [rankStrings[self.rank] stringByAppendingString:self.suit] ;
}

+ (NSArray *) validSuits
{
    return (@[@"♣︎", @"♠︎", @"♥︎", @"♦︎"]);
}

+ (NSArray *) rankStrings
{
    return (@[@"?", @"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9",
             @"10", @"J", @"Q", @"K"]);
}

- (void) setSuit:(NSString *) suit
{
    if ([[PlayingCard validSuits] containsObject:(suit)])
    {
        _suit = suit;
    }
}

- (NSString *) suit
{
    return _suit ? _suit : @"?";
}

// Because we provide the Getter and the Setter
@synthesize suit = _suit;

+ (NSUInteger) maxRank {
    return ([[self rankStrings] count] - 1);
}

- (void) setRank:(NSUInteger)rank
{
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}


@end
