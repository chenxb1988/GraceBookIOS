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

@interface SelfViewController ()

@end

@implementation SelfViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    UITextView *text = [[UITextView alloc]init];
    text.textColor = [UIColor redColor];
    [text setText:@"SelfViewController"];
    text.frame= CGRectMake(0, 0, ScreenWidth, ScreenHeight/3);
    [self.view addSubview:text];
    
    ColorBackButton *btn = [[ColorBackButton alloc] initWithFrame:CGRectMake(140, 100, 100, 50)];
    [btn setBackgroundImage:[ColorUtil createImageWithColor:[UIColor greenColor]] forState:UIControlStateNormal];
    [btn setTitle:@"click" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(gotoChangeTheme) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
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
