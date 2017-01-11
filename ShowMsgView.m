//
//  ShowMsgView.m
//  AFnetWorkingOCReuse
//
//  Created by lotawei on 17/1/11.
//  Copyright © 2017年 lotawei. All rights reserved.
//

#import "ShowMsgView.h"
#import "SVProgressHUD.h"
@implementation ShowMsgView

//底层封装一个菊花君
+(void)hudshow:(BOOL)showhud{
    if (showhud) {
        [SVProgressHUD  show];
    }
    else{
        [SVProgressHUD  dismiss];
    }
}
+(void)hudshow:(BOOL)showhud msg:(NSString*)msg{
    if (showhud) {
        [SVProgressHUD  showWithStatus:msg];
    }
    else{
        [SVProgressHUD  dismiss];
    }
}

@end
