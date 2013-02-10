#import <SenTestingKit/SenTestingKit.h>
#import "CardGameControllerTest.h"
#import "CardGameController.h"
#import "OCMockObject.h"
#import "PlayingCardDeck.h"
#import "OCMockRecorder.h"
#import "PlayingCard.h"
#import "OCMArg.h"

@interface CardGameController()
@property (strong, nonatomic) PlayingCardDeck *deck;
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) NSUInteger flipCount;
- (IBAction)flipCard:(UIButton *) sender;
@end

@implementation CardGameControllerTest {

}
- (void)testShouldKnowHowToTurnCardUp {
    UIButton *sender = [[UIButton alloc] init];
    sender.selected = NO;
    CardGameController *controller = [CardGameController new];
    [controller flipCard:sender];
    STAssertTrue(sender.isSelected, @"Card should be selected");
}

- (void)testShouldKnowHowToTurnCardDown {
    UIButton *sender = [[UIButton alloc] init];
    sender.selected = YES;
    CardGameController *controller = [CardGameController new];
    [controller flipCard:sender];
    STAssertFalse(sender.isSelected, @"Card should be selected");
}

- (void)testShouldIncreaseFlipCountEveryFlip {
    CardGameController *controller = [CardGameController new];
    UIButton *button = [[UIButton alloc] init];
    [controller flipCard:button];
    NSUInteger count = 1;
    STAssertEquals(count, controller.flipCount, @"Flip count should increment");
}

- (void)testShouldSetFlipsLabelTextWhenSettingFlipCount {
    NSUInteger flips = 4;
    CardGameController *controller = [CardGameController new];
    id mockLabel = [OCMockObject mockForClass:[UILabel class]];
    [[mockLabel expect] setText:[NSString stringWithFormat:@"Flips: %d", flips]];
    controller.flipsLabel = mockLabel;
    controller.flipCount = flips;
    [mockLabel verify];
}

- (void)testShouldDrawRandomCardAndSetCardFaceWhenCardIsFlippedUp {
    PlayingCard *aceOfSpades = [[PlayingCard alloc] initWithRankAndSuit:0 suit:@"♠"];
    CardGameController *controller = [CardGameController new];

    id mockDeck = [OCMockObject mockForClass:[PlayingCardDeck class]];
    [[[mockDeck stub] andReturn:aceOfSpades] drawRandomCard];

    UIButton *button = [[UIButton alloc] init];
    button.selected = NO;
    id mockButton = [OCMockObject partialMockForObject:button];
    [[mockButton expect] setTitle:aceOfSpades.contents forState:UIControlStateSelected];

    controller.deck = mockDeck;
    [controller flipCard:mockButton];

    [mockDeck verify];
    [mockButton verify];
}
- (void)testShouldNotDrawRandomCardWhenCardIsFlippedDown {
    PlayingCard *aceOfSpades = [[PlayingCard alloc] initWithRankAndSuit:0 suit:@"♠"];
    CardGameController *controller = [CardGameController new];

    id mockDeck = [OCMockObject mockForClass:[PlayingCardDeck class]];

    UIButton *button = [[UIButton alloc] init];
    button.selected = YES;

    controller.deck = mockDeck;
    [controller flipCard:button];

    [mockDeck verify];
}
@end