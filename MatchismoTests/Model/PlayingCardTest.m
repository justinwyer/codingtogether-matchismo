//
// Created by Jwyer on 2013/02/09.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "PlayingCardTest.h"
#import "PlayingCard.h"


@implementation PlayingCardTest {

}
- (void)testShouldKnowHowToInitPlayingCardWithRankAndSuit {
    NSUInteger rank = 12;
    PlayingCard *card = [[PlayingCard alloc] initWithRankAndSuit:rank suit:@"♠"];
    STAssertEquals((NSUInteger) rank, card.rank, @"Playing card rank should be equal");
    STAssertEquals(@"♠", card.suit, @"Playing card suit should be equal");
}

- (void)testShouldKnowContentsOfPlayingCard {
    PlayingCard *card = [[PlayingCard alloc] initWithRankAndSuit:12 suit:@"♠"];
    STAssertEqualObjects(@"K♠", card.contents, @"Card contents should be representative of rank and suit.");
}
@end