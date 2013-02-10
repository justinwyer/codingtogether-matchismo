//
// Created by Jwyer on 2013/02/05.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>


@interface Card : NSObject
@property (strong, nonatomic) NSString *contents;

- (id)initWithContents:(NSString *)contents;

- (int)match:(NSArray *)cards;
@end