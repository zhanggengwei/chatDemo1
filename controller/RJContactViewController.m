//
//  RJContactViewController.m
//  chatDemo
//
//  Created by vd on 16/7/30.
//  Copyright © 2016年 123. All rights reserved.
//

#import "RJContactViewController.h"
#import "RJAddContactPersonViewController.h"
@interface RJContactViewController ()
@property (weak, nonatomic) IBOutlet UITableView *RJTableView;
@property (strong,nonatomic) UIBarButtonItem * leftItem;

@end

@implementation RJContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 50, 60);
 
    [btn setImage:[self imageSize:CGSizeMake(28, 28) andImage: [UIImage imageNamed:@"add"]] forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    [btn addTarget:self action:@selector(clickRightAction:) forControlEvents:UIControlEventTouchUpInside];
    

   // self.title = [[RJChatTools shareManager] username];
    
    
    //NSArray * arr = [[RJChatTools shareManager] getContlistFromServer];
    //NSLog(@"arr == %@",arr);
    
    
    // Do any additional setup after loading the view.
}

-(UIImage *)imageSize:(CGSize )size andImage:(UIImage *)image{
  
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage * lastImage= UIGraphicsGetImageFromCurrentImageContext();
  
    UIGraphicsEndImageContext();
    return lastImage;
    

}

-(void)clickRightAction:(id)sender{
   
    [self.navigationController pushViewController:[RJAddContactPersonViewController  createRJAddContactPersonViewController] animated:YES];
    



}

-(void)showLeftController:(id)sender{


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
