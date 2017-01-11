//
//  CustomErrorHandler.m
//  AFnetWorkingOCReuse
//
//  Created by lotawei on 17/1/10.
//  Copyright © 2017年 lotawei. All rights reserved.
//

#import "CustomErrorHandler.h"
#import "ShowMsgView.h"
@implementation CustomErrorHandler

-(BOOL)iscustom{
    return true;
}

-(void)customerroroperate{
    
    
    
    NSString   *errinfo =  [NSString  stringWithFormat: @"自定义处理%ld,%@",(long)self.code,self.userInfo];
    [ShowMsgView  hudshow:true msg:errinfo];
    
    
}
+(instancetype)errorop:(NSError *)error{
    
       CustomErrorHandler   *handler = [[CustomErrorHandler  alloc]initWithDomain:error.domain code:error.code userInfo:error.userInfo];
    
    return handler;
}


@end
