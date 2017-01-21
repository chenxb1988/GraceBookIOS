//
//  ContactViewController.m
//  book
//
//  Created by chenxb on 17/1/18.
//  Copyright © 2017年 grace. All rights reserved.
//

#import "ContactViewController.h"
#import "Commons.h"
#import "ColorLabel.h"
#import "ColorUtil.h"

@interface ContactViewController ()

@end

@implementation ContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    ColorLabel *text = [[ColorLabel alloc]init];
    text.textColor = [ColorUtil getThemeColor];
    [text setText:@"ContactViewController"];
    text.frame= CGRectMake(50, 100, 300, 50);
    [self.view addSubview:text];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
