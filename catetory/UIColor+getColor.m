//
//  UIColor+getColor.m
//  RJ91zhuanjiahao
//
//  Created by 123 on 15/12/3.
//  Copyright © 2015年 123. All rights reserved.
//

#import "UIColor+getColor.h"

@implementation UIColor (getColor)
+(UIColor*) getColorByString:(NSString *)strcolor{

    if(strcolor.length <=0 ||strcolor == nil)
        return nil;
    
    
    char temp1 = [strcolor characterAtIndex:1];
    
    char temp2 = [strcolor characterAtIndex:2];
    
    
    
    
    int red =  ((temp1 >='a' && temp1 <= 'z' ? (temp1 - 'a' + 10):(temp1 - '0')))* 16 +((temp2 >='a' && temp2 <= 'z' ? (temp2 - 'a' + 10):(temp2 - '0'))) ;
    temp1 = [strcolor characterAtIndex:3];
    temp2 = [strcolor characterAtIndex:4];
    int green =  ((temp1 >='a' && temp1 <= 'z' ? (temp1 - 'a' + 10):(temp1 - '0')))* 16 +((temp2 >='a' && temp2 <= 'z' ? (temp2 - 'a' + 10):(temp2 - '0'))) ;
    
    temp1 = [strcolor characterAtIndex:5];
    temp2 = [strcolor characterAtIndex:6];
    int blue =  ((temp1 >='a' && temp1 <= 'z' ? (temp1 - 'a' + 10):(temp1 - '0')))* 16 +((temp2 >='a' && temp2 <= 'z' ? (temp2 - 'a' + 10):(temp2 - '0')));
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:1];
    

}
@end
