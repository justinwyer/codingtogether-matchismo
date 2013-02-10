//
//  CardTest.m
//  Derp
//
//  Created by Justin Wyer on 2013/02/04.
//  Copyright (c) 2013 Justin Wyer. All rights reserved.
//

#import "CardTest.h"
#import "Card.h"

@implementation CardTest

- (void)testShouldKnowNilCardCannotMatchNilCardList {
    Card *card;
    NSArray *otherCards;
    STAssertEquals(0, [card match:otherCards], @"Should not match empty card list.");
}

- (void)testShouldKnowCardCannotMatchEmptyCardList {
    Card *card = [Card new];
    NSArray *otherCards = [NSArray new];
    STAssertEquals(0, [card match:otherCards], @"Should not match empty card list.");
}

- (void)testShouldMatchCardWhenCardListContainsCardWithSameContent {
    Card *card = [[Card alloc] initWithContents:@"Test Card"];
    Card *matchingCard = [[Card alloc] initWithContents:@"Test Card"];
    NSArray *otherCards = @[matchingCard];
    int result = [card match:otherCards];
    STAssertEquals(1, result, @"Should match when matching card is in list.");
}

- (void)testShouldKnowCardsWithSameContentAreEqual {
    Card *card = [[Card alloc] initWithContents:@"Test Card"];
    Card *equalCard = [[Card alloc] initWithContents:@"Test Card"];

    STAssertEqualObjects(card, equalCard, @"Cards with the same content should be equal");
}

- (void)testShouldKnowCardsWithDifferContentAreNotEqual {
    Card *card = [[Card alloc] initWithContents:@"Test Card"];
    Card *differentCard = [[Card alloc] initWithContents:@"Different Test Card"];

    STAssertFalse([card isEqual: differentCard], @"Cards with the different content should not be equal");
}

- (void)testShouldKnowEqualCardsHaveTheSameHash {

    Card *card = [[Card alloc] initWithContents:@"Test Card"];
    Card *equalCard = [[Card alloc] initWithContents:@"Test Card"];

    STAssertEquals([card hash], [equalCard hash] , @"Equal cards have equal hashes");
}
@end
