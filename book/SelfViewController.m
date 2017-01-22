//
//  SelfViewController.m
//  book
//
//  Created by chenxb on 17/1/18.
//  Copyright © 2017年 grace. All rights reserved.
//

#import "SelfViewController.h"
#import "PYTempCollectionViewController.h"
#import "Commons.h"
#import "ColorUtil.h"
#import "ColorBackButton.h"
#import "ColorLabel.h"
#import "AFNetworkUtil.h"
#import "Preload.h"

@interface SelfViewController ()

@end

@implementation SelfViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    ColorLabel *text = [[ColorLabel alloc]init];
    text.textColor = [ColorUtil getThemeColor];
    [text setText:@"SelfViewController"];
    text.frame= CGRectMake(50, 100, 300, 50);
    [self.view addSubview:text];
    
    ColorBackButton *btn = [[ColorBackButton alloc] initWithFrame:CGRectMake(140, 300, 100, 50)];
    [btn setBackgroundImage:[ColorUtil createImageWithColor:[ColorUtil getThemeColor]] forState:UIControlStateNormal];
    [btn setTitle:@"click" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(gotoChangeTheme) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"application/x-javascript", nil];

    [manager GET:@"http://newtest.yiqi1717.com:9000/preload"
      parameters:@{
                     @"channel_id":@"1",
                     @"ver":@"20151111"
                  }
      progress:nil
    success:^(NSURLSessionTask *task, id responseObject) {
        Preload *preload = [[Preload alloc] initWithJsonObject:responseObject error:nil];
        int ret = preload.ret;
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)gotoChangeTheme {
    PYTempCollectionViewController *vc = [[PYTempCollectionViewController alloc] init];
    [self presentModalViewController:vc animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
