//
//  VDHTTPRequestOperationManager.m
//  chatDemo
//
//  Created by Donald on 16/9/10.
//  Copyright © 2016年 123. All rights reserved.
//

#import "VDHTTPRequestOperationManager.h"

@implementation VDHTTPRequestOperationManager
- (instancetype)initWithBaseURL:(NSURL *)url
{
    self = [super initWithBaseURL:url];
    if(self)
    {
        self.requestSerializer = [AFHTTPRequestSerializer serializer];
        self.responseSerializer = [AFHTTPResponseSerializer serializer];
        self.responseSerializer.acceptableContentTypes = [self.responseSerializer.acceptableContentTypes setByAddingObject:@"text/plain"];
        //[[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];
    }
    return self;
}
@end
