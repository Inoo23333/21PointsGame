//
//  ViewController.m
//  21PointsGame
//
//  Created by user on 2020/4/21.
//  Copyright © 2020 user. All rights reserved.
//

#import "HomeViewController.h"
#import "GameInstructionViewController.h"
#import "GameRoomViewController.h"

@interface HomeViewController ()<UINavigationControllerDelegate>

@property(nonatomic,strong,readwrite)UIButton *startButton;
@property (nonatomic, strong, readwrite) UIButton *gameTeller;
@property(nonatomic,strong,readwrite)NSString *property;

@end

@implementation HomeViewController

-(instancetype)init{
    self = [super init];
    if(self){
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:@"10000" forKey:@"property"];
        [defaults synchronize];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.delegate = self;
    
    
    [self.view addSubview:({
        UIImageView *backgrondView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        backgrondView.image = [UIImage imageNamed:@"icon.bundle/home-background.png"];
        backgrondView;
    })];
    
    [self.view addSubview:({
        UIImageView *gameLabel = [[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width/6,self.view.frame.size.height/4 , self.view.frame.size.width*2/3, (self.view.frame.size.width*2/3)*9/16)];
        gameLabel.image = [UIImage imageNamed:@"icon.bundle/gameLabel.jpg"];
        gameLabel;
    })];
    
    [self.view addSubview:({
        self.startButton = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width/3, self.view.frame.size.height*5/7, self.view.frame.size.width/3, self.view.frame.size.width/6)];

        [_startButton setImage:[UIImage imageNamed:@"icon.bundle/button-start-off.png"] forState:UIControlStateNormal];
        [_startButton setImage:[UIImage imageNamed:@"icon.bundle/button-start-on.png"] forState:UIControlStateHighlighted];
        
        [self.startButton addTarget:self action:@selector(clickStartButton) forControlEvents:UIControlEventTouchUpInside];
        
        self.startButton;
    })];
    
    [self.view addSubview:({
        self.gameTeller = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width/3, self.view.frame.size.height*5/7+80, self.view.frame.size.width/3, self.view.frame.size.width/21)];
        
        [self.gameTeller setImage:[UIImage imageNamed:@"icon.bundle/gameInstruction.jpg"] forState:UIControlStateNormal];
        [self.gameTeller setImage:[UIImage imageNamed:@"icon.bundle/gameInstruction1.jpg"] forState:UIControlStateHighlighted];
        
        [self.gameTeller addTarget:self action:@selector(showGameInstruction) forControlEvents:UIControlEventTouchUpInside];
        
        self.gameTeller;
    })];
    

    
}

-(void)clickStartButton{
    NSLog(@"");
    GameRoomViewController *gameRoom = [[GameRoomViewController alloc]init];
    [self.navigationController pushViewController:gameRoom animated:YES];
    
}

-(void)showGameInstruction{
    NSLog(@"");
    GameInstructionViewController *giVC = [[GameInstructionViewController alloc]initWithFrame:self.view.frame];
    [giVC setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    [self.navigationController pushViewController:giVC animated:YES];
}




- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    [self.navigationController.navigationBar setHidden:YES];

    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
}

@end
