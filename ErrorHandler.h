//
//  ErrorHandler.h
//  AFnetWorkingOCReuse
//
//  Created by lotawei on 16/12/28.
//  Copyright © 2016年 lotawei. All rights reserved.
//

#import <Foundation/Foundation.h>

//此类实现默认网络异常统一默认处理
@interface ErrorHandler : NSError

//是否让子类自定义异常处理
-(BOOL)iscustom;



//用于子类是否需要自定义处理异常
-(void)customerroroperate;


//方便外部以静态类实例化
+(instancetype)errorop:(NSError*)error;

@end
