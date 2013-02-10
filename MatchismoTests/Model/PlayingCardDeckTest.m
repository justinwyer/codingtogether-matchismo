//
// Created by Jwyer on 2013/02/10.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <SenTestingKit/SenTestingKit.h>
#import "PlayingCardDeckTest.h"
#import "PlayingCard.h"
#import "PlayingCardDeck.h"
@interface PlayingCardDeck()
@property (strong, nonatomic) NSMutableArray *cards;
@end

@implementation PlayingCardDeckTest {

}
- (void)testShouldPopulatePlayingCardDeckWithAll52Cards {
    NSMutableArray *expectedCards = [[NSMutableArray alloc] init];
    for (NSString *suit in [PlayingCard validSuits]) {
        for (NSUInteger rank = 0; rank < [[PlayingCard rankStrings] count]; rank++) {
            [expectedCards addObject:[[PlayingCard alloc] initWithRankAndSuit:rank suit:suit]];
        }
    }
    PlayingCardDeck *deck = [[PlayingCardDeck alloc] init];
    STAssertEquals([deck.cards count], (NSUInteger)52, @"There must be 52 cards in the deck");
    for (PlayingCard *playingCard in expectedCards) {
        STAssertTrue([deck.cards containsObject:playingCard], [NSString stringWithFormat:@"Playing card %s should be present in the deck.", playingCard.contents]);
    }
}
@end