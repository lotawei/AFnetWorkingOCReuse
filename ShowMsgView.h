//
//  ShowMsgView.h
//  AFnetWorkingOCReuse
//
//  Created by lotawei on 17/1/11.
//  Copyright © 2017年 lotawei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShowMsgView : NSObject
+(void)hudshow:(BOOL)showhud;
+(void)hudshow:(BOOL)showhud msg:(NSString*)msg;
@end
