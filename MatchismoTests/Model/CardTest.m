//
//  CardTest.m
//
//  Created by Justin Wyer on 2013/02/04.
//  Copyright (c) 2013 Justin Wyer. All rights reserved.
//

#import "CardTest.h"
#import "Card.h"

@implementation CardTest
- (void)testShouldKnowCardCannotMatchEmptyCardList {
    Card *card = [Card new];
    NSArray *otherCards = [NSArray new];
    STAssertEquals(0, [card match:otherCards], @"Should not match empty card list.");
}

- (void)testShouldMatchCardWhenCardListContainsCardWithSameContents {
    Card *card = [[Card alloc] initWithContents:@"Test Card"];
    Card *matchingCard = [[Card alloc] initWithContents:@"Test Card"];
    Card *differentCard = [[Card alloc] initWithContents:@"Different Test Card"];
    NSMutableArray *cards = [[NSMutableArray alloc] initWithObjects:differentCard, differentCard, matchingCard, nil];
    for (NSInteger i = cards.count - 1; i > 0; i--) {
        [cards exchangeObjectAtIndex:i withObjectAtIndex:arc4random_uniform(i + 1)];
    }
    int result = [card match:cards];
    STAssertEquals(1, result, @"Should match when matching card is in list.");
}

- (void)testShouldKnowCardsWithSameContentsAreEqual {
    Card *card = [[Card alloc] initWithContents:@"Test Card"];
    Card *equalCard = [[Card alloc] initWithContents:@"Test Card"];
    STAssertEqualObjects(card, equalCard, @"Cards with the same content should be equal");
}

- (void)testShouldKnowCardCannotBeEqualToADifferentObject {
    Card *card = [[Card alloc] initWithContents:@"Test Card"];
    STAssertFalse([card isEqual:@"Not a Card"], @"Cards with the same content should be equal");
}

- (void)testShouldKnowCardsWithDifferContentsAreNotEqual {
    Card *card = [[Card alloc] initWithContents:@"Test Card"];
    Card *differentCard = [[Card alloc] initWithContents:@"Different Test Card"];
    STAssertFalse([card isEqual: differentCard], @"Cards with the different content should not be equal");
}

- (void)testShouldKnowCardHashEqualsContentsHash {

    Card *card = [[Card alloc] initWithContents:@"Test Card"];
    STAssertEquals([card hash], [card.contents hash] , @"Card hash must equal its contents hash");
}
@end
