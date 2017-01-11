//
//  ViewController.m
//  AFnetWorkingOCReuse
//
//  Created by lotawei on 16/12/27.
//  Copyright © 2016年 lotawei. All rights reserved.
//

#import "ViewController.h"
#import "NetWorkTool.h"
#import "UIButton+AFNetworking.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //1.方式原始的 默认处理
//    [NetWorkTool   requestWithType:requestTypeGET URLString:@"https://www.baidu.wcom" parameters:nil success:^(id  _Nullable responseObject) {
//        
//        
//    } failure:^(NSError * _Nonnull error) {
//      
//       
//        
//        
//        
//    }];
    
    //2.自定义处理
    [NetWorkTool requestWithcustomType:requestTypeGET URLString:@"https://www.baidu.wcom" parameters:nil success:^(id  _Nullable responseObject) {
        
    } failure:nil];
//    1.方式原始的
//        [NetWorkTool   requestWithType:requestTypeGET URLString:@"https://www.baidu.com" parameters:nil success:^(id  _Nullable responseObject) {
//    
//            NSString   *result =  [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
//            NSLog(@"%@",result);
//        } failure:nil];
    
    
    //2.
//    [NetWorkTool    getWithUrlString:@"https://www.baidu.com" success:^(id  _Nonnull data) {
//        
//    } failure:^(NSError * _Nonnull error) {
//        
//    }];
    //3.  错误也不想处理的封装
    
    
    
//    NSInteger    p = 100;
//    NSInteger  q = 100;
//    if (p==q) {
//        NSLog(@"10等");
//    }
//    NSInteger    r = 150;
//    NSInteger  s = 150;
//    if (r == s) {
//        NSLog(@"15等");
//    }
    
    
    
    UIButton   *btn = [[UIButton   alloc]initWithFrame:CGRectMake(0, 0, 300, 100)];
    btn.backgroundColor = [UIColor   blueColor];
    [btn setTitle:@"nnnn" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(getimg:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
//    [[AFNetworkReachabilityManager   sharedManager] startMonitoring];
//      [[AFNetworkReachabilityManager   sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
//          NSLog(@"%ld",status);
//      }];
//    
    
    // Do any additional setup after loading the view, typicallny from a nib.
}

- (void)getimg:(UIButton*)sender{
    
    [sender setImageForState:UIControlStateNormal withURL:[NSURL  URLWithString:@"https://ss0.bdstatic.com/5aV1bjqh_Q23odCf/static/superman/img/logo/bd_logo1_31bdc765.png"]];
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
