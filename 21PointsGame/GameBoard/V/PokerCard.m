//
//  PokerCard.m
//  21PointsGame
//
//  Created by user on 2020/4/22.
//  Copyright © 2020 user. All rights reserved.
//

#import "PokerCard.h"


@implementation PokerCard

-(instancetype)initWithColor:(NSString *)color faceValue:(NSString *)faceValue{
    self = [super init];
    if(self){
        self.color = color;
        self.faceValue = faceValue;
        if([self performSelector:@selector(isAce)]){
            self.value = 1;
        }else if([self performSelector:@selector(isFaceCard)]){
            self.value = 10;
        }else{
            self.value = [self.faceValue integerValue];
        }
        NSString *imgPath = [[[[@"icon.bundle/poker-" stringByAppendingString:self.color] stringByAppendingString:@"-"] stringByAppendingString:self.faceValue] stringByAppendingString:@".png"];
        self.image = [UIImage imageNamed:imgPath];
    }
    return self;
}

-(BOOL)isAce{
    return [self.faceValue isEqualToString:@"1"];
}

-(BOOL)isFaceCard{
    BOOL isJqk = [self.faceValue isEqualToString:@"11"]||[self.faceValue isEqualToString:@"12"]||[self.faceValue isEqualToString:@"13"];
    return isJqk;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
