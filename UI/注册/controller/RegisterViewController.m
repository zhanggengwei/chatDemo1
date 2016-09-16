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
#import "VDSelectImageViewController.h"
@interface RegisterViewController ()

@property (weak, nonatomic) IBOutlet RJBackView *backView;
@property (weak, nonatomic) IBOutlet UITextField *PassWord;
@property (weak, nonatomic) IBOutlet UIButton *getCodeBtn;
@property (weak, nonatomic) IBOutlet UITextField *numberText;
@property (weak, nonatomic) IBOutlet UIButton *backBtn;
@property (weak, nonatomic) IBOutlet UIButton *VDBottomBtn;
@end

@implementation RegisterViewController
#pragma mark life_cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.backView.layer.cornerRadius = 10;
    self.backView.layer.masksToBounds = YES;
    self.backBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 50);
    [self.backBtn setBackgroundImage:[UIImage imageNamed:@"返回按钮"] forState:UIControlStateNormal];
    [self.getCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    
    if(self.style == VDReginsterController)
    {
        [self.VDBottomBtn setTitle:@"下一步" forState:UIControlStateNormal];
    }
    else
    {
        [self.VDBottomBtn setTitle:@"完成" forState:UIControlStateNormal];
        
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Action
- (IBAction)backController:(id)sender {

    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
//进行验证码获取的方法
- (IBAction)BtnCodeAction:(id)sender {
    
//    if([self.RJNumberTextField.text checkPhoneNumInput]){
//        //进行 手机的注册
    [self.getCodeBtn startTime];

}
- (IBAction)registerBtn:(id)sender
{
    if(self.style == VDReginsterController)
    {
        VDSelectImageViewController * controller = [VDSelectImageViewController createVDSelectImageViewController];
        [self.navigationController pushViewController:controller animated:YES];
        
    }
    else if(self.style == VDResetPassWordController)
    {

    }

    
}
@end
