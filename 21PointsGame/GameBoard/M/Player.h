//
//  Player.h
//  21PointsGame
//
//  Created by user on 2020/4/22.
//  Copyright © 2020 user. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class PokerCard;

@protocol PlayerDelegate <NSObject>

@required

- (void)playerGetOneCard:(PokerCard *)card;

@end

@interface Player : NSObject

@property (nonatomic, strong, readwrite) NSMutableArray *playerCards;

@property (nullable, nonatomic, weak) id<PlayerDelegate> delegate;

@property(nonatomic,assign,readwrite)NSInteger cardsTotalValue;

@property(nonatomic,assign,readwrite)NSInteger numOfAce;

@property(nonatomic,assign,readwrite)BOOL isEnd;

@property(nonatomic,assign,readwrite)BOOL isExploded;

@property(nonatomic,assign,readwrite)BOOL isBlackJack;




-(NSInteger)calCardsTotalValue;

-(BOOL)canHit;
-(BOOL)canDouble;

@end

NS_ASSUME_NONNULL_END
