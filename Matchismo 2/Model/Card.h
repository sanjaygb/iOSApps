//
//  Card.h
//  Matchismo
//
//  Created by Sanjay Bhatia on 10/29/14.
//  Copyright (c) 2014 Sanjay Bhatia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;

@property (nonatomic, getter=isChosen) BOOL chosen;
@property (nonatomic, getter=isMatched) BOOL matched;

- (int) match:(NSArray *) otherCards;

@end
