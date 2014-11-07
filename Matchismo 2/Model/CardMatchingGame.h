//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Sanjay Bhatia on 11/1/14.
//  Copyright (c) 2014 Sanjay Bhatia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"

@interface CardMatchingGame : NSObject

@property (nonatomic, readonly) NSInteger score;

// designated initializer
- (instancetype) initWithCardCount:(NSUInteger) count
                         usingDeck:(Deck *) deck;

- (void) chooseCardAtIndex:(NSUInteger) index;
- (Card *) cardAtIndex:(NSUInteger) index;


@end
