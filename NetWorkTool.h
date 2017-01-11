//
//  NetWorkTools.h
//  AFnetWorkingOCReuse
//
//  Created by lotawei on 16/12/27.
//  Copyright © 2016年 lotawei. All rights reserved.
//
//两种方式 封装

#import <Foundation/Foundation.h>

#import  "AFNetworking.h"
typedef enum{
    requestTypeGET,
    requestTypePOST
}requestType;
//NSString  * _Nonnull  const apibaseurl = @"https://www.baidu.com";
//宏定义成功block 回调成功后得到的信息
typedef void (^HttpSuccess)(  id _Nonnull  data);
//宏定义失败block 回调失败信息
typedef void (^HttpFailure)(NSError  * _Nonnull error);

@interface NetWorkTool : AFHTTPSessionManager
//单例
+ (instancetype __nonnull)shareNetworkTool;
//第一次封装参数比较多,比较长
- (void)requestWithType:(requestType)type URLString:(nonnull NSString *)URLString parameters:(nullable id)parameters progress:(nullable void (^)(NSProgress *_Nonnull downloadProgress))downloadProgress success:(nullable void (^)(NSURLSessionDataTask *_Nullable task, id _Nullable responseObject))success
                failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError *_Nonnull error))failure;

//第二次封装,简化参数,把没有用的progress参数去掉
-(void)requestWithType:(requestType)type URLString:(nonnull NSString *)URLString parameters:(nullable id)parameters success:(nullable void (^)(id _Nullable responseObject))success  failure:(nullable void (^)(NSError *_Nonnull error))failure  iscustom:(BOOL)custom;

//第三次封装,直接使用类方法,外部调用单例都不用创建
+ (void)requestWithType:(requestType)type URLString:(nonnull NSString *)URLString parameters:(nullable id)parameters success:(nullable void (^)(id _Nullable responseObject))success  failure:(nullable void (^)(NSError *_Nonnull error))failure;
//自定义异常处理的方式
+ (void)requestWithcustomType:(requestType)type URLString:(nonnull NSString *)URLString parameters:(nullable id)parameters success:(nullable void (^)(id _Nullable responseObject))success  failure:(nullable void (^)(NSError *_Nonnull custom))failure;
//////GET 请求
//+(void)getWithUrlString:(NSString *_Nullable)urlString success:(HttpSuccess _Nullable)success failure:(HttpFailure _Nullable)failure;
//
//
////post请求
//+(void)postWithUrlString:(NSString *_Nullable)urlString parameters:(NSDictionary *_Nullable)parameters success:(HttpSuccess _Nullable)success failure:(HttpFailure _Nullable)failure;







@end
