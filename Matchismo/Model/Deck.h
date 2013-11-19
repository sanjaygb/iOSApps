//
//  Deck.h
//  Matchismo
//
//  Created by Sanjay Bhatia on 11/18/13.
//  Copyright (c) 2013 Sanjay Bhatia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void) addCard:(Card *) card atTop:(BOOL) atTop;
- (void) addCard:(Card *) card;

- (Card *) drawRandomCard;

@end
