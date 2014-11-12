//
//  Deck.h
//  Matchismo
//
//  Created by Sanjay Bhatia on 10/30/14.
//  Copyright (c) 2014 Sanjay Bhatia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"


@interface Deck : NSObject

- (void) addCard:(Card *)card atTop:(BOOL) atTop;
- (void) addCard:(Card *)card;

- (Card *) drawRandomCard;

@end
