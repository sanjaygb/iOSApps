//
//  PlayingCard.h
//  Matchismo
//
//  Created by Sanjay Bhatia on 11/17/13.
//  Copyright (c) 2013 Sanjay Bhatia. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *) validSuits;
+ (NSUInteger) maxRank;
@end
