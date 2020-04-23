//
//  NumImageView.m
//  21PointsGame
//
//  Created by user on 2020/4/22.
//  Copyright © 2020 user. All rights reserved.
//

#import "NumImageView.h"

@implementation NumImageView


-(instancetype)initWithNumStr:(NSString *)numStr count:(NSInteger) count index:(NSInteger) index{
    //w:h = 25:35
    NSInteger numWidth = 25;
    NSInteger numHeight = 35;
    NSInteger x = (414 - count*numWidth)/2 + numWidth*index;
    
    NSInteger y = 270;
    if ([numStr isEqualToString:@"."]) {
        self = [super initWithFrame:CGRectMake(x, y+15, 20, 15)];
        self.image = [UIImage imageNamed:@"icon.bundle/num-dot.png"];
    }else if([numStr isEqualToString:@"0"]){
        self = [super initWithFrame:CGRectMake(x, y, numWidth,numHeight)];
        self.image = [UIImage imageNamed:@"icon.bundle/num-0.png"];
    }else if([numStr isEqualToString:@"1"]){
        self = [super initWithFrame:CGRectMake(x, y, numWidth,numHeight)];
        self.image = [UIImage imageNamed:@"icon.bundle/num-1.png"];
    }else if([numStr isEqualToString:@"2"]){
        self = [super initWithFrame:CGRectMake(x, y, numWidth,numHeight)];
        self.image = [UIImage imageNamed:@"icon.bundle/num-2.png"];
    }else if([numStr isEqualToString:@"3"]){
        self = [super initWithFrame:CGRectMake(x, y, numWidth,numHeight)];
        self.image = [UIImage imageNamed:@"icon.bundle/num-3.png"];
    }else if([numStr isEqualToString:@"4"]){
        self = [super initWithFrame:CGRectMake(x, y, numWidth,numHeight)];
        self.image = [UIImage imageNamed:@"icon.bundle/num-4.png"];
    }else if([numStr isEqualToString:@"5"]){
        self = [super initWithFrame:CGRectMake(x, y, numWidth,numHeight)];
        self.image = [UIImage imageNamed:@"icon.bundle/num-5.png"];
    }else if([numStr isEqualToString:@"6"]){
        self = [super initWithFrame:CGRectMake(x, y, numWidth,numHeight)];
        self.image = [UIImage imageNamed:@"icon.bundle/num-6.png"];
    }else if([numStr isEqualToString:@"7"]){
        self = [super initWithFrame:CGRectMake(x, y, numWidth,numHeight)];
        self.image = [UIImage imageNamed:@"icon.bundle/num-7.png"];
    }else if([numStr isEqualToString:@"8"]){
        self = [super initWithFrame:CGRectMake(x, y, numWidth,numHeight)];
        self.image = [UIImage imageNamed:@"icon.bundle/num-8.png"];
    }else if([numStr isEqualToString:@"9"]){
        self = [super initWithFrame:CGRectMake(x, y, numWidth,numHeight)];
        self.image = [UIImage imageNamed:@"icon.bundle/num-9.png"];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
