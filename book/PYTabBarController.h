//
//  代码地址: https://github.com/iphone5solo/PYTheme
//  代码作者: https://github.com/iphone5solo
//
//  Created by CoderKo1o.
//  Copyright © 2016年 iphone5solo. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "PYNavigationController.h"

@interface PYTabBarController : UITabBarController

@property (nonatomic, retain) UIViewController *homeViewController;
@property (nonatomic, retain) UIViewController *mallViewController;
@property (nonatomic, retain) UIViewController *recordViewController;
@property (nonatomic, retain) UIViewController *contactViewController;
@property (nonatomic, retain) UIViewController *selfViewController;
@property (nonatomic, retain) PYNavigationController *navigationController;

@end
