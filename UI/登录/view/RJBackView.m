//
//  RJBackView.m
//  RJ91zhuanjiahao
//
//  Created by 123 on 16/4/7.
//  Copyright © 2016年 123. All rights reserved.
//

#import "RJBackView.h"
#import "UIColor+getColor.h"
@implementation RJBackView


- (void)drawRect:(CGRect)rect {
    
    
    
    for (int i =0; i < 3; i++) {
        [[UIColor getColorByString:@"#dddddd"]set];
        
        UIBezierPath * path = [UIBezierPath bezierPathWithRect:CGRectMake(0,45*(i+1), rect.size.width,0.7)];
        path.lineWidth = 0.7;
        
        
        // [path stroke];
        [path fill];
        
        
        
    }
   
}

@end
