//
//  Player.m
//  21PointsGame
//
//  Created by user on 2020/4/22.
//  Copyright © 2020 user. All rights reserved.
//

#import "Player.h"
#import "PokerCard.h"

@implementation Player

- (instancetype)init {
    self = [super init];
    if (self) {
        self.playerCards = [[NSMutableArray alloc]init];
        self.numOfAce = 0;
        _isEnd = NO;
        _isBlackJack = NO;
        _isExploded = NO;
    }
    return self;
}

- (NSInteger)calCardsTotalValue {
    self.cardsTotalValue = 0;

    
    for (PokerCard *card in _playerCards) {
        if ([card isAce]) {
            _cardsTotalValue += 11;
            _numOfAce++;
        } else {
            _cardsTotalValue += card.value;
        }
    }

    for (int i = 0; i < _numOfAce; i++) {
        if (_cardsTotalValue > 21) {
            _cardsTotalValue -= 10;
        }
    }
    
    if(_cardsTotalValue > 21){
        _isExploded = YES;
        _isEnd = YES;
    }

    return self.cardsTotalValue;
}

-(BOOL)canHit{
    return (!_isEnd);
}
-(BOOL)canDouble{
    return (!_isEnd);
}

@end
