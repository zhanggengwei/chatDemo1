//
//  RJBaseViewController.m
//  chatDemo
//
//  Created by vd on 16/7/31.
//  Copyright © 2016年 123. All rights reserved.
//

#import "RJBaseViewController.h"
#import "AppDelegate.h"
@interface RJBaseViewController ()
@property (nonatomic,strong) UIBarButtonItem * rightItem;
@end

@implementation RJBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"添加" style:UIBarButtonItemStylePlain target:self action:nil];
    
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(LoginState:) name:LOGINSUCESS object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(LoginState:) name:LOGOUTSUCESS object:nil];
    
    
    
    // Do any additional setup after loading the view.
}

-(void)LoginState:(NSNotification *)noti{
    NSNumber * obj = noti.object;
      AppDelegate * app = [UIApplication sharedApplication].delegate;
    if(obj.boolValue){
      
        app.window.rootViewController = [RJEngineManager shareManager].leftViewController;
    
    
    }else{
        app.window.rootViewController = [RJEngineManager shareManager].loginViewControlelr;
    
    
    }
    
    



}

-(UIBarButtonItem *)rightItem{
    if(_rightItem==nil){
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(0, 0, 60, 50);
        _rightItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
        [btn addTarget:self action:@selector(clickRightAction:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _rightItem;
}

-(void)clickRightAction:(id)sender{



}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
