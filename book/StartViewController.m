//
//  StartViewController.m
//  book
//
//  Created by chenxb on 17/1/16.
//  Copyright © 2017年 grace. All rights reserved.
//

#import "StartViewController.h"
#import "PYTabBarController.h"
#import "AppDelegate.h"
#import "Commons.h"


@implementation StartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.start_imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, YQ_SCREEN_WIDTH, YQ_SCREEN_HEIGHT)];
    self.start_imageView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.start_imageView];
    
    self.start_imageView.image = [UIImage imageNamed:@"Default-1136"];
    
    
    self.top_imageView = [[UIImageView alloc] init];
    self.top_imageView.backgroundColor = [UIColor clearColor];
    self.top_imageView.clipsToBounds = YES;
    self.top_imageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.start_imageView addSubview:self.top_imageView];
    
    [self performSelector:@selector(switchToMain) withObject:nil afterDelay:3.0];
//    [self switchToMain];

}

- (void) switchToMain
{
    PYTabBarController *nav = [[PYTabBarController alloc] init];
    [AppDelegate shareInstance].window.rootViewController = nav;
    [[AppDelegate shareInstance].window makeKeyAndVisible];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
