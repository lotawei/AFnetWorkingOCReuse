//
//  NetWorkTools.m
//  AFnetWorkingOCReuse
//
//  Created by lotawei on 16/12/27.
//  Copyright © 2016年 lotawei. All rights reserved.
//
#import "NetWorkTool.h"
#import "ErrorHandler.h"
#import "CustomErrorHandler.h"
#import "ShowMsgView.h"
@implementation NetWorkTool
/////////////////方式一
static NetWorkTool *instance = nil;

+ (instancetype)shareNetworkTool {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        NSURLSessionConfiguration   *config = [NSURLSessionConfiguration   defaultSessionConfiguration];
        config.timeoutIntervalForRequest = 10;
        instance = [[NetWorkTool alloc]initWithSessionConfiguration:config];
        //  让AFN默认也支持接收text/html文件类型
        instance.responseSerializer.acceptableContentTypes
        = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html",@"text/plain", nil];
        instance.responseSerializer = [AFHTTPResponseSerializer serializer];
    });
    return instance;
}

//MARK: 一次封装的网络工具类
- (void)requestWithType:(requestType)type URLString:(NSString *)URLString parameters:(nullable id)parameters progress:(nullable void (^)(NSProgress *downloadProgress))downloadProgress success:(nullable void (^)(NSURLSessionDataTask *task, id _Nullable responseObject))success
                failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError *error))failure{
    if (type == requestTypeGET) {
        [instance GET:URLString parameters:parameters progress:downloadProgress success:success failure:failure];
    } else if (type == requestTypePOST) {
        [instance POST:URLString parameters:parameters progress:downloadProgress success:success failure:failure];
    }
}

//MARK: 二次封装的网络工具类  默认处理异常的方式
- (void)requestWithType:(requestType)type URLString:(nonnull NSString *)URLString parameters:(nullable id)parameters success:(nullable void (^)(id _Nullable responseObject))success  failure:(nullable void (^)(NSError *_Nonnull error))failure  iscustom:(BOOL)custom{
    //(nullable void (^)(NSURLSessionDataTask *task, id _Nullable responseObject))success
    void (^orginalSuccess)(NSURLSessionDataTask * _Nullable, id  _Nullable) = ^(NSURLSessionDataTask * _Nullable task, id  _Nullable responseObject) {
        //        success((NSDictionary *)responseObject);
        success(responseObject);
        [ShowMsgView   hudshow:false];
    };
    //(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError *error))failure
    void (^orginalFailure)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull) = ^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
         [ShowMsgView   hudshow:false];
         //默认处理行为
        if (!custom) {
                   [ErrorHandler errorop:error];
        }
        else{
            
            [CustomErrorHandler  errorop:error];
            
        }
        
    };
    [self requestWithType:type URLString:URLString parameters:parameters progress:nil success:orginalSuccess failure:orginalFailure];
}
//自定义异常处理的方式

//MARK: 三次封装的网络工具类
+ (void)requestWithType:(requestType)type URLString:(nonnull NSString *)URLString parameters:(nullable id)parameters success:(nullable void (^)(id _Nullable responseObject))success  failure:(nullable void (^)(NSError *_Nonnull error))failure {
    
    [ShowMsgView  hudshow:true];
    
    [[NetWorkTool shareNetworkTool] requestWithType:type URLString:URLString parameters:parameters success:success failure:failure iscustom:NO];
}

+ (void)requestWithcustomType:(requestType)type URLString:(nonnull NSString *)URLString parameters:(nullable id)parameters success:(nullable void (^)(id _Nullable responseObject))success  failure:(nullable void (^)(NSError *_Nonnull custom))failure {
    
    [ShowMsgView  hudshow:true];
    
    [[NetWorkTool shareNetworkTool] requestWithType:type URLString:URLString parameters:parameters success:success failure:failure iscustom:YES];
}









///////////////////////////////////////方式二


////GET请求
//+(void)getWithUrlString:(NSString *)urlString success:(HttpSuccess)success failure:(HttpFailure)failure{
//    //创建请求管理者
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//    //内容类型
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json",@"text/javascript",@"text/html", nil];
//    //get请求
//    [manager GET:urlString parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
//        //数据请求的进度
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        success(responseObject);
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        failure(error);
//    }];
//    
//}
//
////POST请求
//+(void)postWithUrlString:(NSString *)urlString parameters:(NSDictionary *)parameters success:(HttpSuccess)success failure:(HttpFailure)failure{
//    //创建请求管理者
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    //
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//    //内容类型
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json",@"text/javascript",@"text/html", nil];
//    //post请求
//    [manager POST:urlString parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
//        //数据请求的进度
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        success(responseObject);
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        failure(error);
//    }];
//}






@end
