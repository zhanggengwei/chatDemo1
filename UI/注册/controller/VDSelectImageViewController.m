//
//  VDSelectImageViewController.m
//  chatDemo
//
//  Created by vd on 16/9/16.
//  Copyright © 2016年 vd. All rights reserved.
//

#import "VDSelectImageViewController.h"
#import "UIViewController+VDAlertController.h"
#import <LECropPictureViewController/LECropPictureViewController.h>

@interface VDSelectImageViewController ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *selectIconImageView;

@end

@implementation VDSelectImageViewController

+(instancetype)createVDSelectImageViewController
{
    return [[UIStoryboard storyboardWithName:@"VDSelectImageViewController" bundle:nil] instantiateViewControllerWithIdentifier:NSStringFromClass(self.class)];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.selectIconImageView.image = [UIImage imageNamed:@"add.png"];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark tapAction
- (IBAction)tapAction:(id)sender
{
    
    [self.selectIconImageView showImageView];

   // [self createAlertControllerTitle:@"图片" messageString:@"图片选择方法" ActionTitles:@[@"拍照",@"照片库"] SelectorName:@[@"actionTakePhoto:",@"actionSelectPhotoFromPhotoLibrary"]];
}
- (void)actionTakePhoto//:(id)sender
{
    NSLog(@"take photo");
}
- (void)actionSelectPhotoFromPhotoLibrary//:(id)sender
{
    NSLog(@"take library");
    UIImagePickerController * pickerController = [UIImagePickerController new];
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary])
    {
        pickerController.delegate = self;
        pickerController.editing = NO;
        [self presentViewController:pickerController animated:YES completion:nil];
        
    }
    
}

#pragma mark UIImagePickerControllerDelegate

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
    
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    NSLog(@"info == %@",info);
    UIImage * image = info[@"UIImagePickerControllerOriginalImage"];
    [picker dismissViewControllerAnimated:NO completion:nil];
    LECropPictureViewController * controller = [[LECropPictureViewController alloc]initWithImage:image andCropPictureType:LECropPictureTypeRect];

    controller.photoAcceptedBlock = ^(UIImage * image)
    {
        NSLog(@"%@",image);
        self.selectIconImageView.image = image;
        
    };
    [self presentViewController:controller animated:YES completion:^{
        
    }];
}


@end
