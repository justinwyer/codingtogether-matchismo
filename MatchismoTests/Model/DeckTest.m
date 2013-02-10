//
// Created by Jwyer on 2013/02/07.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "DeckTest.h"
#import "Deck.h"
#import "Card.h"
#import "OCMockObject.h"
#import "OCMockRecorder.h"
#import "OCMArg.h"

@interface Deck()
@property (strong, nonatomic) NSMutableArray *cards;
- (NSUInteger)randomNumber:(NSUInteger)max;
@end

@implementation DeckTest

- (void)testShouldCardsOnFirstGet {
    Deck *deck = [Deck new];
    STAssertNotNil(deck.cards, @"Cards should not be nil on first get");
}

- (void)testShouldKnowDeckIsEmptyOnInit {
    Deck *deck = [Deck new];
    STAssertEquals((NSUInteger)0, [deck.cards count], @"Deck should be empty on init");
}

- (void)testShouldKnowCardsCanBeAddedToDeck {
    Deck *deck = [Deck new];
    Card *card = [[Card alloc] initWithContents:@"Test Card"];

    id cardsMock = [OCMockObject mockForClass:[NSMutableArray class]];
    [[cardsMock expect] addObject:card];

    deck.cards = cardsMock;
    [deck addCard:card atTop:NO];

    [cardsMock verify];
}

- (void)testShouldKnowCardsCanBeAddedToTopOfDeck {
    Deck *deck = [Deck new];
    Card *card = [[Card alloc] initWithContents:@"Test Card"];

    id cardsMock = [OCMockObject mockForClass:[NSMutableArray class]];
    [[cardsMock expect] insertObject:card atIndex:0];

    deck.cards = cardsMock;
    [deck addCard:card atTop:YES];

    [cardsMock verify];
}

- (void)testShouldDrawANilCardIfDeckIsEmpty {
    Deck *deck = [Deck new];
    STAssertNil([deck drawRandomCard], @"Should draw nil card if deck is empty");
}

- (void)testShouldGenerateRandomNumbers {
    Deck *deck = [Deck new];
    NSUInteger lastNumber = 0;
    for (int i=0; i < 1000; i++) {
        NSUInteger number = [deck randomNumber:1000000];
        STAssertFalse(number == lastNumber, @"Random numbers should be random!");
    }
}

- (void)testShouldDrawRandomCardFromDeck {
    Deck *deck = [Deck new];
    NSUInteger cardCount = 2;
    NSUInteger selectedCard = 0;

    id deckPartialMock = [OCMockObject partialMockForObject:deck];
    [[[deckPartialMock stub] andReturnValue:OCMOCK_VALUE(selectedCard)] randomNumber:cardCount];

    id cardsMock = [OCMockObject mockForClass:[NSMutableArray class]];
    [[[cardsMock stub] andReturnValue:OCMOCK_VALUE(cardCount)] count];
    [[cardsMock expect] objectAtIndexedSubscript:selectedCard];
    [[cardsMock expect] removeObjectAtIndex:selectedCard];

    deck.cards = cardsMock;
    [deck drawRandomCard];

    [deckPartialMock verify];
    [cardsMock verify];
}

@end