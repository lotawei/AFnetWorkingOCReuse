
//
//  ErrorHandler.m
//  AFnetWorkingOCReuse
//
//  Created by lotawei on 16/12/28.
//  Copyright © 2016年 lotawei. All rights reserved.
//

#import "ErrorHandler.h"

@implementation ErrorHandler

-(void)customerroroperate{
    
    NSString *exceptionName = @"自定义异常未实现";
    //异常的原因
    NSString *exceptionReason = @"ErrorHandler 继承的子类必须实现customerroroperate方法";
    //异常的信息
    NSDictionary *exceptionUserInfo = nil;
    
    NSException *exception = [NSException exceptionWithName:exceptionName reason:exceptionReason userInfo:exceptionUserInfo];
    
    NSString *aboutMe = @"ErrorHandler 继承的子类必须实现customerroroperate方法";
    
    if ([aboutMe isEqualToString:@"ErrorHandler 继承的子类必须实现customerroroperate方法"]) {
        //抛异常
        @throw exception;
    }
}
-(instancetype)initWithDomain:(NSErrorDomain)domain code:(NSInteger)code userInfo:(NSDictionary *)dict{
    if (self == [super initWithDomain:domain code:code userInfo:dict]) {
        
        [self defaluterror];
    }
    return self;
    
}
-(BOOL)iscustom{
    return  false;
}
-(void)defaluterror{
    if ([self  iscustom]) {
        [self customerroroperate];
    }
    
    //即使自定义也有默认行为处理
    switch (self.code) {
            case -1003:
                NSLog(@"默认——1003处理");
                break;
                
            default:
                break;
        }
        NSLog(@"默认%ld",self.code);
        
    
    
}
+(instancetype)errorop:(NSError *)error{
    
    ErrorHandler   *handler = [[ErrorHandler  alloc]initWithDomain:error.domain code:error.code userInfo:error.userInfo];
    return   handler;
    
    
    
}

@end
