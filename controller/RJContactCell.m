//
//  RJContactCell.m
//  chatDemo
//
//  Created by vd on 16/7/30.
//  Copyright © 2016年 123. All rights reserved.
//

#import "RJContactCell.h"

@interface RJContactCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@end

@implementation RJContactCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.iconImage.layer.cornerRadius = self.iconImage.frame.size.width * 0.5;
    [self.iconImage.layer masksToBounds];
    self.iconImage.clipsToBounds = YES;
    self.iconImage.layer.masksToBounds = YES;
    // Initialization code
}
+(CGFloat)cellHeight{
    return 78;

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



@end
