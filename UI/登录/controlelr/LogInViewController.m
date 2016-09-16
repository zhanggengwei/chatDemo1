//
//  LogInViewController.m
//  chatDemoWDdemo
//
//  Created by 123 on 16/6/9.
//  Copyright © 2016年 123. All rights reserved.
//

#import "LogInViewController.h"
//#import "EMChatManagerLoginDelegate.h"
//#import <commonDefs.h>
//#import <EaseMob.h>
//#import <EMError.h>
#import "RJListTableViewController.h"
#import "VDRequestEngine.h"
#import "NSString+MD5.h"
@interface LogInViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *IconimageView;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@property (weak, nonatomic) IBOutlet UITextField *numberPassword;
@property (weak, nonatomic) IBOutlet UITextField *passWord;

@end
@implementation LogInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.IconimageView.layer.cornerRadius = self.IconimageView.frame.size.width * 0.5;
  
    
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)RegisterBtn:(id)sender {
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnAction:(id)sender {
 
//    [[RJChatTools shareManager] login:self.numberPassword.text andPassword:self.passWord.text];
    
//    [[VDRequestEngine shareEngine]requsetLoginResponse:^(id aTaskResponse) {
//    
//    } Account:self.numberPassword.text passWord:[self.passWord.text md5]];
//    
//    - (void)requsetLoginResonse:(PPResponseBlock())responseBlock Account:(NSString *)account passWord:(NSString *)pasWord
    
    [[VDRequestEngine shareEngine] requsetLoginResonse:^(id aTaskResponse) {
        
    } Account:self.numberPassword.text passWord:[self.passWord.text md5]];
    
    
    
//    [[VDRequestEngine shareEngine]requestResetPassWordResponse:^(id aTaskResponse) {
//        
//    } Account:self.numberPassword.text passWord:[self.passWord.text md5] Code:@"1234"];
//    
//    UIImage * image = [UIImage imageNamed:@"F0909355-AE2A-4DEE-9CEB-71D748D33359.jpg"];
//    [[VDRequestEngine shareEngine]requestRegisterResponse:^(id aTaskResponse) {
//        
//    } Account:@"+8618863000000" passWord:[@"123456" md5] userNickName:@"张三" Code:@"1234" Birthday:@"1977-03-13 00:00:00" weChatID:nil Sex:@"M" iconImageFiles:image];
//    
//    
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
