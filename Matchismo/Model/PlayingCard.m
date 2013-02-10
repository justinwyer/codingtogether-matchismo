//
// Created by Jwyer on 2013/02/09.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "PlayingCard.h"


@implementation PlayingCard {

}

+ (NSArray *)rankStrings {
    return @[@"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
}

+ (NSUInteger)maxRank {
    return [[self rankStrings] count] - 1;
}

+ (NSArray *)validSuits {
    return @[@"♠", @"♥", @"♦", @"♣"];
}

- (id)initWithRankAndSuit:(NSUInteger)rank suit:(NSString *)suit{
    self = [super init];
    if (self) {
        if (rank <= [PlayingCard maxRank] && [[PlayingCard validSuits] containsObject:suit]) {
            _rank = rank;
            _suit = suit;
        } else {
            self = nil;
        }
    }
    return self;
}

- (NSString *)contents {
    return [[PlayingCard rankStrings][self.rank] stringByAppendingString:self.suit];
}

@end