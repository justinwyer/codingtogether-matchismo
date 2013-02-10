//
// Created by Jwyer on 2013/02/10.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck {

}
- (id)init {
    self = [super init];
    if (self) {
        for (NSString *suit in [PlayingCard validSuits]) {
            for (NSUInteger rank = 0; rank < [[PlayingCard rankStrings] count]; rank++) {
                [self addCard:[[PlayingCard alloc] initWithRankAndSuit:rank suit:suit] atTop:YES];
            }
        }
    }
    return self;
}

- (void)addCard:(PlayingCard *)card atTop:(BOOL)atTop {
    [super addCard:card atTop:atTop];
}

- (PlayingCard *)drawRandomCard {
    return (PlayingCard *)[super drawRandomCard];
}


@end