//
// Created by Jwyer on 2013/02/05.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "Card.h"


@implementation Card {
}
- (int)match:(NSArray *)cards {
    return [cards containsObject:self];
}

- (id)initWithContents:(NSString *)contents {
    self = [super init];
    if (self) {
        self.contents = contents;
    }
    return self;
}

- (BOOL)isEqual:(id)other {
    if (![[other class] isEqual:[self class]])
        return NO;
    return [self.contents isEqualToString:((Card *)other).contents];
}

- (NSUInteger)hash {
    return [self.contents hash];
}
@end