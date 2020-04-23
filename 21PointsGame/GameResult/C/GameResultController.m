//
//  GameResultController.m
//  21PointsGame
//
//  Created by user on 2020/4/23.
//  Copyright © 2020 user. All rights reserved.
//

#import "GameResultController.h"
#import "GameRoomViewController.h"
#import "NumImageView.h"
#import "GameBoardController.h"

@interface GameResultController ()

@property(nonatomic,strong)UIButton *backButton;
@property(nonatomic,strong)NSString *propertyStr;
@property(nonatomic,assign)CGFloat bet;


@end

@implementation GameResultController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.view.backgroundColor = [UIColor purpleColor];
    
    [self.view addSubview:({
        UIImageView *backgrondView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        backgrondView.image = [UIImage imageNamed:@"icon.bundle/home-background.png"];
        backgrondView;
    })];
    
    [self.view addSubview:({
        _backButton = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width/15, self.view.frame.size.height/15,self.view.frame.size.width/6 , self.view.frame.size.width/16)];
        [_backButton setImage:[UIImage imageNamed:@"icon.bundle/backButton.jpg"] forState:UIControlStateNormal];
        [_backButton setImage:[UIImage imageNamed:@"icon.bundle/backButton1.jpg"] forState:UIControlStateHighlighted];
        
        [self.backButton addTarget:self action:@selector(clickBackButton) forControlEvents:UIControlEventTouchUpInside];
        _backButton;
    })];
    
    
    [self.view addSubview:({
        UIImageView *propertyLabel = [[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width/10, self.view.frame.size.height/4-30, self.view.frame.size.width*4/5, self.view.frame.size.width*4/35)];
        propertyLabel.image = [UIImage imageNamed:@"icon.bundle/yourProperty.jpg"];
        propertyLabel;
    })];
    
    _propertyStr = [[NSUserDefaults standardUserDefaults] objectForKey:@"property"];

    for (int i = 0; i < _propertyStr.length; i++) {
        NSString *ind = [_propertyStr substringWithRange:NSMakeRange(i, 1)];
        [self.view addSubview:({
            UIImageView *imageView = [[NumImageView alloc]initWithNumStr:ind count:_propertyStr.length index:i];
            imageView;
        })];
    }
    
    
    [self.view addSubview:({
        UIImageView *betLabel = [[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width/10, self.view.frame.size.height/2-70, self.view.frame.size.width*4/5, self.view.frame.size.width*7/45)];
        betLabel.image = [UIImage imageNamed:@"icon.bundle/SelectBet.jpg"];
        betLabel;
    })];
    
    
    
    // Do any additional setup after loading the view.
}


- (void)clickBackButton {
    [self.navigationController popViewControllerAnimated:YES];
}


@end
