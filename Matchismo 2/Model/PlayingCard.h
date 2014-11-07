//
//  PlayingCard.h
//  Matchismo
//
//  Created by Sanjay Bhatia on 10/29/14.
//  Copyright (c) 2014 Sanjay Bhatia. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *) validSuits;
+ (NSUInteger) maxRank;

- (int) match:(NSArray *)otherCards;

@end
