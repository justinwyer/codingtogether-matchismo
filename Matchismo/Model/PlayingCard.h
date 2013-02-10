//
// Created by Jwyer on 2013/02/09.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "Card.h"


@interface PlayingCard : Card
@property (nonatomic, readonly) NSUInteger rank;
@property (strong, nonatomic, readonly) NSString *suit;

+(NSArray *)rankStrings;
+(NSUInteger)maxRank;
+ (NSArray *)validSuits;

- (id)initWithRankAndSuit:(NSUInteger)rank suit:(NSString *)suit;
@end