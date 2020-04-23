//
//  GameRoomViewController.m
//  21PointsGame
//
//  Created by user on 2020/4/22.
//  Copyright © 2020 user. All rights reserved.
//

#import "GameRoomViewController.h"
#import "NumImageView.h"
#import "GameBoardController.h"

@interface GameRoomViewController ()

@property(nonatomic,strong)UIButton *backButton;
@property(nonatomic,strong)UIButton *bet50Button;
@property(nonatomic,strong)UIButton *bet100Button;
@property(nonatomic,strong)UIButton *bet200Button;
@property(nonatomic,strong)UIButton *bet500Button;
@property(nonatomic,assign)BOOL bet50Selected;
@property(nonatomic,assign)BOOL bet100Selected;
@property(nonatomic,assign)BOOL bet200Selected;
@property(nonatomic,assign)BOOL bet500Selected;
@property(nonatomic,strong)UIImageView *betAlertLabel;

@property(nonatomic,strong)UIButton *startButton;
@property(nonatomic,strong)NSString *propertyStr;
@property(nonatomic,assign)CGFloat bet;


@end

@implementation GameRoomViewController

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
    
    [self.view addSubview:({
        _bet50Selected = NO;
        self.bet50Button = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width/6, self.view.frame.size.height*4/7-20, self.view.frame.size.width/5, self.view.frame.size.width/10)];

        [self.bet50Button setImage:[UIImage imageNamed:@"icon.bundle/Bet-50.jpg"] forState:UIControlStateNormal];
        
        [self.bet50Button addTarget:self action:@selector(clickBet50Button) forControlEvents:UIControlEventTouchUpInside];
        
        self.bet50Button;
    })];
    
    [self.view addSubview:({
        _bet100Selected = NO;
        self.bet100Button = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width*5/6 - self.view.frame.size.width/4, self.view.frame.size.height*4/7-20, self.view.frame.size.width/5, self.view.frame.size.width/10)];

        [self.bet100Button setImage:[UIImage imageNamed:@"icon.bundle/Bet-100.jpg"] forState:UIControlStateNormal];
        
        [self.bet100Button addTarget:self action:@selector(clickBet100Button) forControlEvents:UIControlEventTouchUpInside];
        
        self.bet100Button;
    })];
    
    [self.view addSubview:({
        _bet200Selected = NO;
        self.bet200Button = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width/6, self.view.frame.size.height*4/7+80, self.view.frame.size.width/5, self.view.frame.size.width/10)];

        [self.bet200Button setImage:[UIImage imageNamed:@"icon.bundle/Bet-200.jpg"] forState:UIControlStateNormal];
        
        [self.bet200Button addTarget:self action:@selector(clickBet200Button) forControlEvents:UIControlEventTouchUpInside];
        
        self.bet200Button;
    })];
    
    [self.view addSubview:({
        _bet500Selected = NO;
        self.bet500Button = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width*5/6 - self.view.frame.size.width/4, self.view.frame.size.height*4/7+80, self.view.frame.size.width/5, self.view.frame.size.width/10)];

        [self.bet500Button setImage:[UIImage imageNamed:@"icon.bundle/Bet-500.jpg"] forState:UIControlStateNormal];
        
        [self.bet500Button addTarget:self action:@selector(clickBet500Button) forControlEvents:UIControlEventTouchUpInside];
        
        self.bet500Button;
    })];
    
    
    [self.view addSubview:({
        self.startButton = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width/3, self.view.frame.size.height*3/4+25, self.view.frame.size.width/3, self.view.frame.size.width/6)];

        [_startButton setImage:[UIImage imageNamed:@"icon.bundle/button-start-off.png"] forState:UIControlStateNormal];
        [_startButton setImage:[UIImage imageNamed:@"icon.bundle/button-start-on.png"] forState:UIControlStateHighlighted];
        
        [self.startButton addTarget:self action:@selector(startGame) forControlEvents:UIControlEventTouchUpInside];
        
        self.startButton;
    })];
    
    [self.view addSubview:({
        
        self.betAlertLabel = [[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width/5, self.view.frame.size.height*3/4+100, self.view.frame.size.width*3/5, (self.view.frame.size.width*3/5)*7/50)];
        self.betAlertLabel.image = [UIImage imageNamed:@"icon.bundle/betAlert.jpg"];
        [self.betAlertLabel setHidden:YES];
        self.betAlertLabel;
    })];
    
    
    // Do any additional setup after loading the view.
}

#pragma mark --startGame

-(void)startGame{
    if([self performSelector:@selector(oneBetSelected)]){
        GameBoardController *gbVC = [[GameBoardController alloc]initWithProperty:self.propertyStr Bet:_bet];
        [self.betAlertLabel setHidden:YES];
        [self.navigationController pushViewController:gbVC animated:YES];
    }else{
        [self.betAlertLabel setHidden:NO];
    }
}

//判断用户是否选择了Bet
-(BOOL)oneBetSelected{
    return _bet50Selected||_bet100Selected||_bet200Selected||_bet500Selected;
}

#pragma mark --goBack

-(void)clickBackButton{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark --buttonAction

-(void)clickBet50Button{
    _bet50Selected = !_bet50Selected;
    if(_bet50Selected){
        _bet = 50.0;
        [self.betAlertLabel setHidden:YES];
        [_bet50Button setImage:[UIImage imageNamed:@"icon.bundle/Bet-50-Selected.jpg"] forState:UIControlStateNormal];
        if(_bet100Selected){
            [self performSelector:@selector(clickBet100Button)];
        }else if (_bet200Selected){
            [self performSelector:@selector(clickBet200Button)];
        }else if (_bet500Selected){
            [self performSelector:@selector(clickBet500Button)];
        }
    }else{
        [_bet50Button setImage:[UIImage imageNamed:@"icon.bundle/Bet-50.jpg"] forState:UIControlStateNormal];
    }

}

-(void)clickBet100Button{
    _bet100Selected = !_bet100Selected;
    if(_bet100Selected){
        _bet = 100.0;
        [self.betAlertLabel setHidden:YES];
        [_bet100Button setImage:[UIImage imageNamed:@"icon.bundle/Bet-100-Selected.jpg"] forState:UIControlStateNormal];
        if(_bet50Selected){
            [self performSelector:@selector(clickBet50Button)];
        }else if (_bet200Selected){
            [self performSelector:@selector(clickBet200Button)];
        }else if (_bet500Selected){
            [self performSelector:@selector(clickBet500Button)];
        }
    }else{
        [_bet100Button setImage:[UIImage imageNamed:@"icon.bundle/Bet-100.jpg"] forState:UIControlStateNormal];
    }
}

-(void)clickBet200Button{
    _bet200Selected = !_bet200Selected;
    if(_bet200Selected){
        _bet = 200.0;
        [self.betAlertLabel setHidden:YES];
        [_bet200Button setImage:[UIImage imageNamed:@"icon.bundle/Bet-200-Selected.jpg"] forState:UIControlStateNormal];
        if(_bet50Selected){
            [self performSelector:@selector(clickBet50Button)];
        }else if (_bet100Selected){
            [self performSelector:@selector(clickBet100Button)];
        }else if (_bet500Selected){
            [self performSelector:@selector(clickBet500Button)];
        }
    }else{
        [_bet200Button setImage:[UIImage imageNamed:@"icon.bundle/Bet-200.jpg"] forState:UIControlStateNormal];
    }
}

-(void)clickBet500Button{
    _bet500Selected = !_bet500Selected;
    if(_bet500Selected){
        _bet = 500.0;
        [self.betAlertLabel setHidden:YES];
        [_bet500Button setImage:[UIImage imageNamed:@"icon.bundle/Bet-500-Selected.jpg"] forState:UIControlStateNormal];
        if(_bet50Selected){
            [self performSelector:@selector(clickBet50Button)];
        }else if (_bet100Selected){
            [self performSelector:@selector(clickBet100Button)];
        }else if (_bet200Selected){
            [self performSelector:@selector(clickBet200Button)];
        }
    }else{
        [_bet500Button setImage:[UIImage imageNamed:@"icon.bundle/Bet-500.jpg"] forState:UIControlStateNormal];
    }
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
