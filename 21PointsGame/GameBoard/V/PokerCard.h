//
//  PokerCard.h
//  21PointsGame
//
//  Created by user on 2020/4/22.
//  Copyright © 2020 user. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger,CardColor){
    SPADE = 1,
    HEART = 2,
    CLUB = 3,
    DIAMOND = 4
};

@interface PokerCard : UIImageView

@property(nonatomic,strong)NSString *color;
@property(nonatomic,strong)NSString *faceValue;
@property(nonatomic,assign)NSInteger value;
@property(nonatomic,assign)NSInteger x;
@property(nonatomic,assign)NSInteger y;

-(instancetype)initWithColor:(NSString *)color faceValue:(NSString *)facaValue;

//判断纸牌是否为A
-(BOOL)isAce;

//判断纸牌是否为J，Q，K
-(BOOL)isFaceCard;

@end

NS_ASSUME_NONNULL_END
