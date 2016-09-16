//
//  RJAddContactPersonViewController.m
//  chatDemo
//
//  Created by vd on 16/7/31.
//  Copyright © 2016年 123. All rights reserved.
//

#import "RJAddContactPersonViewController.h"
//#import "RJChatTools.h"
@interface RJAddContactPersonViewController ()
@property (weak, nonatomic) IBOutlet UITextField *numberText;

@end

@implementation RJAddContactPersonViewController
- (IBAction)AddPerson:(id)sender {
    
    
    //[[RJChatTools shareManager] addPerson:self.numberText.text andUserMessage:@"你好"];
    

}

+(instancetype)createRJAddContactPersonViewController{
    UIStoryboard * storyboard = [UIStoryboard storyboardWithName:@"AddContact" bundle:nil];
    
    return [storyboard instantiateViewControllerWithIdentifier:NSStringFromClass(self.class)];
    
    


}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
