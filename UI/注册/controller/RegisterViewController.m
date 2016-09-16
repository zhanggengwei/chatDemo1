//
//  RegisterViewController.m
//  chatDemoWDdemo
//
//  Created by 123 on 16/6/9.
//  Copyright © 2016年 123. All rights reserved.
//

#import "RegisterViewController.h"
#import "RJBackView.h"
#import "UIButton+ButtonThread.h"



@interface RegisterViewController ()

@property (weak, nonatomic) IBOutlet RJBackView *backView;
@property (weak, nonatomic) IBOutlet UITextField *PassWord;
@property (weak, nonatomic) IBOutlet UIButton *getCodeBtn;
@property (weak, nonatomic) IBOutlet UITextField *numberText;
@property (weak, nonatomic) IBOutlet UIButton *backBtn;
@end

@implementation RegisterViewController
- (IBAction)backController:(id)sender {

    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}





//进行验证码获取的方法
- (IBAction)BtnCodeAction:(id)sender {
    
//    if([self.RJNumberTextField.text checkPhoneNumInput]){
//        //进行 手机的注册
    [self.getCodeBtn startTime];

    
    
    


    
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    self.backView.layer.cornerRadius = 10;
    self.backView.layer.masksToBounds = YES;
      self.backBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 50);
    [self.backBtn setBackgroundImage:[UIImage imageNamed:@"返回按钮"] forState:UIControlStateNormal];
    
    
    
    [self.getCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)registerBtn:(id)sender {
    

    
}



@end
