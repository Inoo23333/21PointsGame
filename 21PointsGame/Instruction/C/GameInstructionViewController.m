//
//  GameInstructionViewController.m
//  21PointsGame
//
//  Created by user on 2020/4/21.
//  Copyright © 2020 user. All rights reserved.
//

#import "GameInstructionViewController.h"

@interface GameInstructionViewController ()

@property(nonatomic,strong)UIButton *backButton;

@end

@implementation GameInstructionViewController

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super init];
    if(self){
        self.view.frame = frame;
        NSLog(@"");
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.view.backgroundColor = [UIColor systemPinkColor];
    
    [self.view addSubview:({
        UIImageView *backgrondView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        backgrondView.image = [UIImage imageNamed:@"icon.bundle/GameRuleBackground.png"];
        backgrondView;
    })];
    
    [self.view addSubview:({
        UIImageView *gameRuleView = [[UIImageView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height/5, self.view.frame.size.width, self.view.frame.size.width*760/635)];
        gameRuleView.image = [UIImage imageNamed:@"icon.bundle/GameRule.png"];
        gameRuleView;
    })];
    
    [self.view addSubview:({
        _backButton = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width/15, self.view.frame.size.height/15,self.view.frame.size.width/6 , self.view.frame.size.width/16)];
        [_backButton setImage:[UIImage imageNamed:@"icon.bundle/backButton.jpg"] forState:UIControlStateNormal];
        [_backButton setImage:[UIImage imageNamed:@"icon.bundle/backButton1.jpg"] forState:UIControlStateHighlighted];
        
        [self.backButton addTarget:self action:@selector(clickBackButton) forControlEvents:UIControlEventTouchUpInside];
        _backButton;
    })];
    
    // Do any additional setup after loading the view.
}

-(void)clickBackButton{
    [self.navigationController popViewControllerAnimated:YES];
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
