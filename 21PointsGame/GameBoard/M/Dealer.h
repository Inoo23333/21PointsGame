//
//  Dealer.h
//  21PointsGame
//
//  Created by user on 2020/4/22.
//  Copyright © 2020 user. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class PokerCard;

@protocol DealerDelegate <NSObject>

@required

- (void)dealerGetOneCard:(PokerCard *)card;

@end

@interface Dealer : NSObject

@property (nonatomic, strong, readwrite) NSMutableArray *dealerCards;

@property (nullable, nonatomic, weak) id<DealerDelegate> delegate;

@property(nonatomic,assign,readwrite)NSInteger cardsTotalValue;

@property(nonatomic,assign,readwrite)NSInteger numOfAce;

@property(nonatomic,assign,readwrite)BOOL isEnd;

@property(nonatomic,assign,readwrite)BOOL isExploded;

@property(nonatomic,assign,readwrite)BOOL isBlackJack;


-(BOOL)canAddCard;

-(NSInteger)calCardsTotalValue;

@end

NS_ASSUME_NONNULL_END
