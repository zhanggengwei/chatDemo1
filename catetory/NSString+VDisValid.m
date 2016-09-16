//
//  NSString+VDisValid.m
//  chatDemo
//
//  Created by Donald on 16/9/10.
//  Copyright © 2016年 123. All rights reserved.
//

#import "NSString+VDisValid.h"

@implementation NSString (VDisValid)
-(BOOL) isValid
{
    if(self==nil||self.length==0)
        return NO;
    return YES;
}
@end
