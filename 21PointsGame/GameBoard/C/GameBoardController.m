//
//  GameBoardViewController.m
//  21PointsGame
//
//  Created by user on 2020/4/22.
//  Copyright © 2020 user. All rights reserved.
//

#import "GameBoardController.h"
#import "PokerCard.h"
#import "Player.h"
#import "Dealer.h"
#import "NumImageView.h"

@interface GameBoardController ()

@property (nonatomic, strong, readwrite) UIButton *backButton;
@property (nonatomic, assign, readwrite) CGFloat property;
@property (nonatomic, assign, readwrite) CGFloat bet;
@property (nonatomic, strong, readwrite) NSMutableArray *pokers;
@property (nonatomic, assign, readwrite) NSInteger cardNum;
@property (nonatomic, strong, readwrite) UIButton *hitButton;
@property (nonatomic, strong, readwrite) UIButton *standButton;
@property (nonatomic, strong, readwrite) UIButton *doubleButton;
@property (nonatomic, strong, readwrite) UIButton *resultButton;
@property (nonatomic, strong, readwrite) UIButton *retryButton;

@property (nonatomic, strong, readwrite) Player *player;
@property (nonatomic, strong, readwrite) Dealer *dealer;

@property (nonatomic, assign, readwrite) BOOL isDraw;
@property (nonatomic, assign, readwrite) BOOL isPlayerWon;

@end

@implementation GameBoardController

- (instancetype)initWithProperty:(NSString *)property Bet:(CGFloat)bet {
    self = [super init];
    if (self) {
        self.property = [property floatValue];
        self.bet = bet;
        self.pokers = [NSMutableArray array];
        self.player = [[Player alloc]init];
        self.dealer = [[Dealer alloc]init];
        self.isDraw = NO;
    }
    return self;
}

- (void)configPorkers {
    for (int i = 0; i < 13; i++) {
        for (int j = 0; j < 4; j++) {
            PokerCard *card = [[PokerCard alloc]initWithColor:[NSString stringWithFormat:@"%d", j + 1] faceValue:[NSString stringWithFormat:@"%d", i + 1]];
            [self.pokers addObject:card];
        }
    }
    self.cardNum = _pokers.count;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];

    [self.view addSubview:({
        UIImageView *backgrondView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        backgrondView.image = [UIImage imageNamed:@"icon.bundle/home-background.png"];
        backgrondView;
    })];

    [self.view addSubview:({
        _backButton = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width / 15, self.view.frame.size.height / 15, self.view.frame.size.width / 6, self.view.frame.size.width / 16)];
        [_backButton setImage:[UIImage imageNamed:@"icon.bundle/backButton.jpg"] forState:UIControlStateNormal];
        [_backButton setImage:[UIImage imageNamed:@"icon.bundle/backButton1.jpg"] forState:UIControlStateHighlighted];

        [self.backButton addTarget:self action:@selector(clickBackButton) forControlEvents:UIControlEventTouchUpInside];
        _backButton;
    })];

    //异步处理初始化pokers纸牌数组
    __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        __strong typeof(weakSelf) strongSelf = weakSelf;
        [strongSelf performSelector:@selector(configPorkers)];
    });

    [self.view addSubview:({
        UIImageView *cuttingLineView = [[UIImageView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height / 2 - self.view.frame.size.width / 22, self.view.frame.size.width, self.view.frame.size.width / 22)];
        cuttingLineView.image = [UIImage imageNamed:@"icon.bundle/CuttingLine.jpg"];
        cuttingLineView;
    })];

    [self.view addSubview:({
        UIImageView *dealerLabel = [[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width / 4, self.view.frame.size.height * 2 / 5, self.view.frame.size.width / 2, self.view.frame.size.width * 8 / 50)];
        dealerLabel.image = [UIImage imageNamed:@"icon.bundle/Dealer.jpg"];
        dealerLabel;
    })];

    [self.view addSubview:({
        UIImageView *playerLabel = [[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width / 4, self.view.frame.size.height / 2, self.view.frame.size.width / 2, self.view.frame.size.width * 8 / 50)];
        playerLabel.image = [UIImage imageNamed:@"icon.bundle/Player.jpg"];
        playerLabel;
    })];

    [self.view addSubview:({
        _doubleButton = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width / 16, self.view.frame.size.height * 6 / 7 + 15, self.view.frame.size.width / 4, self.view.frame.size.width / 12)];
        [_doubleButton setImage:[UIImage imageNamed:@"icon.bundle/button-double.jpg"] forState:UIControlStateNormal];
        [_doubleButton setImage:[UIImage imageNamed:@"icon.bundle/button-double-1.jpg"] forState:UIControlStateHighlighted];

        [_doubleButton addTarget:self action:@selector(clickDoubleButton) forControlEvents:UIControlEventTouchUpInside];
        _doubleButton;
    })];

    [self.view addSubview:({
        _hitButton = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width * 3 / 8, self.view.frame.size.height * 6 / 7 + 15, self.view.frame.size.width / 4, self.view.frame.size.width / 12)];
        [_hitButton setImage:[UIImage imageNamed:@"icon.bundle/button-hit.jpg"] forState:UIControlStateNormal];
        [_hitButton setImage:[UIImage imageNamed:@"icon.bundle/button-hit-1.jpg"] forState:UIControlStateHighlighted];

        [_hitButton addTarget:self action:@selector(clickHitButton) forControlEvents:UIControlEventTouchUpInside];
        _hitButton;
    })];

    [self.view addSubview:({
        _standButton = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width * 11 / 16, self.view.frame.size.height * 6 / 7 + 15, self.view.frame.size.width / 4, self.view.frame.size.width / 12)];
        [_standButton setImage:[UIImage imageNamed:@"icon.bundle/button-stand.jpg"] forState:UIControlStateNormal];
        [_standButton setImage:[UIImage imageNamed:@"icon.bundle/button-stand-1.jpg"] forState:UIControlStateHighlighted];

        [_standButton addTarget:self action:@selector(clickStandButton) forControlEvents:UIControlEventTouchUpInside];

        _standButton;
    })];

    [self.view addSubview:({
        _resultButton = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width * 11 / 16, self.view.frame.size.height * 6 / 7 + 15, self.view.frame.size.width / 4, self.view.frame.size.width / 12)];
        [_resultButton setImage:[UIImage imageNamed:@"icon.bundle/button-result.jpg"] forState:UIControlStateNormal];
        [_resultButton setImage:[UIImage imageNamed:@"icon.bundle/button-result-1.jpg"] forState:UIControlStateHighlighted];

        [_resultButton addTarget:self action:@selector(clickResultButton) forControlEvents:UIControlEventTouchUpInside];
        [_resultButton setHidden:YES];
        _resultButton;
    })];
    
    [self.view addSubview:({
        _retryButton = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width * 3 / 8, self.view.frame.size.height * 6 / 7 + 15, self.view.frame.size.width / 4, self.view.frame.size.width / 12)];
        [_retryButton setImage:[UIImage imageNamed:@"icon.bundle/button-retry.jpg"] forState:UIControlStateNormal];
        [_retryButton setImage:[UIImage imageNamed:@"icon.bundle/button-retry-1.jpg"] forState:UIControlStateHighlighted];

        [_retryButton addTarget:self action:@selector(clickRetryButton) forControlEvents:UIControlEventTouchUpInside];
        [_retryButton setHidden:YES];
        _retryButton;
    })];
    
    
}

    #pragma mark - Cards Action

- (PokerCard *)dealNextCard {
    int x = arc4random() % _cardNum;
    PokerCard *card = [_pokers objectAtIndex:x];
    [_pokers removeObjectAtIndex:x];
    _cardNum--;
    return card;
}

    #pragma mark - Button Action

- (void)clickDoubleButton {
    if ([_player canDouble]) {
        UIImageView *card = [self performSelector:@selector(dealNextCard)];
        [_player.playerCards addObject:card];
        NSInteger ind = _player.playerCards.count;
        [self.view addSubview:({
            [card setFrame:CGRectMake(self.view.frame.size.width * ind / 10, self.view.frame.size.height / 2 + self.view.frame.size.width * 8 / 50 + 20, self.view.frame.size.width / 4, self.view.frame.size.width * 3 / 8)];
            card;
        })];
        //Double操作之后无论是否超过21都无法再继续要牌
        [_player setIsEnd:YES];
        [_player calCardsTotalValue];
    }

    if ([_dealer canAddCard]) {
        UIImageView *card = [self performSelector:@selector(dealNextCard)];
        [_dealer.dealerCards addObject:card];
        NSInteger ind = _dealer.dealerCards.count;
        [self.view addSubview:({
            PokerCard *backCard = [[PokerCard alloc]initWithFrame:CGRectMake(self.view.frame.size.width * ind / 10, self.view.frame.size.height / 5, self.view.frame.size.width / 4, self.view.frame.size.width * 3 / 8)];
            backCard.image = [UIImage imageNamed:@"icon.bundle/poker-0.png"];
            backCard;
        })];
        [_dealer calCardsTotalValue];
    }

    //每次操作后都需判断游戏是否结束
    [self performSelector:@selector(judgeWhetherGameHasEnded)];
}

- (void)clickHitButton {
    if ([_player canHit]) {
        UIImageView *card = [self performSelector:@selector(dealNextCard)];
        [_player.playerCards addObject:card];
        NSInteger ind = _player.playerCards.count;
        [self.view addSubview:({
            [card setFrame:CGRectMake(self.view.frame.size.width * ind / 10, self.view.frame.size.height / 2 + self.view.frame.size.width * 8 / 50 + 20, self.view.frame.size.width / 4, self.view.frame.size.width * 3 / 8)];
            card;
        })];
        [_player calCardsTotalValue];
    }

    if ([_dealer canAddCard]) {
        UIImageView *card = [self performSelector:@selector(dealNextCard)];
        [_dealer.dealerCards addObject:card];
        NSInteger ind = _dealer.dealerCards.count;
        [self.view addSubview:({
            PokerCard *backCard = [[PokerCard alloc]initWithFrame:CGRectMake(self.view.frame.size.width * ind / 10, self.view.frame.size.height / 5, self.view.frame.size.width / 4, self.view.frame.size.width * 3 / 8)];
            backCard.image = [UIImage imageNamed:@"icon.bundle/poker-0.png"];
            backCard;
        })];
        [_dealer calCardsTotalValue];
    }
    //每次操作后都需判断游戏是否结束
    [self performSelector:@selector(judgeWhetherGameHasEnded)];
}

- (void)clickStandButton {
    _player.isEnd = YES;

    if ([_dealer canAddCard]) {
        UIImageView *card = [self performSelector:@selector(dealNextCard)];
        [_dealer.dealerCards addObject:card];
        NSInteger ind = _dealer.dealerCards.count;
        [self.view addSubview:({
            PokerCard *backCard = [[PokerCard alloc]initWithFrame:CGRectMake(self.view.frame.size.width * ind / 10, self.view.frame.size.height / 5, self.view.frame.size.width / 4, self.view.frame.size.width * 3 / 8)];
            backCard.image = [UIImage imageNamed:@"icon.bundle/poker-0.png"];
            backCard;
        })];
        [_dealer calCardsTotalValue];
    }

    //每次操作后都需判断游戏是否结束
    [self performSelector:@selector(judgeWhetherGameHasEnded)];
}

- (void)clickBackButton {
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)clickRetryButton{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Judge Game

- (void)clickResultButton {
    [_player calCardsTotalValue];
    [_dealer calCardsTotalValue];
    
    //展示dealer的手牌
    NSInteger num = _dealer.dealerCards.count;
    for (int ind = 0; ind < num; ind++) {
        PokerCard *card = [_dealer.dealerCards objectAtIndex:ind];
        [self.view addSubview:({
            [card setFrame:CGRectMake(self.view.frame.size.width * (ind + 1) / 10, self.view.frame.size.height / 5, self.view.frame.size.width / 4, self.view.frame.size.width * 3 / 8)];
            card;
        })];
    }
    [self performSelector:@selector(judgeGameResult)];
    [self.resultButton setHidden:YES];
    [self.retryButton setHidden:NO];
}


- (void)judgeWhetherGameHasEnded {
    if (_player.isEnd && _dealer.isEnd) {
        [_hitButton setHidden:YES];
        [_doubleButton setHidden:YES];
        [_standButton setHidden:YES];
        [_resultButton setHidden:NO];
    }
}

- (void)judgeGameResult {
    NSInteger playerPoints = _player.cardsTotalValue;
    NSInteger dealerPoints = _dealer.cardsTotalValue;

    NSInteger playerCardNum = _player.playerCards.count;
    NSInteger dealerCardNum = _dealer.dealerCards.count;

    //两张牌且点数为21，则isBlackJack = YES
    if (playerPoints == 21 && playerCardNum == 2) _player.isBlackJack = YES;
    if (dealerPoints == 21 && dealerCardNum == 2) _dealer.isBlackJack = YES;

    //同为BlackJack或同为Exploded或点数相同，则为平局
    if ((_player.isBlackJack && _dealer.isBlackJack) || (_player.isExploded && _dealer.isExploded)) {
        self.isDraw = YES;
    } else if (playerPoints == dealerPoints) {
        self.isDraw = YES;
    }else if (_player.isExploded&&(!_dealer.isExploded)){
        _isPlayerWon = NO;
    }else if (_dealer.isExploded&&(!_player.isExploded)){
        _isPlayerWon = YES;
    }else {
        //点数大胜
        self.isDraw = NO;
        self.isPlayerWon = playerPoints > dealerPoints ? YES : NO;
    }

    [self performSelector:@selector(changeAccount)];
}

- (void)changeAccount {
    if (self.isDraw == NO) {
        if (self.isPlayerWon && _player.isBlackJack) {
            self.property += self.bet * 1.5;
        } else if (self.isPlayerWon && (!_player.isBlackJack)) {
            self.property += self.bet;
        } else if ((!self.isPlayerWon) && _dealer.isBlackJack) {
            self.property -= self.bet * 1.5;
        } else if ((!self.isPlayerWon) && (!_dealer.isBlackJack)) {
            self.property -= self.bet;
        }
    }
    
    NSInteger account = self.property;
    NSString *propertyStr = [NSString stringWithFormat:@"%ld", (long)account];
    [[NSUserDefaults standardUserDefaults]setValue:propertyStr forKey:@"property"];

    //修改player账户后显示新账户余额
    for (int i = 0; i < propertyStr.length; i++) {
        NSString *ind = [propertyStr substringWithRange:NSMakeRange(i, 1)];
        [self.view addSubview:({
            UIImageView *imageView = [[NumImageView alloc]initWithNumStr:ind count:propertyStr.length index:i];
            imageView;
        })];
    }
    NSLog(@"");
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
