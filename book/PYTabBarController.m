//
//  代码地址: https://github.com/iphone5solo/PYTheme
//  代码作者: https://github.com/iphone5solo
//
//  Created by CoderKo1o.
//  Copyright © 2016年 iphone5solo. All rights reserved.
//

#import "PYTabBarController.h"
#import "PYTempCollectionViewController.h"
#import "HomeMainViewController.h"
#import "HomeMallViewController.h"
#import "HomeRecordViewController.h"
#import "HomeContactViewController.h"
#import "HomeSelfViewController.h"
#import "Commons.h"
#import "UIViewController+PYExtension.h"
#import "ColorUtil.h"

@interface PYTabBarController ()


@end

@implementation PYTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 首页
    _homeViewController = [[HomeMainViewController alloc] init];
    _mallViewController = [[HomeMallViewController alloc] init];
    _recordViewController = [[HomeRecordViewController alloc] init];
    _contactViewController = [[HomeContactViewController alloc] init];
    _selfViewController = [[HomeSelfViewController alloc] init];
    [self addChildViewController:_mallViewController image:@"tab_home_nor" seletedImage:@"tab_home_press" title:@"Home"];
    [self addChildViewController:_recordViewController image:@"tab_classify_nor"  seletedImage:@"tab_classify_press"  title:@"Classify"];
    [self addChildViewController:_homeViewController image:@"tab_publish_nor" seletedImage:@"tab_publish_nor" title:nil];
    [self addChildViewController:_contactViewController image:@"tab_community_nor"  seletedImage:@"tab_community_press"  title:@"Community"];
    [self addChildViewController:_selfViewController image:@"tab_me_nor"  seletedImage:@"tab_me_press"  title:@"Me"];
    
    [self addNotification];
    
    [self changeTheme:[ColorUtil getThemeColor]];
}

- (UIViewController *)addChildViewController:(UIViewController *)childController image:(NSString *)image seletedImage:(NSString *)selectedImage title:(NSString *)title
{
    // 设置标题
    childController.title = title;

    // 设置字体颜色
    NSMutableDictionary *attrNol = [NSMutableDictionary dictionary];
    attrNol[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    [childController.tabBarItem setTitleTextAttributes:attrNol forState:UIControlStateNormal];
    
    // 设置图片
    [childController.tabBarItem setImage:[[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [childController.tabBarItem setSelectedImage:[[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    
    // 包装导航条
    _navigationController = [[PYNavigationController alloc] initWithRootViewController:childController];
    // 添加子控制器
    [self addChildViewController:_navigationController];
    
    return childController;
}



- (void) changeTheme:(UIColor*) color{
    NSMutableDictionary *attrNol = [NSMutableDictionary dictionary];
    attrNol[NSForegroundColorAttributeName] = color;
    
    [_homeViewController.tabBarItem setTitleTextAttributes:attrNol forState:UIControlStateSelected];
    [_mallViewController.tabBarItem setTitleTextAttributes:attrNol forState:UIControlStateSelected];
    [_recordViewController.tabBarItem setTitleTextAttributes:attrNol forState:UIControlStateSelected];
    [_contactViewController.tabBarItem setTitleTextAttributes:attrNol forState:UIControlStateSelected];
    [_selfViewController.tabBarItem setTitleTextAttributes:attrNol forState:UIControlStateSelected];
    
    [_homeViewController.navigationController.navigationBar setBarTintColor:color];
    [_mallViewController.navigationController.navigationBar setBarTintColor:color];
    [_recordViewController.navigationController.navigationBar setBarTintColor:color];
    [_contactViewController.navigationController.navigationBar setBarTintColor:color];
    [_selfViewController.navigationController.navigationBar setBarTintColor:color];
    self.tabBar.tintColor = color;
}


@end
