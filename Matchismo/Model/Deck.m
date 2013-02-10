//
// Created by Jwyer on 2013/02/07.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "Deck.h"
#import "Card.h"

@interface Deck()
@property (strong, nonatomic) NSMutableArray *cards;
- (NSUInteger)randomNumber:(NSUInteger)max;
@end

@implementation Deck {
}
- (NSMutableArray *)cards {
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

- (void)addCard:(Card *)card atTop:(BOOL)atTop{
    if (atTop) {
        [self.cards insertObject:card atIndex:0];
    } else {
        [self.cards addObject:card];
    }
}

- (Card *)drawRandomCard {
    Card *card;
    if ([self.cards count]) {
        NSUInteger index = [self randomNumber:[self.cards count]];
        card = self.cards[index];
        [self.cards removeObjectAtIndex:index];
    }
    return card;
}

- (NSUInteger)randomNumber:(NSUInteger)max {
    return arc4random() % max;
}
@end