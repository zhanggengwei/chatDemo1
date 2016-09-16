//
//  VDSelectImageViewController.m
//  chatDemo
//
//  Created by vd on 16/9/16.
//  Copyright © 2016年 vd. All rights reserved.
//

#import "VDSelectImageViewController.h"

@interface VDSelectImageViewController ()

@end

@implementation VDSelectImageViewController

+(instancetype)createVDSelectImageViewController
{
    return [[UIStoryboard storyboardWithName:@"VDSelectImageViewController" bundle:nil] instantiateViewControllerWithIdentifier:NSStringFromClass(self.class)];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
