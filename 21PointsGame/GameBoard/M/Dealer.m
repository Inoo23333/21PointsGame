//
//  Dealer.m
//  21PointsGame
//
//  Created by user on 2020/4/22.
//  Copyright © 2020 user. All rights reserved.
//

#import "Dealer.h"
#import "PokerCard.h"

@implementation Dealer

-(instancetype)init{
    self = [super init];
    if(self){
        self.dealerCards = [[NSMutableArray alloc]init];
        self.numOfAce = 0;
        _isEnd = NO;
        _isBlackJack = NO;
        _isExploded = NO;
    }
    return self;
}

-(BOOL)canAddCard{
    [self performSelector:@selector(calCardsTotalValue)];
    return (_cardsTotalValue <= 16);
}

-(NSInteger)calCardsTotalValue{
    self.cardsTotalValue = 0;
    
    self.numOfAce = 0;
    for (PokerCard *card in _dealerCards) {
        if([card isAce]){
            _cardsTotalValue += 11;
            _numOfAce ++;
        }else{
            _cardsTotalValue += card.value;
        }
    }
    
    for (int i = 0; i < _numOfAce; i++) {
        if(_cardsTotalValue > 21){
            _cardsTotalValue -=10;
        }
    }
    
    //Dealer庄家点数不小于17时自动结束
    if(_cardsTotalValue >= 17){
        _isEnd = YES;
    }
    
    if(_cardsTotalValue > 21){
        _isExploded = YES;
        _isEnd = YES;
    }
    
    return self.cardsTotalValue;
}

@end
